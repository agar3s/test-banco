package com.pagosonline.logica;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import com.pagosonline.logica.TipoMovimiento;
import javax.validation.constraints.NotNull;
import javax.persistence.Enumerated;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import com.pagosonline.logica.Cuenta;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity
public class Movimiento {

    private Long valor;

    @NotNull
    @Enumerated
    private TipoMovimiento tipo;
    
    @NotNull
    @ManyToOne
    private Cuenta cuenta;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date fecha;
    
    
}
