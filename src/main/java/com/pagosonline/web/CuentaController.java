package com.pagosonline.web;

import java.util.ArrayList;
import java.util.List;

import com.pagosonline.logica.Cliente;
import com.pagosonline.logica.Cuenta;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RooWebScaffold(path = "cuentas", formBackingObject = Cuenta.class)
@RequestMapping("/cuentas")
@Controller
public class CuentaController {
	
    @RequestMapping(value="/addCuenta", params = "idCliente", method = RequestMethod.GET)
    public String createForm(Model model, @RequestParam("idCliente") Long idCliente) {
    	System.out.println("número de cliente: "+idCliente);
        model.addAttribute("cuenta", new Cuenta(Cliente.findCliente(idCliente)));
        return "cuentas/create";
    }
    
}
