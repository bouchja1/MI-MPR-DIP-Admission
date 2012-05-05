// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.endpoint.helper;

import cz.cvut.fit.mi_mpr_dip.admission.dao.TermDao;
import cz.cvut.fit.mi_mpr_dip.admission.endpoint.helper.TermEndpointHelperImpl;
import cz.cvut.fit.mi_mpr_dip.admission.util.TermDateUtils;
import cz.cvut.fit.mi_mpr_dip.admission.validation.TermUniqueConstraintValidator;

privileged aspect TermEndpointHelperImpl_Roo_JavaBean {
    
    public TermDao TermEndpointHelperImpl.getTermDao() {
        return this.termDao;
    }
    
    public void TermEndpointHelperImpl.setTermDao(TermDao termDao) {
        this.termDao = termDao;
    }
    
    public TermDateUtils TermEndpointHelperImpl.getTermDateUtils() {
        return this.termDateUtils;
    }
    
    public void TermEndpointHelperImpl.setTermDateUtils(TermDateUtils termDateUtils) {
        this.termDateUtils = termDateUtils;
    }
    
    public TermUniqueConstraintValidator TermEndpointHelperImpl.getUniqueConstraintValidator() {
        return this.uniqueConstraintValidator;
    }
    
    public void TermEndpointHelperImpl.setUniqueConstraintValidator(TermUniqueConstraintValidator uniqueConstraintValidator) {
        this.uniqueConstraintValidator = uniqueConstraintValidator;
    }
    
}