// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.service.user;

import cz.cvut.fit.mi_mpr_dip.admission.dao.UserIdentityDao;
import cz.cvut.fit.mi_mpr_dip.admission.dao.UserRoleDao;
import cz.cvut.fit.mi_mpr_dip.admission.service.user.UserIdentityServiceImpl;
import cz.cvut.fit.mi_mpr_dip.admission.service.user.UserPasswordService;
import cz.cvut.fit.mi_mpr_dip.admission.service.user.UserSessionService;

privileged aspect UserIdentityServiceImpl_Roo_JavaBean {
    
    public String[] UserIdentityServiceImpl.getDefaultRoles() {
        return this.defaultRoles;
    }
    
    public UserIdentityDao UserIdentityServiceImpl.getUserIdentityDao() {
        return this.userIdentityDao;
    }
    
    public void UserIdentityServiceImpl.setUserIdentityDao(UserIdentityDao userIdentityDao) {
        this.userIdentityDao = userIdentityDao;
    }
    
    public UserPasswordService UserIdentityServiceImpl.getUserPasswordService() {
        return this.userPasswordService;
    }
    
    public void UserIdentityServiceImpl.setUserPasswordService(UserPasswordService userPasswordService) {
        this.userPasswordService = userPasswordService;
    }
    
    public UserRoleDao UserIdentityServiceImpl.getUserRoleDao() {
        return this.userRoleDao;
    }
    
    public void UserIdentityServiceImpl.setUserRoleDao(UserRoleDao userRoleDao) {
        this.userRoleDao = userRoleDao;
    }
    
    public UserSessionService UserIdentityServiceImpl.getUserSessionService() {
        return this.userSessionService;
    }
    
    public void UserIdentityServiceImpl.setUserSessionService(UserSessionService userSessionService) {
        this.userSessionService = userSessionService;
    }
    
}