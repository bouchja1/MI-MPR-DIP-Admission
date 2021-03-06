// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.Admission;
import cz.cvut.fit.mi_mpr_dip.admission.domain.Term;
import cz.cvut.fit.mi_mpr_dip.admission.domain.TermRegistration;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect TermRegistration_Roo_Finder {
    
    public static TypedQuery<TermRegistration> TermRegistration.findTermRegistrationsByAdmissionAndTerm(Admission admission, Term term) {
        if (admission == null) throw new IllegalArgumentException("The admission argument is required");
        if (term == null) throw new IllegalArgumentException("The term argument is required");
        EntityManager em = TermRegistration.entityManager();
        TypedQuery<TermRegistration> q = em.createQuery("SELECT o FROM TermRegistration AS o WHERE o.admission = :admission AND o.term = :term", TermRegistration.class);
        q.setParameter("admission", admission);
        q.setParameter("term", term);
        return q;
    }
    
}
