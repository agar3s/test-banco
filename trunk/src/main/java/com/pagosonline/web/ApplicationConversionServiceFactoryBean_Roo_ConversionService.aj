// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pagosonline.web;

import com.pagosonline.logica.Cliente;
import com.pagosonline.logica.Cuenta;
import com.pagosonline.logica.Movimiento;
import java.lang.String;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    Converter<Cuenta, String> ApplicationConversionServiceFactoryBean.getCuentaConverter() {
        return new Converter<Cuenta, String>() {
            public String convert(Cuenta source) {
                return new StringBuilder().append(source.getNumeroCuenta()).append(" ").append(source.getSaldo()).toString();
            }
        };
    }
    
    Converter<Movimiento, String> ApplicationConversionServiceFactoryBean.getMovimientoConverter() {
        return new Converter<Movimiento, String>() {
            public String convert(Movimiento source) {
                return new StringBuilder().append(source.getValor()).append(" ").append(source.getFecha()).toString();
            }
        };
    }
    
    Converter<Cliente, String> ApplicationConversionServiceFactoryBean.getClienteConverter() {
        return new Converter<Cliente, String>() {
            public String convert(Cliente source) {
                return new StringBuilder().append(source.getNombre()).append(" ").append(source.getDireccion()).append(" ").append(source.getTelefono()).toString();
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getCuentaConverter());
        registry.addConverter(getMovimientoConverter());
        registry.addConverter(getClienteConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}