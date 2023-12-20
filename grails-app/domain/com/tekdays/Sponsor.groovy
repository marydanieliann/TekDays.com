package com.tekdays

import org.hibernate.envers.Audited

@Audited
class Sponsor {
    String name
    String website
    String description
    byte[] logo
    Boolean deleted=false
    static hasMany = [sponsorships: Sponsorship]
    static belongsTo = TekEvent

    String toString() {
        name
    }
    static constraints = {
        name blank: false
        website blank: false,
                url: true
        description nullable:
                true, maxSize: 5000
        logo nullable: true,
                maxSize: 1000000
         sponsorships nullable: true
    }
}
