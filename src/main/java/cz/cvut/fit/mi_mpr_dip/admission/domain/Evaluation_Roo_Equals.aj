// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.Evaluation;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect Evaluation_Roo_Equals {
    
    public boolean Evaluation.equals(Object obj) {
        if (!(obj instanceof Evaluation)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Evaluation rhs = (Evaluation) obj;
        return new EqualsBuilder().append(evaluationType, rhs.evaluationType).append(value, rhs.value).isEquals();
    }
    
    public int Evaluation.hashCode() {
        return new HashCodeBuilder().append(evaluationType).append(value).toHashCode();
    }
    
}
