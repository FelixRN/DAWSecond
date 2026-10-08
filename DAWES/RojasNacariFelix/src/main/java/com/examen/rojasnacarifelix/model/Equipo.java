package com.examen.rojasnacarifelix.model;

public class Equipo {
    public String nombre;
    public String region;
    public int puntuacionF;

    public Equipo(String nombre, String region, int puntuacionF) {
        this.nombre = nombre;
        this.region = region;
        this.puntuacionF = puntuacionF;
    }

    public String getNombre() {
        return nombre;
    }

    public String getRegion() {
        return region;
    }

    public int getPuntuacionF() {
        return puntuacionF;
    }
}

