package com.tekdays

import grails.plugin.mail.MailService
import grails.transaction.Transactional
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Transactional
class ScheduledService {
    MailService mailService
    private static final Logger LOGGER = LoggerFactory.getLogger(ScheduledService.class)

    def periodicRun() {
        LOGGER.info("Run Time = {}", new Date())

    }
    def periodicSendMail() {
        LOGGER.info("Send mail = {}", new Date())
        mailService.sendMail {
            to "danielianmeri@gmail.com"
            subject "Check your Test"
            body "DONE"
        }
    }
}