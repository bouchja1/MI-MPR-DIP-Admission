// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.Appendix;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect Appendix_Roo_Equals {
    
    public boolean Appendix.equals(Object obj) {
        if (!(obj instanceof Appendix)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Appendix rhs = (Appendix) obj;
        return new EqualsBuilder().append(attachmentType, rhs.attachmentType).append(content, rhs.content).append(filename, rhs.filename).append(mimeType, rhs.mimeType).isEquals();
    }
    
    public int Appendix.hashCode() {
        return new HashCodeBuilder().append(attachmentType).append(content).append(filename).append(mimeType).toHashCode();
    }
    
}
