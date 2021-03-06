// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.Appendix;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Appendix_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Appendix.entityManager;
    
    public static final EntityManager Appendix.entityManager() {
        EntityManager em = new Appendix().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Appendix.countAppendixes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Appendix o", Long.class).getSingleResult();
    }
    
    public static List<Appendix> Appendix.findAllAppendixes() {
        return entityManager().createQuery("SELECT o FROM Appendix o", Appendix.class).getResultList();
    }
    
    public static Appendix Appendix.findAppendix(Long appendixId) {
        if (appendixId == null) return null;
        return entityManager().find(Appendix.class, appendixId);
    }
    
    public static List<Appendix> Appendix.findAppendixEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Appendix o", Appendix.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Appendix.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Appendix.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Appendix attached = Appendix.findAppendix(this.appendixId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Appendix.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Appendix.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Appendix Appendix.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Appendix merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
