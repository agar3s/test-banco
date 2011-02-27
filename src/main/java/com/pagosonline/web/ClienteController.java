package com.pagosonline.web;

import com.pagosonline.logica.Cliente;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "clientes", formBackingObject = Cliente.class)
@RequestMapping("/clientes")
@Controller
public class ClienteController {
}
