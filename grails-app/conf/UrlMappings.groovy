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

        "/TekDays.com/tekEvent/index$lang"(controller: 'tekEvent')
        "/TekDays.com/tekEvent/create$lang"(controller: 'tekEvent')
    }
}