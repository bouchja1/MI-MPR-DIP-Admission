// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.personal;

import cz.cvut.fit.mi_mpr_dip.admission.domain.personal.MaritalStatus;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect MaritalStatus_Roo_Finder {
    
    public static TypedQuery<MaritalStatus> MaritalStatus.findMaritalStatusesByNameEquals(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        EntityManager em = MaritalStatus.entityManager();
        TypedQuery<MaritalStatus> q = em.createQuery("SELECT o FROM MaritalStatus AS o WHERE o.name = :name", MaritalStatus.class);
        q.setParameter("name", name);
        return q;
    }
    
}