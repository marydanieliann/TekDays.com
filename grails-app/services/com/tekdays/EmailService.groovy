package com.tekdays

import grails.plugin.mail.MailService
import grails.transaction.Transactional

@Transactional
class EmailService {

    MailService mailService

    def sendEmail(String email ) {
//        def list = TekUser.list()
//        for (user in list) {
            if (email) {
                try {
                    mailService.sendMail {
                        to email
                        subject "Join our team"
                        html "/email/confirmationRegistration", model: [user: TekUser.findByEmail(email)]
                    }
                }
                catch (Exception e) {
                    log.info("**** Error : Sending Job Fail Email:\n******* Cause : " + e.getMessage())
                }
            }
        }

}