package com.tekdays

import org.hibernate.envers.Audited

@Audited
class Sponsorship {
    TekEvent event
    Sponsor sponsor
    String contributionType
    String description
    String notes
    Boolean deleted=false

    static constraints = {
        event nullable: false
        sponsor nullable: false
        contributionType inList: ["Other", "Venue", "A/V", "Promotion", "Cash"]
        description nullable: true, blank: true
        notes nullable: true, blank: true, maxSize: 5000
    }
}
