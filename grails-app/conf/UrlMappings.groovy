class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }
        "/events/$nickname"{
            controller = "tekEvent"
            action = "show"
        }
        "/"(view:"/index")
        "500"(view:'/error')
    }
}