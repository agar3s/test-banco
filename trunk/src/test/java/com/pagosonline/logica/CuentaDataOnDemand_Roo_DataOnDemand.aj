// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pagosonline.logica;

import com.pagosonline.logica.ClienteDataOnDemand;
import com.pagosonline.logica.Cuenta;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect CuentaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CuentaDataOnDemand: @Component;
    
    private Random CuentaDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Cuenta> CuentaDataOnDemand.data;
    
    @Autowired
    private ClienteDataOnDemand CuentaDataOnDemand.clienteDataOnDemand;
    
    public Cuenta CuentaDataOnDemand.getNewTransientCuenta(int index) {
        com.pagosonline.logica.Cuenta obj = new com.pagosonline.logica.Cuenta();
        obj.setNumeroCuenta(new Integer(index).longValue());
        java.lang.Long saldo = new Integer(index).longValue();
        if (saldo < 0) {
            saldo = 0L;
        }
        obj.setSaldo(saldo);
        obj.setCliente(clienteDataOnDemand.getRandomCliente());
        return obj;
    }
    
    public Cuenta CuentaDataOnDemand.getSpecificCuenta(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Cuenta obj = data.get(index);
        return Cuenta.findCuenta(obj.getId());
    }
    
    public Cuenta CuentaDataOnDemand.getRandomCuenta() {
        init();
        Cuenta obj = data.get(rnd.nextInt(data.size()));
        return Cuenta.findCuenta(obj.getId());
    }
    
    public boolean CuentaDataOnDemand.modifyCuenta(Cuenta obj) {
        return false;
    }
    
    public void CuentaDataOnDemand.init() {
        data = com.pagosonline.logica.Cuenta.findCuentaEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Cuenta' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<com.pagosonline.logica.Cuenta>();
        for (int i = 0; i < 10; i++) {
            com.pagosonline.logica.Cuenta obj = getNewTransientCuenta(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
