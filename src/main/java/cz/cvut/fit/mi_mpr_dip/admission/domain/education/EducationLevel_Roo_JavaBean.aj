// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.education;

import cz.cvut.fit.mi_mpr_dip.admission.domain.education.EducationLevel;

privileged aspect EducationLevel_Roo_JavaBean {
    
    public int EducationLevel.getVersion() {
        return this.version;
    }
    
    public void EducationLevel.setVersion(int version) {
        this.version = version;
    }
    
    public Long EducationLevel.getEducationLevelId() {
        return this.educationLevelId;
    }
    
    public void EducationLevel.setEducationLevelId(Long educationLevelId) {
        this.educationLevelId = educationLevelId;
    }
    
    public String EducationLevel.getName() {
        return this.name;
    }
    
    public void EducationLevel.setName(String name) {
        this.name = name;
    }
    
}