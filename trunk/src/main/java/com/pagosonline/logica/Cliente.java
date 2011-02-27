package com.pagosonline.logica;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooEntity
public class Cliente {

    @NotNull
    @Size(min = 3)
    private String nombre;

    @NotNull
    @Size(min = 8)
    private String direccion;

    @Size(min = 7)
    private String telefono;

}
