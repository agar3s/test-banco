package com.pagosonline.web;

import com.pagosonline.logica.Cuenta;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "cuentas", formBackingObject = Cuenta.class)
@RequestMapping("/cuentas")
@Controller
public class CuentaController {
}
