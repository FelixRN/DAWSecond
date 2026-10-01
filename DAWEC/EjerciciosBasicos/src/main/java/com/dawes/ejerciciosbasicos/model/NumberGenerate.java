package com.dawes.ejerciciosbasicos.model;
import java.util.Random;

public class NumberGenerate {
    public int generar() {
        Random random = new Random();
        return random.nextInt(6) + 1;
    }

}
