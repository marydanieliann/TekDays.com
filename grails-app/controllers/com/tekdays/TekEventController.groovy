package com.tekdays

import grails.converters.JSON
import grails.converters.XML
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional()
class TekEventController {
    def datatablesSourceService
    def taskService
    private static final Logger LOGGER = LoggerFactory.getLogger(TekEventController.class)
    def responseFormats=['json','xml','html','text']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TekEvent.list(params), model: [tekEventInstanceCount: TekEvent.count()]
    }

    def dataTablesRenderer() {
        def propertiesToRender = ["name", "city", "description", "id", "id"]
        def entityName = 'TekEvent'
        render datatablesSourceService.dataTablesSource(propertiesToRender, entityName, params)
    }

    def deleted() {
        def data = [:]
        if (params.id) {
            def tekEvent = TekEvent.get(params.id as Long)
            tekEvent.deleted = true
            if (!tekEvent.save()) {
                data['message'] = false
            } else {
                data['message'] = true
            }
        } else {
            data['message'] = "No params.id"
        }
        render data as JSON
    }


    @Transactional
    def getByID(Long id){
        TekEvent tekEvent = TekEvent.findById(id)
        if (tekEvent) {
            withFormat {
                xml { render(tekEvent as XML) }
               /* json {
                    def jsonify = tekEvent as JSON
                    jsonify.prettyPrint = true
                    render jsonify
                }
                html {
                    render {
                        H3(tekEvent, ["style": "font-family:Monospace"])
                    }
                }*/
            }
        } else response.sendError 404
    }

    def getAll() {
        def tekEvents = TekEvent.list()

        if (tekEvents) {
            withFormat {
                xml {
                    tekEvents.each{tekEvent ->
                        task{
                            name(tekEvent.name)
                        }
                    }

//                    render tekEvents as XML
                }
                json {
                    def jsonify = tekEvents.collect { [name: it.name] }
                    render jsonify
                }
                text {
                    StringBuilder stringBuilder = new StringBuilder("")
                    tekEvents.each {
                        stringBuilder.append("NAME-> ${it.name}\n")
                    }
                    render(stringBuilder.toString())
                }
                html {
                    render {
                        ul {
                            tekEvents.each {
                                li {
                                    h3("${it.name}", ["style": "font-family: Monospace"])
                                }
                            }
                        }
                    }
                }
            }
        } else {
            response.sendError 404
        }
    }



    def show(Long id) {
        def tekEventInstance
        if (params.nickname) {
            tekEventInstance = TekEvent.findByNickname(params.nickname)
        } else {
            tekEventInstance = TekEvent.get(id)
        }
        if (!tekEventInstance) {
            if (params.nickname) {
                flash.message = "TekEvent not found with nickname ${params.nickname}"
            } else {
                flash.message = "TekEvent not found with id $id"
            }
            redirect(action: "index")
            return
        }
        [tekEventInstance: tekEventInstance]
    }

    def create() {
        respond new TekEvent(params)
    }

    def search = {
        if (params.query) {
            def events = TekEvent.search(params.query).results
            [events: events]
        }
    }

    @Transactional
    def save(TekEvent tekEventInstance) {
        if (tekEventInstance == null) {
            notFound()
            return
        }

        if (tekEventInstance.hasErrors()) {
            respond tekEventInstance.errors, view: 'create'
            return
        }

        tekEventInstance.save flush: true
        taskService.addDefaultTasks(tekEventInstance)
        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message',
                        args: [message(code: 'tekEventInstance.label',
                                default: 'TekEvent'), tekEventInstance.id])
                redirect tekEventInstance
            }
            '*' { respond tekEventInstance, [status: CREATED] }
        }
    }

    def edit(TekEvent tekEventInstance) {
        respond tekEventInstance
    }

    @Transactional
    def update(TekEvent tekEventInstance) {
        if (tekEventInstance == null) {
            notFound()
            return
        }

        if (tekEventInstance.hasErrors()) {
            respond tekEventInstance.errors, view: 'edit'
            return
        }

        tekEventInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message',
                        args: [message(code: 'TekEvent.label', default: 'TekEvent'),
                               tekEventInstance.id])
                redirect view: 'index'
            }
            '*' { respond tekEventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TekEvent tekEventInstance) {
        if (tekEventInstance == null) {
            notFound()
            return
        }
        tekEventInstance.delete flush: true
        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message',
                        args: [message(code: 'TekEvent.label', default: 'TekEvent'),
                               tekEventInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message',
                        args: [message(code: 'tekEventInstance.label',
                                default: 'TekEvent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
    def volunteer = {
        def event = TekEvent.get(params.id)
        event.addToVolunteers(session.user)
        event.save()
        render "Thank you for Volunteering"
    }
}