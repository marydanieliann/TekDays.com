package com.tekdays



import grails.test.mixin.*
import spock.lang.*

@TestFor(UserRevisionEntityController)
@Mock(UserRevisionEntity)
class UserRevisionEntityControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.userRevisionEntityInstanceList
            model.userRevisionEntityInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.userRevisionEntityInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def userRevisionEntity = new UserRevisionEntity()
            userRevisionEntity.validate()
            controller.save(userRevisionEntity)

        then:"The create view is rendered again with the correct model"
            model.userRevisionEntityInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            userRevisionEntity = new UserRevisionEntity(params)

            controller.save(userRevisionEntity)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/userRevisionEntity/show/1'
            controller.flash.message != null
            UserRevisionEntity.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def userRevisionEntity = new UserRevisionEntity(params)
            controller.show(userRevisionEntity)

        then:"A model is populated containing the domain instance"
            model.userRevisionEntityInstance == userRevisionEntity
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def userRevisionEntity = new UserRevisionEntity(params)
            controller.edit(userRevisionEntity)

        then:"A model is populated containing the domain instance"
            model.userRevisionEntityInstance == userRevisionEntity
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/userRevisionEntity/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def userRevisionEntity = new UserRevisionEntity()
            userRevisionEntity.validate()
            controller.update(userRevisionEntity)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.userRevisionEntityInstance == userRevisionEntity

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            userRevisionEntity = new UserRevisionEntity(params).save(flush: true)
            controller.update(userRevisionEntity)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/userRevisionEntity/show/$userRevisionEntity.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/userRevisionEntity/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def userRevisionEntity = new UserRevisionEntity(params).save(flush: true)

        then:"It exists"
            UserRevisionEntity.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(userRevisionEntity)

        then:"The instance is deleted"
            UserRevisionEntity.count() == 0
            response.redirectedUrl == '/userRevisionEntity/index'
            flash.message != null
    }
}
