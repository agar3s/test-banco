package com.pagosonline.logica;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import com.pagosonline.logica.Cliente;
import javax.persistence.ManyToOne;
import java.util.Set;
import com.pagosonline.logica.Movimiento;
import java.util.HashSet;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooEntity
public class Cuenta {

    @NotNull
    @Min(3L)
    private Long numeroCuenta;

    @Min(0L)
    private Long saldo;


    @NotNull
    @ManyToOne
    private Cliente cliente;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cuenta")
    private Set<Movimiento> movimientos = new HashSet<Movimiento>();
    
    public Cuenta(){
    	this.saldo=0L;
    }
    public Cuenta(Cliente cliente){
    	this.cliente = cliente;
    	this.saldo=0L;
    }


	public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("N°: ").append(getNumeroCuenta());
        return sb.toString();
    }
	
	public void aumentarSaldo(Long debito){
		saldo+=debito;
	}
	
	public boolean reducirSaldo(Long credito){
		if(saldo-credito<0){
			return false;
		}
		saldo-=credito;
		return true;
	}
}
