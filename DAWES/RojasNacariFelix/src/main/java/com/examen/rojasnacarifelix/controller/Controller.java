package com.examen.rojasnacarifelix.controller;


import com.examen.rojasnacarifelix.model.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Random;

@org.springframework.stereotype.Controller


public class Controller {

    @RequestMapping(value ="/enfrentamiento")
    public String obtenerEnfrentamiento(Model model) {
        Equipo equipo1 = new Equipo(
                "TFS",
                "EUW",
                67

        );
        Equipo equipo2 = new Equipo(
                "AAA",
                "LAN",
                95
        );
        model.addAttribute("equipo1", equipo1);
        model.addAttribute("equipo2", equipo2);
        return "enfrentamiento";
    }

    @RequestMapping(value = "/jugador")
    public String obtenerJugador(Model model) {
        Jugador jugador = new Jugador(
                "Fenixpro14",
                "SKT",
                150,
                3,
                230
        );
        int muertes = jugador.getMuertes();
        int participaciones = jugador.getKill() + jugador.getAsistencia();

        int KDA = muertes / participaciones;
        
        model.addAttribute("jugador", jugador);
        model.addAttribute("KDA", KDA);

        return "jugador";
    }

    @RequestMapping(value="/mvp")
    public String obtenerMvp(Model model) {
        List<String> mvp = List.of(
                "AnvilPowered",
                "Fenixpro14",
                "Snape",
                "BoxBox",
                "Hide"
        );
        Random random = new Random();
        int indice = random.nextInt(mvp.size());
        String mvpElegido = mvp.get(indice);

        model.addAttribute("mvp", mvpElegido);
        return "mvp";
    }

}
