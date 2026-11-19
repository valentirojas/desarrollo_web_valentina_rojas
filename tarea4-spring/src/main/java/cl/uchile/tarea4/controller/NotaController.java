package cl.uchile.tarea4.controller;

import cl.uchile.tarea4.model.Avistamiento;
import cl.uchile.tarea4.model.Nota;
import cl.uchile.tarea4.repository.AvistamientoRepository;
import cl.uchile.tarea4.repository.NotaRepository;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/avistamientos")
public class NotaController {

    private final AvistamientoRepository avistamientoRepository;
    private final NotaRepository notaRepository;

    public NotaController(
            AvistamientoRepository avistamientoRepository,
            NotaRepository notaRepository) {

        this.avistamientoRepository = avistamientoRepository;
        this.notaRepository = notaRepository;
    }

    @PostMapping("/{id}/notas")
    public Map<String, Object> evaluar(
            @PathVariable Integer id,
            @RequestBody Map<String, Integer> datos) {

        Integer valor = datos.get("nota");

        if (valor == null || valor < 1 || valor > 7) {
            throw new IllegalArgumentException(
                    "La nota debe ser un entero entre 1 y 7"
            );
        }

        Avistamiento avistamiento = avistamientoRepository
                .findById(id)
                .orElseThrow(() -> new AvistamientoNoEncontradoException());

        Nota nota = new Nota();
        nota.setAvistamiento(avistamiento);
        nota.setNota(valor);

        notaRepository.saveAndFlush(nota);

        Double promedio = notaRepository.obtenerPromedio(id);

        return Map.of(
                "avistamientoId", id,
                "promedio", promedio
        );
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(IllegalArgumentException.class)
    public Map<String, String> notaInvalida(
            IllegalArgumentException error) {

        return Map.of("error", error.getMessage());
    }

    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ExceptionHandler(AvistamientoNoEncontradoException.class)
    public Map<String, String> avistamientoNoEncontrado() {
        return Map.of("error", "Avistamiento no encontrado");
    }

    private static class AvistamientoNoEncontradoException
            extends RuntimeException {
    }
}
