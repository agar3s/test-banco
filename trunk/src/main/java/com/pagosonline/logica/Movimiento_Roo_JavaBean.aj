// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pagosonline.logica;

import com.pagosonline.logica.Cuenta;
import com.pagosonline.logica.TipoMovimiento;
import java.lang.Long;
import java.util.Date;

privileged aspect Movimiento_Roo_JavaBean {
    
    public Long Movimiento.getValor() {
        return this.valor;
    }
    
    public void Movimiento.setValor(Long valor) {
        this.valor = valor;
    }
    
    public TipoMovimiento Movimiento.getTipo() {
        return this.tipo;
    }
    
    public void Movimiento.setTipo(TipoMovimiento tipo) {
        this.tipo = tipo;
    }
    
    public Cuenta Movimiento.getCuenta() {
        return this.cuenta;
    }
    
    public void Movimiento.setCuenta(Cuenta cuenta) {
        this.cuenta = cuenta;
    }
    
    public Date Movimiento.getFecha() {
        return this.fecha;
    }
    
    public void Movimiento.setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
}