package com.tekdays

class ChildUser extends User{

    String company
    static constraints = {
        company nullable: false
    }

}
