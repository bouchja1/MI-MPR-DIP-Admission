// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.study;

import cz.cvut.fit.mi_mpr_dip.admission.domain.study.Programme;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect Programme_Roo_Equals {
    
    public boolean Programme.equals(Object obj) {
        if (!(obj instanceof Programme)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Programme rhs = (Programme) obj;
        return new EqualsBuilder().append(degree, rhs.degree).append(language, rhs.language).append(name, rhs.name).append(studyMode, rhs.studyMode).isEquals();
    }
    
    public int Programme.hashCode() {
        return new HashCodeBuilder().append(degree).append(language).append(name).append(studyMode).toHashCode();
    }
    
}
