package com.tekdays

import grails.converters.JSON
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional()
class TekEventController {
    def datatablesSourceService
    def taskService
    private static final Logger LOGGER = LoggerFactory.getLogger(TekEventController.class)
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
            redirect(action: "list")
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
                redirect tekEventInstance
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