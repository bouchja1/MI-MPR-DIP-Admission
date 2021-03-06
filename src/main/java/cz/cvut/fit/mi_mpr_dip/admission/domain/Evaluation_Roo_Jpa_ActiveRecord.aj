// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.Evaluation;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Evaluation_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Evaluation.entityManager;
    
    public static final EntityManager Evaluation.entityManager() {
        EntityManager em = new Evaluation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Evaluation.countEvaluations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Evaluation o", Long.class).getSingleResult();
    }
    
    public static List<Evaluation> Evaluation.findAllEvaluations() {
        return entityManager().createQuery("SELECT o FROM Evaluation o", Evaluation.class).getResultList();
    }
    
    public static Evaluation Evaluation.findEvaluation(Long evaluationId) {
        if (evaluationId == null) return null;
        return entityManager().find(Evaluation.class, evaluationId);
    }
    
    public static List<Evaluation> Evaluation.findEvaluationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Evaluation o", Evaluation.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Evaluation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Evaluation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Evaluation attached = Evaluation.findEvaluation(this.evaluationId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Evaluation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Evaluation.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Evaluation Evaluation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Evaluation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
