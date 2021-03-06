// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.address;

import cz.cvut.fit.mi_mpr_dip.admission.domain.address.PrintLine;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PrintLine_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PrintLine.entityManager;
    
    public static final EntityManager PrintLine.entityManager() {
        EntityManager em = new PrintLine().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PrintLine.countPrintLines() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PrintLine o", Long.class).getSingleResult();
    }
    
    public static List<PrintLine> PrintLine.findAllPrintLines() {
        return entityManager().createQuery("SELECT o FROM PrintLine o", PrintLine.class).getResultList();
    }
    
    public static PrintLine PrintLine.findPrintLine(Long printLineId) {
        if (printLineId == null) return null;
        return entityManager().find(PrintLine.class, printLineId);
    }
    
    public static List<PrintLine> PrintLine.findPrintLineEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PrintLine o", PrintLine.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PrintLine.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PrintLine.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PrintLine attached = PrintLine.findPrintLine(this.printLineId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PrintLine.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PrintLine.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PrintLine PrintLine.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PrintLine merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
