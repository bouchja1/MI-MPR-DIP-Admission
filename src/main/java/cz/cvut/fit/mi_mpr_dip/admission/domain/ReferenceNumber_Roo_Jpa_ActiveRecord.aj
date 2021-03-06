// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.ReferenceNumber;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ReferenceNumber_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ReferenceNumber.entityManager;
    
    public static final EntityManager ReferenceNumber.entityManager() {
        EntityManager em = new ReferenceNumber().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ReferenceNumber.countReferenceNumbers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ReferenceNumber o", Long.class).getSingleResult();
    }
    
    public static List<ReferenceNumber> ReferenceNumber.findAllReferenceNumbers() {
        return entityManager().createQuery("SELECT o FROM ReferenceNumber o", ReferenceNumber.class).getResultList();
    }
    
    public static ReferenceNumber ReferenceNumber.findReferenceNumber(Long referenceNumberId) {
        if (referenceNumberId == null) return null;
        return entityManager().find(ReferenceNumber.class, referenceNumberId);
    }
    
    public static List<ReferenceNumber> ReferenceNumber.findReferenceNumberEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ReferenceNumber o", ReferenceNumber.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ReferenceNumber.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ReferenceNumber.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ReferenceNumber attached = ReferenceNumber.findReferenceNumber(this.referenceNumberId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ReferenceNumber.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ReferenceNumber.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ReferenceNumber ReferenceNumber.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ReferenceNumber merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
