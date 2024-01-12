package com.tekdays

class AdminController {

   def admin() {
       def user = session.user
       if(user.userRole == UserRole.ADMIN) {
            render(view: "admin", model:[user : user])
       }
       else {
           redirect(uri: '/')
       }
   }

    def user() {
        def user = session.user
        if(user.userRole == UserRole.USER){
            render(view: "user", model:[user:user])
        }
    }
}
