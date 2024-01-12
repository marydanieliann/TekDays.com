class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(view: "/index")
        "500"(view: '/error')

        /*"/api/$id?/$format?" {
            controller = 'tekEvent'
            action = [
                    POST  : 'create',
                    GET   : 'getByID',
                    PUT   : 'update',
                    DELETE: 'delete',
            ]
        }*/

       "/tekEvent/"(controller: "tekEvent"){
             action = [
                    POST  : 'create',
                    GET   : 'getByID',
                    PUT   : 'update',
                    DELETE: 'delete',
            ]
        }


        "/api/$format?" {
            controller='tekEvent'
            action=[GET:'index']
        }

        "/TekDays.com/tekEvent/index$lang"(controller: 'tekEvent')
        "/TekDays.com/tekEvent/create$lang"(controller: 'tekEvent')
    }
}