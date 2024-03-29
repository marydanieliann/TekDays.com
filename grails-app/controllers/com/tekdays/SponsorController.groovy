package com.tekdays
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional()
class SponsorController {
    def datatablesSourceService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sponsor.list(params), model:[sponsorInstanceCount: Sponsor.count()]
    }

    def dataTablesRenderer() {
        def propertiesToRender = ["name", "website", "description", "id", "id"]
        def entityName = 'Sponsor'
        render datatablesSourceService.dataTablesSource(propertiesToRender, entityName, params)
    }

    def show(Sponsor sponsorInstance) {
        respond sponsorInstance
    }

    def create() {
        respond new Sponsor(params)
    }

    @Transactional
    def save(Sponsor sponsorInstance) {
        if (sponsorInstance == null) {
            notFound()
            return
        }

        if (sponsorInstance.hasErrors()) {
            respond sponsorInstance.errors, view:'create'
            return
        }

        sponsorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), sponsorInstance.id])
                redirect view:'index'
            }
            '*' { respond sponsorInstance, [status: CREATED] }
        }
    }

    def edit(Sponsor sponsorInstance) {
        respond sponsorInstance
    }

    @Transactional
    def update(Sponsor sponsorInstance) {
        if (sponsorInstance == null) {
            notFound()
            return
        }

        if (sponsorInstance.hasErrors()) {
            respond sponsorInstance.errors, view:'edit'
            return
        }

        sponsorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Sponsor.label', default: 'Sponsor'), sponsorInstance.id])
                redirect sponsorInstance
            }
            '*'{ respond sponsorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Sponsor sponsorInstance) {

        if (sponsorInstance == null) {
            notFound()
            return
        }

        sponsorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Sponsor.label', default: 'Sponsor'), sponsorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
