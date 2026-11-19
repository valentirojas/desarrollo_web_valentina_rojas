package cl.uchile.tarea4.controller;

import cl.uchile.tarea4.model.Avistamiento;
import cl.uchile.tarea4.repository.AvistamientoRepository;
import cl.uchile.tarea4.repository.NotaRepository;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

@RestController
@RequestMapping("/api/avistamientos")
public class AvistamientoController {

    private final AvistamientoRepository avistamientoRepository;
    private final NotaRepository notaRepository;

    public AvistamientoController(
            AvistamientoRepository avistamientoRepository,
            NotaRepository notaRepository) {

        this.avistamientoRepository = avistamientoRepository;
        this.notaRepository = notaRepository;
    }

    @GetMapping
    public List<Map<String, Object>> buscar(
            @RequestParam(defaultValue = "") String texto) {

        List<Avistamiento> avistamientos =
                avistamientoRepository.buscar(texto);

        return avistamientos.stream().map(a -> {

            Map<String, Object> resultado = new HashMap<>();

            resultado.put("id", a.getId());
            resultado.put("ave", a.getAve().getNombre());
            resultado.put("voluntario", a.getVoluntario().getNombre());
            resultado.put("comuna",
                    a.getVoluntario().getComuna().getNombre());
            resultado.put("fecha",
                    a.getFechaHora().toLocalDate().toString());

            Double promedio = notaRepository.obtenerPromedio(a.getId());

            resultado.put("promedio", promedio);

            return resultado;

        }).toList();
    }
}
