package com.tekdays

class TekEvent {
    String city
    String name
    //one to one relationship
    TekUser organizer
    //String organizer
    String venue
    Date startDate
    Date endDate
    String description
    static searchable = true
    //one to many relationship
    static hasMany = [volunteers  : TekUser, respondents: String,
                      sponsorships: Sponsorship, tasks: Task, messages: TekMessage]

    String toString() {
        "$name, $city"
    }

    static constraints = {
        name(nullable: false)
        city(nullable: false)
        description maxSize: 5000
        organizer(nullable: false)
        venue(nullable: false)
        startDate(nullable: false)
        endDate(nullable: false)
        volunteers nullable: true
        sponsorships nullable: true
        tasks nullable: true
      //  messages nullable: true
    }


}
