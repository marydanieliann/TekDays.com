package com.tekdays

class DashboardController {

    def index() {}

    def dashboard = {
        def eventId = params.id as Long
        if (!eventId) {
            flash.message = "Invalid event ID."
            redirect controller: 'tekEvent', action: 'index'
            return
        }

        def event = TekEvent.findById(eventId)

        if (!event) {
            flash.message = "No event was found with an ID of ${params.id}."
            redirect controller: 'tekEvent', action: 'index'
            return
        }

        if (!(event.organizer.userName == session.user.userName ||
                event.volunteers.collect { it.userName }.contains(session.user.userName))) {
            flash.message = "Access to the dashboard for ${event.name} denied."
            redirect controller: 'tekEvent', action: 'index'
            return
        }

        def tasks = Task.findAllByEventAndCompleted(event, false,
                [sort: 'dueDate', order: 'asc', max: 3])
        def volunteers = event.volunteers
        def messages = TekMessage.findAllByEventAndParentIsNull(event,
                [sort: 'id', order: 'desc'])
        def sponsorships = event.sponsorships
        render view: 'dashboard', model: [event: event, tasks: tasks, volunteers: volunteers,
                                          messages: messages, sponsorships: sponsorships]
    }
}

