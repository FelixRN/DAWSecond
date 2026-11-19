package com.dawes.colegioclase.controlador.rest;
import com.dawes.colegioclase.dto.AlumnoDTO;
import com.dawes.colegioclase.service.AlumnoService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1")
public class AlumnoRestController {
    private final AlumnoService alumnoService;

    public AlumnoRestController(AlumnoService alumnoService) {
        this.alumnoService = alumnoService;
    }

    @PostMapping("/alumnos")
    public ResponseEntity<AlumnoDTO> insertarAlumno(@RequestBody AlumnoDTO alumno) {
        int resultado = alumnoService.insertarAlumno(alumno);
        if (resultado == 1) {
            return new ResponseEntity<>(alumno, HttpStatus.CREATED);
        }
        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
