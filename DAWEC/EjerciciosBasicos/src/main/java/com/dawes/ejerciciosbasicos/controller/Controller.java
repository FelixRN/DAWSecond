package com.dawes.ejerciciosbasicos.controller;

import com.dawes.ejerciciosbasicos.model.*;

import java.util.List;
import java.util.Random;
import java.time.LocalTime;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@org.springframework.stereotype.Controller

public class Controller {

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

    @RequestMapping(value="/contraseña")
    public String obtenerPassword(Model model) {
        PasswordGenerator generadorP = new PasswordGenerator();
        String pass = PasswordGenerator.getPassword(
                        PasswordGenerator.MINUSCULAS+
                            PasswordGenerator.MAYUSCULAS+
                            PasswordGenerator.ESPECIALES,10);
        model.addAttribute("passGenerado", pass);
        return "contraseña";
    }

    @RequestMapping(value="/personaje")
    public String obtenerPersonaje(Model model) {
        Personaje personaje = new Personaje(
            "Arthas",
            "Paladín",
            35,
            "Frostmourne"
    );
        model.addAttribute("personaje", personaje);
        return "personaje";
    }

    @RequestMapping(value="/frase")
    public String obtenerFrase(Model model) {
    List<String> frase = List.of(
            "Nunca dejes de aprender papi.",
            "Pasito a pasito.",
            "La práctica hace al maestro.",
            "Cada error es una oportunidad para mejorar.",
            "Hoy es un buen día para empezar."
    );

    Random random = new Random();
    int indice = random.nextInt(frase.size());
    String fraseElegida = frase.get(indice);

    model.addAttribute("frase", fraseElegida);
    return "frase";
}

    @RequestMapping(value="/saludoHora")
    public String obtenerSaludoHora(Model model) {
        int hora = LocalTime.now().getHour();
        String saludo;

        if (hora >= 6 && hora < 12) {
            saludo = "Buenos días";
        } else if (hora >= 12 && hora < 20) {
            saludo = "Buenas tardes";
        } else {
            saludo = "Buenas noches";
        }

        model.addAttribute("saludo", saludo);
        model.addAttribute("nombre", "Adrián");
        return "saludoHora";
    }

    @RequestMapping(value="/fichaEstudiante")
    public String obtenerFichaEstudiante(Model model) {
        Estudiante estudiante = new Estudiante(
                "Jorgue",
                "Rojas",
                "Mates"
        );
        Nota generadorN = new Nota();
        int numero = generadorN.generarNota();

        model.addAttribute("fichaEstudiante", estudiante);
        model.addAttribute("numeroNota", numero);
        return "fichaEstudiante";
    }
}
