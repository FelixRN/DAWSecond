package com.felix.colegio.DTO;

public class DesplegableDTO {
    private int id;
    private String descripcion;

    public DesplegableDTO() {
    }

    public DesplegableDTO(int id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
    }

    public int getId() {
        return id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}

