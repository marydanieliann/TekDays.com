package com.tekdays

import org.hibernate.envers.Audited

@Audited
class TekUser {

    String fullName
    String userName
    String password
    String email
    String website
    String bio
    Boolean deleted=false
    UserRole userRole
    String toString() { fullName }
    Boolean enable = false

    static constraints = {
        fullName()
        userName()
        email()
        website()
        bio maxSize: 5000
        userRole nullable: false
    }
}
