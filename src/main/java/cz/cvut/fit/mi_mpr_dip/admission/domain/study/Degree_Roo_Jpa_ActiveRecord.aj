// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.study;

import cz.cvut.fit.mi_mpr_dip.admission.domain.study.Degree;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Degree_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Degree.entityManager;
    
    public static final EntityManager Degree.entityManager() {
        EntityManager em = new Degree().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Degree.countDegrees() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Degree o", Long.class).getSingleResult();
    }
    
    public static List<Degree> Degree.findAllDegrees() {
        return entityManager().createQuery("SELECT o FROM Degree o", Degree.class).getResultList();
    }
    
    public static Degree Degree.findDegree(Long degreeId) {
        if (degreeId == null) return null;
        return entityManager().find(Degree.class, degreeId);
    }
    
    public static List<Degree> Degree.findDegreeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Degree o", Degree.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Degree.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Degree.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Degree attached = Degree.findDegree(this.degreeId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Degree.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Degree.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Degree Degree.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Degree merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
