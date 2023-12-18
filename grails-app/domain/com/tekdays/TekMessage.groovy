package com.tekdays

import org.hibernate.envers.Audited

@Audited
class TekMessage {

    String subject
    String content
    TekMessage parent
    // TekEvent event
    TekUser author

    static belongsTo = [event: TekEvent]

    static constraints = {
        subject blank: false
        content blank: false, maxSize: 2000
        parent nullable: true
        author nullable: false
        event nullable: false
    }

    /*    static mapping = {
            event cascade:"save-update"
        }*/
}
