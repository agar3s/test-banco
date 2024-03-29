package com.pagosonline.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/transaccion/**")
@Controller
public class TransaccionController {

    @RequestMapping(method = RequestMethod.POST, value = "{id}")
    public void get(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    }

    public void post(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public String realizarTransaccion(@PathVariable("id") Long id) {
    	System.out.println("entro por aca + " + id);
        return "transaccion/index";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public String index(@PathVariable("id") Long id) {
    	System.out.println("entro por aca + " + id);
        return "transaccion/index";
    }
}
