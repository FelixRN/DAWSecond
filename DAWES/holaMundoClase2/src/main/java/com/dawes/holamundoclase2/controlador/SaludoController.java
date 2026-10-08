package com.dawes.holamundoclase2.controlador;

import com.dawes.holamundoclase2.modelo.GeneradorNumero;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class SaludoController {
    @RequestMapping(value="/hola")
    public String Hola() {
        return "saludo";
    }


    @RequestMapping(value="/aleatorio")
    public String obtenerAleatorio(Model model) {
        GeneradorNumero generador = new GeneradorNumero();
        int numero = generador.generar();
        model.addAttribute("numeroGenerado", numero);
        return "numero";
    }
}
