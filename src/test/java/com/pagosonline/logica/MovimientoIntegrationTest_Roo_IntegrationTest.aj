// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pagosonline.logica;

import com.pagosonline.logica.MovimientoDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MovimientoIntegrationTest_Roo_IntegrationTest {
    
    declare @type: MovimientoIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: MovimientoIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: MovimientoIntegrationTest: @Transactional;
    
    @Autowired
    private MovimientoDataOnDemand MovimientoIntegrationTest.dod;
    
    @Test
    public void MovimientoIntegrationTest.testCountMovimientoes() {
        org.junit.Assert.assertNotNull("Data on demand for 'Movimiento' failed to initialize correctly", dod.getRandomMovimiento());
        long count = com.pagosonline.logica.Movimiento.countMovimientoes();
        org.junit.Assert.assertTrue("Counter for 'Movimiento' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void MovimientoIntegrationTest.testFindMovimiento() {
        com.pagosonline.logica.Movimiento obj = dod.getRandomMovimiento();
        org.junit.Assert.assertNotNull("Data on demand for 'Movimiento' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Movimiento' failed to provide an identifier", id);
        obj = com.pagosonline.logica.Movimiento.findMovimiento(id);
        org.junit.Assert.assertNotNull("Find method for 'Movimiento' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Movimiento' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void MovimientoIntegrationTest.testFindAllMovimientoes() {
        org.junit.Assert.assertNotNull("Data on demand for 'Movimiento' failed to initialize correctly", dod.getRandomMovimiento());
        long count = com.pagosonline.logica.Movimiento.countMovimientoes();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Movimiento', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.pagosonline.logica.Movimiento> result = com.pagosonline.logica.Movimiento.findAllMovimientoes();
        org.junit.Assert.assertNotNull("Find all method for 'Movimiento' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Movimiento' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void MovimientoIntegrationTest.testFindMovimientoEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Movimiento' failed to initialize correctly", dod.getRandomMovimiento());
        long count = com.pagosonline.logica.Movimiento.countMovimientoes();
        if (count > 20) count = 20;
        java.util.List<com.pagosonline.logica.Movimiento> result = com.pagosonline.logica.Movimiento.findMovimientoEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Movimiento' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Movimiento' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void MovimientoIntegrationTest.testFlush() {
        com.pagosonline.logica.Movimiento obj = dod.getRandomMovimiento();
        org.junit.Assert.assertNotNull("Data on demand for 'Movimiento' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Movimiento' failed to provide an identifier", id);
        obj = com.pagosonline.logica.Movimiento.findMovimiento(id);
        org.junit.Assert.assertNotNull("Find method for 'Movimiento' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyMovimiento(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Movimiento' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void MovimientoIntegrationTest.testMerge() {
        com.pagosonline.logica.Movimiento obj = dod.getRandomMovimiento();
        org.junit.Assert.assertNotNull("Data on demand for 'Movimiento' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Movimiento' failed to provide an identifier", id);
        obj = com.pagosonline.logica.Movimiento.findMovimiento(id);
        boolean modified =  dod.modifyMovimiento(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        com.pagosonline.logica.Movimiento merged = (com.pagosonline.logica.Movimiento) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Movimiento' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void MovimientoIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Movimiento' failed to initialize correctly", dod.getRandomMovimiento());
        com.pagosonline.logica.Movimiento obj = dod.getNewTransientMovimiento(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Movimiento' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Movimiento' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Movimiento' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void MovimientoIntegrationTest.testRemove() {
        com.pagosonline.logica.Movimiento obj = dod.getRandomMovimiento();
        org.junit.Assert.assertNotNull("Data on demand for 'Movimiento' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Movimiento' failed to provide an identifier", id);
        obj = com.pagosonline.logica.Movimiento.findMovimiento(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Movimiento' with identifier '" + id + "'", com.pagosonline.logica.Movimiento.findMovimiento(id));
    }
    
}
