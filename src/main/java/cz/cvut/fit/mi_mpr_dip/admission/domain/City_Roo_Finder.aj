// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.City;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect City_Roo_Finder {
    
    public static TypedQuery<City> City.findCitysByNameEquals(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        EntityManager em = City.entityManager();
        TypedQuery<City> q = em.createQuery("SELECT o FROM City AS o WHERE o.name = :name", City.class);
        q.setParameter("name", name);
        return q;
    }
    
}