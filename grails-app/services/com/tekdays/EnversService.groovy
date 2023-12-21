package com.tekdays
import org.hibernate.SessionFactory
import org.hibernate.envers.AuditReaderFactory
import grails.transaction.Transactional
import java.util.stream.Collectors
import org.hibernate.envers.query.AuditEntity

@Transactional
class EnversService {
    SessionFactory sessionFactory

    def getAuditedByRevisionId(Class clazz, Long rev) {
        List listOfAudited = AuditReaderFactory
                .get(sessionFactory.currentSession)
                .createQuery()
                .forEntitiesModifiedAtRevision(clazz, rev).resultList
        def result = listOfAudited?.first()
        return result
    }

    List<TekUser> getAuditedByEntityId(Class<TekUser> clazz, Long id) {
        List listOfAudited = AuditReaderFactory
                .get(sessionFactory.currentSession)
                .createQuery()
                .forRevisionsOfEntity(clazz, true, true)
                .add(AuditEntity.id().eq(id))
                .getResultList()

        return listOfAudited
    }

    List getAllAudited(Class clazz) {
        List listOfAudited = AuditReaderFactory
                .get(sessionFactory.currentSession)
                .createQuery()
                .forRevisionsOfEntity(clazz, true, true).getResultList()
        List result = listOfAudited
        return result
    }

    List getAllOnlyExist(Class clazz) {
        List listOfAudited = AuditReaderFactory
                .get(sessionFactory.currentSession)
                .createQuery()
                .forRevisionsOfEntity(clazz, true, false).resultList

        List result = listOfAudited
        return result
    }
}
