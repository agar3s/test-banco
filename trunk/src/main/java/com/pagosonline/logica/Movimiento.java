package com.pagosonline.logica;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import com.pagosonline.logica.TipoMovimiento;

import javax.validation.constraints.Min;
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

	@NotNull
	@Min(0L)
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

	/**
	 * Constructor por defecto
	 * */
	public Movimiento() {
		this.fecha = new Date(System.currentTimeMillis()); 
	}

	/**
	 * Constructor con cuenta a la cual se realiza la transacción.
	 * @param Cuenta la cuenta.
	 * */
	public Movimiento(Cuenta cuenta) {
		this.cuenta = cuenta;
		this.fecha = new Date(System.currentTimeMillis()); 
	}

}
