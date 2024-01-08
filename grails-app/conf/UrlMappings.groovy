class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(view: "/index")
        "500"(view: '/error')

        "/events/$nickname" {
            controller = "tekEvent"
            action = "show"
        }

        "/api/$id?/$format?" {
            controller="tekEvent"
            action=[
                    GET:'getByID',
            ]
        }

        "/tekEvent/"(controller: "tekEvent"){
            action=[GET:'index', POST:'save'/*, PUT:'update'*/]
        }

        "/api/$format?" {
            controller='tekEvent'
            action='getAll'
        }

        "/TekDays.com/tekEvent/index$lang"(controller: 'tekEvent')
        "/TekDays.com/tekEvent/create$lang"(controller: 'tekEvent')
    }
}