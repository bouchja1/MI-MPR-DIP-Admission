// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.address;

import cz.cvut.fit.mi_mpr_dip.admission.domain.address.PrintLineType;
import cz.cvut.fit.mi_mpr_dip.admission.domain.address.PrintLineTypeDataOnDemand;
import cz.cvut.fit.mi_mpr_dip.admission.domain.address.PrintLineTypeIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PrintLineTypeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PrintLineTypeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PrintLineTypeIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: PrintLineTypeIntegrationTest: @Transactional;
    
    @Autowired
    private PrintLineTypeDataOnDemand PrintLineTypeIntegrationTest.dod;
    
    @Test
    public void PrintLineTypeIntegrationTest.testCountPrintLineTypes() {
        Assert.assertNotNull("Data on demand for 'PrintLineType' failed to initialize correctly", dod.getRandomPrintLineType());
        long count = PrintLineType.countPrintLineTypes();
        Assert.assertTrue("Counter for 'PrintLineType' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PrintLineTypeIntegrationTest.testFindPrintLineType() {
        PrintLineType obj = dod.getRandomPrintLineType();
        Assert.assertNotNull("Data on demand for 'PrintLineType' failed to initialize correctly", obj);
        Long id = obj.getPrintLineTypeId();
        Assert.assertNotNull("Data on demand for 'PrintLineType' failed to provide an identifier", id);
        obj = PrintLineType.findPrintLineType(id);
        Assert.assertNotNull("Find method for 'PrintLineType' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'PrintLineType' returned the incorrect identifier", id, obj.getPrintLineTypeId());
    }
    
    @Test
    public void PrintLineTypeIntegrationTest.testFindAllPrintLineTypes() {
        Assert.assertNotNull("Data on demand for 'PrintLineType' failed to initialize correctly", dod.getRandomPrintLineType());
        long count = PrintLineType.countPrintLineTypes();
        Assert.assertTrue("Too expensive to perform a find all test for 'PrintLineType', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<PrintLineType> result = PrintLineType.findAllPrintLineTypes();
        Assert.assertNotNull("Find all method for 'PrintLineType' illegally returned null", result);
        Assert.assertTrue("Find all method for 'PrintLineType' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PrintLineTypeIntegrationTest.testFindPrintLineTypeEntries() {
        Assert.assertNotNull("Data on demand for 'PrintLineType' failed to initialize correctly", dod.getRandomPrintLineType());
        long count = PrintLineType.countPrintLineTypes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<PrintLineType> result = PrintLineType.findPrintLineTypeEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'PrintLineType' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'PrintLineType' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PrintLineTypeIntegrationTest.testFlush() {
        PrintLineType obj = dod.getRandomPrintLineType();
        Assert.assertNotNull("Data on demand for 'PrintLineType' failed to initialize correctly", obj);
        Long id = obj.getPrintLineTypeId();
        Assert.assertNotNull("Data on demand for 'PrintLineType' failed to provide an identifier", id);
        obj = PrintLineType.findPrintLineType(id);
        Assert.assertNotNull("Find method for 'PrintLineType' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPrintLineType(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'PrintLineType' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PrintLineTypeIntegrationTest.testMergeUpdate() {
        PrintLineType obj = dod.getRandomPrintLineType();
        Assert.assertNotNull("Data on demand for 'PrintLineType' failed to initialize correctly", obj);
        Long id = obj.getPrintLineTypeId();
        Assert.assertNotNull("Data on demand for 'PrintLineType' failed to provide an identifier", id);
        obj = PrintLineType.findPrintLineType(id);
        boolean modified =  dod.modifyPrintLineType(obj);
        Integer currentVersion = obj.getVersion();
        PrintLineType merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getPrintLineTypeId(), id);
        Assert.assertTrue("Version for 'PrintLineType' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PrintLineTypeIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'PrintLineType' failed to initialize correctly", dod.getRandomPrintLineType());
        PrintLineType obj = dod.getNewTransientPrintLineType(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'PrintLineType' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'PrintLineType' identifier to be null", obj.getPrintLineTypeId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'PrintLineType' identifier to no longer be null", obj.getPrintLineTypeId());
    }
    
    @Test
    public void PrintLineTypeIntegrationTest.testRemove() {
        PrintLineType obj = dod.getRandomPrintLineType();
        Assert.assertNotNull("Data on demand for 'PrintLineType' failed to initialize correctly", obj);
        Long id = obj.getPrintLineTypeId();
        Assert.assertNotNull("Data on demand for 'PrintLineType' failed to provide an identifier", id);
        obj = PrintLineType.findPrintLineType(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'PrintLineType' with identifier '" + id + "'", PrintLineType.findPrintLineType(id));
    }
    
}
