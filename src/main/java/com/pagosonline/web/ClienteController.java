package com.pagosonline.web;

import com.pagosonline.logica.Cliente;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RooWebScaffold(path = "clientes", formBackingObject = Cliente.class)
@RequestMapping("/clientes")
@Controller
public class ClienteController {


}
