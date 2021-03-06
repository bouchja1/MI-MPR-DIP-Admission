// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.AppendixType;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect AppendixType_Roo_Finder {
    
    public static TypedQuery<AppendixType> AppendixType.findAppendixTypesByNameEquals(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        EntityManager em = AppendixType.entityManager();
        TypedQuery<AppendixType> q = em.createQuery("SELECT o FROM AppendixType AS o WHERE o.name = :name", AppendixType.class);
        q.setParameter("name", name);
        return q;
    }
    
}
