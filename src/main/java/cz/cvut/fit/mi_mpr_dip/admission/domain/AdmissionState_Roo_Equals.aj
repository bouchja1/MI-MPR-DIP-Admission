// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.AdmissionState;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect AdmissionState_Roo_Equals {
    
    public boolean AdmissionState.equals(Object obj) {
        if (!(obj instanceof AdmissionState)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        AdmissionState rhs = (AdmissionState) obj;
        return new EqualsBuilder().append(code, rhs.code).append(desciption, rhs.desciption).append(name, rhs.name).isEquals();
    }
    
    public int AdmissionState.hashCode() {
        return new HashCodeBuilder().append(code).append(desciption).append(name).toHashCode();
    }
    
}