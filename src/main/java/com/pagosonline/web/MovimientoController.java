package com.pagosonline.web;

import com.pagosonline.logica.Movimiento;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "movimientoes", formBackingObject = Movimiento.class)
@RequestMapping("/movimientoes")
@Controller
public class MovimientoController {
}
