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

        "/tekEvent/"(controller: "tekEvent"){
            action=[GET:'index', PUT:'save', POST:'update']
        }

        "/TekDays.com/tekEvent/index$lang"(controller: 'tekEvent')
        "/TekDays.com/tekEvent/create$lang"(controller: 'tekEvent')
    }
}