package com.examen.rojasnacarifelix.model;

public class Jugador {

    private String nickname;
    private String equipo;
    private int kill;
    private int muertes;
    private int asistencia;

    public Jugador(String nickname, String equipo, int kill, int muertes, int asistencia) {
        this.nickname = nickname;
        this.equipo = equipo;
        this.kill = kill;
        this.muertes = muertes;
        this.asistencia = asistencia;
    }
    public String getNickname() {return nickname;}
    public String getEquipo() {return equipo;}
    public int getKill() {return kill;}
    public int getMuertes() {return muertes;}
    public int getAsistencia() {return asistencia;}
}
