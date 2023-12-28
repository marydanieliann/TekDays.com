package com.tekdays

class LanguageController {

    def changeLang() {
        def lang = params.lang
        session.setAttribute('lang', lang)
        def urlList = request?.getHeader("referer")?.split("\\?")[0]
        def url = ""
        if (urlList) {
            url = urlList
        }
        switch (lang) {
            case "en":
                url = url + "?lang=${lang}"
                break
            case "ru":
                url = url + "?lang=${lang}"
                break
            case "arm":
                url = url + "?lang=${lang}"
                break
            default:
                url = url + "?lang=en"
                break
        }
        render(url)
    }

    def checkLang() {
        def lang = session?.lang
        if (lang != null) {
            render(lang)
        } else render('en')
    }

    def getLang() {
        def lang = params?.lang
        def url = request.getHeader("referer").split("\\?")[0]
        render("${url}?lang=${lang}")
    }
}
