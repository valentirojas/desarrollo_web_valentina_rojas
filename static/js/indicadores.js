
const graficoVoluntarios =
  document.getElementById("grafico-voluntarios");

const graficoAvistamientos =
  document.getElementById("grafico-avistamientos");


// Obtener los datos enviados por Flask

const voluntariosPorRegion = JSON.parse(
  document.getElementById("datos-voluntarios").textContent
);

const avistamientosPorAve = JSON.parse(
  document.getElementById("datos-avistamientos").textContent
);


// Función para crear las barras de los gráficos

const crearBarra = (nombre, cantidad, maximo) => {
  const contenedor = document.createElement("article");
  contenedor.classList.add("barra-contenedor");

  const etiqueta = document.createElement("p");
  etiqueta.classList.add("barra-etiqueta");
  etiqueta.innerText = nombre;

  const barra = document.createElement("div");
  barra.classList.add("barra");

  const valor = document.createElement("div");
  valor.classList.add("barra-valor");

  const porcentaje = (cantidad / maximo) * 100;

  valor.style.width = porcentaje + "%";
  valor.innerText = cantidad;

  barra.appendChild(valor);

  contenedor.appendChild(etiqueta);
  contenedor.appendChild(barra);

  return contenedor;
};


// --------------------------------------------------
// Gráfico de voluntarios por región
// --------------------------------------------------

if (voluntariosPorRegion.length === 0) {

  graficoVoluntarios.innerText =
    "Todavía no existen voluntarios registrados.";

} else {

  const cantidades = voluntariosPorRegion.map(
    voluntario => voluntario.cantidad
  );

  const maximoVoluntarios = Math.max(...cantidades);

  voluntariosPorRegion.forEach((voluntario) => {

    const barra = crearBarra(
      voluntario.nombre,
      voluntario.cantidad,
      maximoVoluntarios
    );

    graficoVoluntarios.appendChild(barra);

  });
}


// --------------------------------------------------
// Gráfico de avistamientos por especie
// --------------------------------------------------

if (avistamientosPorAve.length === 0) {

  graficoAvistamientos.innerText =
    "Todavía no existen avistamientos registrados.";

} else {

  const cantidades = avistamientosPorAve.map(
    avistamiento => avistamiento.cantidad
  );

  const maximoAvistamientos = Math.max(...cantidades);

  avistamientosPorAve.forEach((avistamiento) => {

    const barra = crearBarra(
      avistamiento.nombre,
      avistamiento.cantidad,
      maximoAvistamientos
    );

    graficoAvistamientos.appendChild(barra);

  });
}
