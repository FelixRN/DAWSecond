package com.dawes.ejerciciosbasicos.controller;

import com.dawes.ejerciciosbasicos.model.GetDate;
import com.dawes.ejerciciosbasicos.model.NumberGenerate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@org.springframework.stereotype.Controller

public class Controller {

    @RequestMapping(value="/frase")
    public String Frase() {
        return "frase";
    }

    @RequestMapping(value="/hora")
    public String obtenerHora(Model model) {
        GetDate date = new GetDate();
        Date fecha1 = date.obtenerHora();
        model.addAttribute("time", fecha1);
        return "hora";
    }

    @RequestMapping(value="/dado")
    public String obtenerAleatorio(Model model) {
        NumberGenerate generador = new NumberGenerate();
        int numero = generador.generar();
        model.addAttribute("numeroGenerado", numero);
        return "dado";
    }

}
