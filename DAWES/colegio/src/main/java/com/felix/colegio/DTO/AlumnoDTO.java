package com.felix.colegio.DTO;

public class AlumnoDTO {
    private String id;
    private String nombre;
    private String apellido;
    private int idMunicipio;
    private String municipio;
    private boolean familiaNumerosa;
    private boolean activo;

    public AlumnoDTO() {

    }
    public AlumnoDTO(String id, String nombre, String apellido, int
                             idMunicipio, String municipio,
                     boolean familiaNumerosa, boolean activo) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.idMunicipio = idMunicipio;
        this.municipio = municipio;
        this.familiaNumerosa = familiaNumerosa;
        this.activo = activo;
    }

    public String getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public int getIdMunicipio() {
        return idMunicipio;
    }

    public String getMunicipio() {
        return municipio;
    }

    public boolean isFamiliaNumerosa() {
        return familiaNumerosa;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public void setIdMunicipio(int idMunicipio) {
        this.idMunicipio = idMunicipio;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setFamiliaNumerosa(boolean familiaNumerosa) {
        this.familiaNumerosa = familiaNumerosa;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
}
