// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pagosonline.logica;

import java.lang.String;

privileged aspect Cliente_Roo_ToString {
    
    public String Cliente.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Nombre: ").append(getNombre()).append(", ");
        sb.append("Direccion: ").append(getDireccion()).append(", ");
        sb.append("Telefono: ").append(getTelefono()).append(", ");
        sb.append("Cuentas: ").append(getCuentas() == null ? "null" : getCuentas().size());
        return sb.toString();
    }
    
}