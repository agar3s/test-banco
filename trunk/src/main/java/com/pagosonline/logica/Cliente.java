package com.pagosonline.logica;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;
import com.pagosonline.logica.Cuenta;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.ManyToOne;

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

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cliente")
    private Set<Cuenta> cuentas = new HashSet<Cuenta>();

}
