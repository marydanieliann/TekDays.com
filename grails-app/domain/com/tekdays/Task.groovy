package com.tekdays

import org.hibernate.envers.Audited

@Audited
class Task {
    String title
    String notes
    TekUser assignedTo
    Date dueDate
    Date dateCreated
    Date lastUpdated
    TekEvent event
    Boolean completed
    Boolean deleted=false
    static constraints = {
        title blank: false
        notes blank: true, nullable: true, maxSize: 5000
        assignedTo nullable: true
        dueDate nullable: true
        completed nullable: true
    }

 /*   def beforeInsert() {
        dateCreated = new Date()
    }*/

    def afterInsert(){
        dateCreated = new Date()
    }


    ///if i have  a Date lastUpdated than i can not implement the method with the same name
  /*  def afterUpdate(){
        dateUpdated = new Date()
    }*/

    static belongsTo = TekEvent
}
