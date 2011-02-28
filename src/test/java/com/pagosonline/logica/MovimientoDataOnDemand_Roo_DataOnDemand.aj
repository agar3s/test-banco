// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pagosonline.logica;

import com.pagosonline.logica.CuentaDataOnDemand;
import com.pagosonline.logica.Movimiento;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect MovimientoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: MovimientoDataOnDemand: @Component;
    
    private Random MovimientoDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Movimiento> MovimientoDataOnDemand.data;
    
    @Autowired
    private CuentaDataOnDemand MovimientoDataOnDemand.cuentaDataOnDemand;
    
    public Movimiento MovimientoDataOnDemand.getNewTransientMovimiento(int index) {
        com.pagosonline.logica.Movimiento obj = new com.pagosonline.logica.Movimiento();
        java.lang.Long valor = new Integer(index).longValue();
        if (valor < 0) {
            valor = 0L;
        }
        obj.setValor(valor);
        obj.setTipo(com.pagosonline.logica.TipoMovimiento.class.getEnumConstants()[0]);
        obj.setCuenta(cuentaDataOnDemand.getRandomCuenta());
        obj.setFecha(new java.util.GregorianCalendar(java.util.Calendar.getInstance().get(java.util.Calendar.YEAR), java.util.Calendar.getInstance().get(java.util.Calendar.MONTH), java.util.Calendar.getInstance().get(java.util.Calendar.DAY_OF_MONTH), java.util.Calendar.getInstance().get(java.util.Calendar.HOUR_OF_DAY), java.util.Calendar.getInstance().get(java.util.Calendar.MINUTE), java.util.Calendar.getInstance().get(java.util.Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime());
        return obj;
    }
    
    public Movimiento MovimientoDataOnDemand.getSpecificMovimiento(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Movimiento obj = data.get(index);
        return Movimiento.findMovimiento(obj.getId());
    }
    
    public Movimiento MovimientoDataOnDemand.getRandomMovimiento() {
        init();
        Movimiento obj = data.get(rnd.nextInt(data.size()));
        return Movimiento.findMovimiento(obj.getId());
    }
    
    public boolean MovimientoDataOnDemand.modifyMovimiento(Movimiento obj) {
        return false;
    }
    
    public void MovimientoDataOnDemand.init() {
        data = com.pagosonline.logica.Movimiento.findMovimientoEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Movimiento' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<com.pagosonline.logica.Movimiento>();
        for (int i = 0; i < 10; i++) {
            com.pagosonline.logica.Movimiento obj = getNewTransientMovimiento(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
