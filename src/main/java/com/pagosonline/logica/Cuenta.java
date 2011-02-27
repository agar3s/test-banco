package com.pagosonline.logica;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import com.pagosonline.logica.Cliente;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity
public class Cuenta {

	@NotNull
    private Long numeroCuenta;

    @Min(0L)
    private Long saldo;

    @NotNull
    @ManyToOne
    private Cliente cliente;
}
