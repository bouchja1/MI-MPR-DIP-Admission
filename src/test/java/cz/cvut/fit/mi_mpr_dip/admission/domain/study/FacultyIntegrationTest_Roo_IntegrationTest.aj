// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.study;

import cz.cvut.fit.mi_mpr_dip.admission.domain.study.Faculty;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.FacultyDataOnDemand;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.FacultyIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect FacultyIntegrationTest_Roo_IntegrationTest {
    
    declare @type: FacultyIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: FacultyIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: FacultyIntegrationTest: @Transactional;
    
    @Autowired
    private FacultyDataOnDemand FacultyIntegrationTest.dod;
    
    @Test
    public void FacultyIntegrationTest.testCountFacultys() {
        Assert.assertNotNull("Data on demand for 'Faculty' failed to initialize correctly", dod.getRandomFaculty());
        long count = Faculty.countFacultys();
        Assert.assertTrue("Counter for 'Faculty' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void FacultyIntegrationTest.testFindFaculty() {
        Faculty obj = dod.getRandomFaculty();
        Assert.assertNotNull("Data on demand for 'Faculty' failed to initialize correctly", obj);
        Long id = obj.getFacultyId();
        Assert.assertNotNull("Data on demand for 'Faculty' failed to provide an identifier", id);
        obj = Faculty.findFaculty(id);
        Assert.assertNotNull("Find method for 'Faculty' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Faculty' returned the incorrect identifier", id, obj.getFacultyId());
    }
    
    @Test
    public void FacultyIntegrationTest.testFindAllFacultys() {
        Assert.assertNotNull("Data on demand for 'Faculty' failed to initialize correctly", dod.getRandomFaculty());
        long count = Faculty.countFacultys();
        Assert.assertTrue("Too expensive to perform a find all test for 'Faculty', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Faculty> result = Faculty.findAllFacultys();
        Assert.assertNotNull("Find all method for 'Faculty' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Faculty' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void FacultyIntegrationTest.testFindFacultyEntries() {
        Assert.assertNotNull("Data on demand for 'Faculty' failed to initialize correctly", dod.getRandomFaculty());
        long count = Faculty.countFacultys();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Faculty> result = Faculty.findFacultyEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Faculty' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Faculty' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void FacultyIntegrationTest.testFlush() {
        Faculty obj = dod.getRandomFaculty();
        Assert.assertNotNull("Data on demand for 'Faculty' failed to initialize correctly", obj);
        Long id = obj.getFacultyId();
        Assert.assertNotNull("Data on demand for 'Faculty' failed to provide an identifier", id);
        obj = Faculty.findFaculty(id);
        Assert.assertNotNull("Find method for 'Faculty' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyFaculty(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Faculty' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void FacultyIntegrationTest.testMergeUpdate() {
        Faculty obj = dod.getRandomFaculty();
        Assert.assertNotNull("Data on demand for 'Faculty' failed to initialize correctly", obj);
        Long id = obj.getFacultyId();
        Assert.assertNotNull("Data on demand for 'Faculty' failed to provide an identifier", id);
        obj = Faculty.findFaculty(id);
        boolean modified =  dod.modifyFaculty(obj);
        Integer currentVersion = obj.getVersion();
        Faculty merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getFacultyId(), id);
        Assert.assertTrue("Version for 'Faculty' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void FacultyIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Faculty' failed to initialize correctly", dod.getRandomFaculty());
        Faculty obj = dod.getNewTransientFaculty(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Faculty' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Faculty' identifier to be null", obj.getFacultyId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Faculty' identifier to no longer be null", obj.getFacultyId());
    }
    
    @Test
    public void FacultyIntegrationTest.testRemove() {
        Faculty obj = dod.getRandomFaculty();
        Assert.assertNotNull("Data on demand for 'Faculty' failed to initialize correctly", obj);
        Long id = obj.getFacultyId();
        Assert.assertNotNull("Data on demand for 'Faculty' failed to provide an identifier", id);
        obj = Faculty.findFaculty(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Faculty' with identifier '" + id + "'", Faculty.findFaculty(id));
    }
    
}
