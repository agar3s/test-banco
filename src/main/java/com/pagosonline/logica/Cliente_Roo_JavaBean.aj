// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pagosonline.logica;

import java.lang.String;

privileged aspect Cliente_Roo_JavaBean {
    
    public String Cliente.getNombre() {
        return this.nombre;
    }
    
    public void Cliente.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String Cliente.getDireccion() {
        return this.direccion;
    }
    
    public void Cliente.setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public String Cliente.getTelefono() {
        return this.telefono;
    }
    
    public void Cliente.setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
}
