package com.tekdays

class User {

    String name
    Date dateOfBirth

    static constraints = {
        name nullable: false
        dateOfBirth nullable: false
    }

    static mapping = {
        tablePerHierarchy false
        version false
    }
}
