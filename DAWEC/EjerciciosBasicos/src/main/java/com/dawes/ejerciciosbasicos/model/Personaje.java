package com.dawes.ejerciciosbasicos.model;

public class Personaje {
    private String nombre;
    private String clase;
    private int nivel;
    private String arma;

    public Personaje(String nombre, String clase, int nivel, String arma) {
        this.nombre = nombre;
        this.clase = clase;
        this.nivel = nivel;
        this.arma = arma;
    }

    public String getNombre() {
        return nombre;
    }

    public String getClase() {
        return clase;
    }

    public int getNivel() {
        return nivel;
    }

    public String getArma() {
        return arma;
    }
}
