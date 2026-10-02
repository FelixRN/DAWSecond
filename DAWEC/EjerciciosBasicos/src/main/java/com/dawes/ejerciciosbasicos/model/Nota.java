package com.dawes.ejerciciosbasicos.model;

import java.util.Random;

public class Nota {
    public int generarNota() {
        Random random = new Random();
        return random.nextInt(10) + 1;
    }
}
