// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.personal;

import cz.cvut.fit.mi_mpr_dip.admission.domain.personal.DisabilityType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DisabilityType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager DisabilityType.entityManager;
    
    public static final EntityManager DisabilityType.entityManager() {
        EntityManager em = new DisabilityType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long DisabilityType.countDisabilityTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM DisabilityType o", Long.class).getSingleResult();
    }
    
    public static List<DisabilityType> DisabilityType.findAllDisabilityTypes() {
        return entityManager().createQuery("SELECT o FROM DisabilityType o", DisabilityType.class).getResultList();
    }
    
    public static DisabilityType DisabilityType.findDisabilityType(Long disabilityTypeId) {
        if (disabilityTypeId == null) return null;
        return entityManager().find(DisabilityType.class, disabilityTypeId);
    }
    
    public static List<DisabilityType> DisabilityType.findDisabilityTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM DisabilityType o", DisabilityType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void DisabilityType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void DisabilityType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            DisabilityType attached = DisabilityType.findDisabilityType(this.disabilityTypeId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void DisabilityType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void DisabilityType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public DisabilityType DisabilityType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        DisabilityType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}