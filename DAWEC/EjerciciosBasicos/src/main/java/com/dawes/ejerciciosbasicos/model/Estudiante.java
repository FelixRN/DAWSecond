package com.dawes.ejerciciosbasicos.model;

public class Estudiante {
    private String nombre;
    private String apellido;
    private String asignatura;

    public Estudiante(String nombre, String apellido, String asignatura) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.asignatura = asignatura;
    }
    public String getNombre() {return nombre;}
    public String getApellido() {
        return apellido;
    }
    public String getAsignatura() {return asignatura;}
}
