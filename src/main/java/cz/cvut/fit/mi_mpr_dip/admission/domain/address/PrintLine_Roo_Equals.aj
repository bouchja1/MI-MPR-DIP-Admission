// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.address;

import cz.cvut.fit.mi_mpr_dip.admission.domain.address.PrintLine;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect PrintLine_Roo_Equals {
    
    public boolean PrintLine.equals(Object obj) {
        if (!(obj instanceof PrintLine)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        PrintLine rhs = (PrintLine) obj;
        return new EqualsBuilder().append(printLineType, rhs.printLineType).append(value, rhs.value).isEquals();
    }
    
    public int PrintLine.hashCode() {
        return new HashCodeBuilder().append(printLineType).append(value).toHashCode();
    }
    
}
