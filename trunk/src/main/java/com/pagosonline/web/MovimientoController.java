package com.pagosonline.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.pagosonline.logica.Cliente;
import com.pagosonline.logica.Cuenta;
import com.pagosonline.logica.Extracto;
import com.pagosonline.logica.Movimiento;
import com.pagosonline.logica.TipoMovimiento;

import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@RooWebScaffold(path = "movimientoes", formBackingObject = Movimiento.class)
@RequestMapping("/movimientoes")
@Controller
public class MovimientoController {
	
	@RequestMapping(value="/realizarCredito", params = "idCuenta", method = RequestMethod.GET)
	public String realizarCredito(Model model, @RequestParam("idCuenta") Long idCuenta) {
		System.out.println("número de cuenta: "+idCuenta);
		Movimiento mv = new Movimiento(Cuenta.findCuenta(idCuenta));

		mv.setTipo(TipoMovimiento.CREDITO);
		model.addAttribute("movimiento", mv);
		model.addAttribute("movimiento_fecha_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        List dependencies = new ArrayList();
        if (Cuenta.countCuentas() == 0) {
            dependencies.add(new String[]{"cuenta", "cuentas"});
        }
        model.addAttribute("dependencies", dependencies);
        
		return "movimientoes/credito";
	}
	
    @RequestMapping(value="/realizarDebito", params = "idCuenta", method = RequestMethod.GET)
    public String realizarDebito(Model model, @RequestParam("idCuenta") Long idCuenta) {
		Movimiento mv = new Movimiento(Cuenta.findCuenta(idCuenta));

		mv.setTipo(TipoMovimiento.DEBITO);
		model.addAttribute("movimiento", mv);
		model.addAttribute("movimiento_fecha_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        
        List dependencies = new ArrayList();
        if (Cuenta.countCuentas() == 0) {
            dependencies.add(new String[]{"cuenta", "cuentas"});
        }
        model.addAttribute("dependencies", dependencies);
        
        return "movimientoes/debito";
    }
    
	@RequestMapping(value="/generarExtracto", method = RequestMethod.GET)
    public String construirFormularioExtracto(Model model) {
        model.addAttribute("extracto", new Extracto());
        addDateTimeFormatPatterns(model);
        List dependencies = new ArrayList();
        if (Cliente.countClientes() == 0) {
            dependencies.add(new String[]{"cliente", "clientes"});
        }
        model.addAttribute("fechaIni",new Date(System.currentTimeMillis()));
        model.addAttribute("fechaFin",new Date(System.currentTimeMillis()));
        model.addAttribute("cliente",new Cliente());
        model.addAttribute("clientes",Cliente.findAllClientes());
        model.addAttribute("dependencies", dependencies);
        return "movimientoes/extractoForm";
    }
	
	@RequestMapping(value="/extractoReport", method = RequestMethod.POST)
    public String obtenerExtracto(@RequestParam(value = "cliente", required = true) Cliente cliente, @RequestParam(value = "fechaIni", required = true) Date fechaIni, @RequestParam(value = "fechaFin", required = true) Date fechaFin, Model model) {
		
		Set<Cuenta> cuentas = cliente.getCuentas();
		if(fechaFin.before(fechaIni)){
			return "movimientoes/extractoForm"; 
		}
		List<Movimiento> movimientos = new ArrayList();
		for (Cuenta cuenta : cuentas) {
			movimientos.addAll(cuenta.getMovimientos());
		}
		for(Movimiento movimiento :movimientos){
		}
        
        return "movimientoes/extractoReport";
    }

	@RequestMapping(method = RequestMethod.POST)
    public String create(@Valid Movimiento movimiento, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("movimiento", movimiento);
            addDateTimeFormatPatterns(model);
            System.out.println(model);
            return "movimientoes/create";
        }
        boolean transaccionValida=false;
        if(movimiento.getTipo()==TipoMovimiento.DEBITO){
        	movimiento.getCuenta().aumentarSaldo(movimiento.getValor());
        	transaccionValida=true;
        }else{
        	transaccionValida=movimiento.getCuenta().reducirSaldo(movimiento.getValor());
        }
        if(!transaccionValida){
            model.addAttribute("movimiento", movimiento);
            model.addAttribute("mensaje","no cuenta con suficiente saldo.");
            addDateTimeFormatPatterns(model);
            return "movimientoes/credito";
        }
        movimiento.persist();
        movimiento.getCuenta().persist();
        return "redirect:/movimientoes/" + encodeUrlPathSegment(movimiento.getId().toString(), request);
    }

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("movimiento", new Movimiento());
        addDateTimeFormatPatterns(model);
        List dependencies = new ArrayList();
        if (Cuenta.countCuentas() == 0) {
            dependencies.add(new String[]{"cuenta", "cuentas"});
        }
        model.addAttribute("dependencies", dependencies);
        return "movimientoes/create";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Long id, Model model) {
        addDateTimeFormatPatterns(model);
        model.addAttribute("movimiento", Movimiento.findMovimiento(id));
        model.addAttribute("itemId", id);
        return "movimientoes/show";
    }

	@RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("movimientoes", Movimiento.findMovimientoEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Movimiento.countMovimientoes() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("movimientoes", Movimiento.findAllMovimientoes());
        }
        addDateTimeFormatPatterns(model);
        return "movimientoes/list";
    }

	@RequestMapping(method = RequestMethod.PUT)
    public String update(@Valid Movimiento movimiento, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("movimiento", movimiento);
            addDateTimeFormatPatterns(model);
            return "movimientoes/update";
        }
        movimiento.merge();
        return "redirect:/movimientoes/" + encodeUrlPathSegment(movimiento.getId().toString(), request);
    }

	@RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("movimiento", Movimiento.findMovimiento(id));
        addDateTimeFormatPatterns(model);
        return "movimientoes/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Movimiento.findMovimiento(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/movimientoes?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }

	@ModelAttribute("cuentas")
    public Collection<Cuenta> populateCuentas() {
        return Cuenta.findAllCuentas();
    }

	@ModelAttribute("tipomovimientoes")
    public Collection<TipoMovimiento> populateTipoMovimientoes() {
        return Arrays.asList(TipoMovimiento.class.getEnumConstants());
    }

	void addDateTimeFormatPatterns(Model model) {
        model.addAttribute("movimiento_fecha_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
	

}
