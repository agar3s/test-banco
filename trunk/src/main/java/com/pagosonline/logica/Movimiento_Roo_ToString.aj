// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pagosonline.logica;

import java.lang.String;

privileged aspect Movimiento_Roo_ToString {
    
    public String Movimiento.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Valor: ").append(getValor()).append(", ");
        sb.append("Tipo: ").append(getTipo()).append(", ");
        sb.append("Cuenta: ").append(getCuenta()).append(", ");
        sb.append("Fecha: ").append(getFecha());
        return sb.toString();
    }
    
}