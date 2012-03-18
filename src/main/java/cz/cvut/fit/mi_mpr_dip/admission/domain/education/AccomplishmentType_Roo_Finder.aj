// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.education;

import cz.cvut.fit.mi_mpr_dip.admission.domain.education.AccomplishmentType;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect AccomplishmentType_Roo_Finder {
    
    public static TypedQuery<AccomplishmentType> AccomplishmentType.findAccomplishmentTypesByNameEquals(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        EntityManager em = AccomplishmentType.entityManager();
        TypedQuery<AccomplishmentType> q = em.createQuery("SELECT o FROM AccomplishmentType AS o WHERE o.name = :name", AccomplishmentType.class);
        q.setParameter("name", name);
        return q;
    }
    
}
