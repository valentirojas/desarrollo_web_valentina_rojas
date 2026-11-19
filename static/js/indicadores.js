
document.addEventListener("DOMContentLoaded", () => {
  const cargarEstadisticas = async () => {
    try {
      const respuesta = await fetch("/api/estadisticas");

      if (!respuesta.ok) {
        throw new Error("No se pudieron cargar las estadísticas.");
      }

      const datos = await respuesta.json();

      const dias = datos.avistamientos_por_dia;
      const tipos = datos.avistamientos_por_tipo;
      const comunas = datos.voluntarios_por_comuna;

      new Chart(document.getElementById("grafico-dias"), {
        type: "line",
        data: {
          labels: dias.map((dato) => dato.fecha),
          datasets: [{
            label: "Cantidad de avistamientos",
            data: dias.map((dato) => dato.cantidad),
            borderColor: "#638B48",
            backgroundColor: "#A5C882",
            tension: 0.2
          }]
        },
        options: {
          responsive: true,
          scales: {
            y: {
              beginAtZero: true,
              ticks: {
                precision: 0
              }
            }
          }
        }
      });

      new Chart(document.getElementById("grafico-tipos"), {
        type: "pie",
        data: {
          labels: tipos.map((dato) => dato.tipo),
          datasets: [{
            label: "Avistamientos",
            data: tipos.map((dato) => dato.cantidad),
            backgroundColor: [
              "#638B48",
              "#A5C882",
              "#C48A4A",
              "#E2B86C",
              "#789FA0",
              "#B89CB8"
            ]
          }]
        },
        options: {
          responsive: true
        }
      });

      new Chart(document.getElementById("grafico-comunas"), {
        type: "bar",
        data: {
          labels: comunas.map((dato) => dato.comuna),
          datasets: [{
            label: "Voluntarios registrados",
            data: comunas.map((dato) => dato.cantidad),
            backgroundColor: "#C48A4A"
          }]
        },
        options: {
          responsive: true,
          scales: {
            y: {
              beginAtZero: true,
              ticks: {
                precision: 0
              }
            }
          }
        }
      });

    } catch (error) {
      document.getElementById("error-estadisticas").textContent =
        error.message;
    }
  };

  cargarEstadisticas();
});

