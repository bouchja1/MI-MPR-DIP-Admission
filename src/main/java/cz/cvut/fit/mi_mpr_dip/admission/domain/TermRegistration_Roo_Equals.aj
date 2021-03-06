// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.TermRegistration;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect TermRegistration_Roo_Equals {
    
    public boolean TermRegistration.equals(Object obj) {
        if (!(obj instanceof TermRegistration)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        TermRegistration rhs = (TermRegistration) obj;
        return new EqualsBuilder().append(admission, rhs.admission).append(admissionLink, rhs.admissionLink).append(apology, rhs.apology).append(attended, rhs.attended).append(term, rhs.term).append(termLink, rhs.termLink).isEquals();
    }
    
    public int TermRegistration.hashCode() {
        return new HashCodeBuilder().append(admission).append(admissionLink).append(apology).append(attended).append(term).append(termLink).toHashCode();
    }
    
}
