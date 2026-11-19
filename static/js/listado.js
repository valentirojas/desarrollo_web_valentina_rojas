const avistamientos = [
  {
    nombre: "Chucao",
    tipo: "terrestre",
    lugar: "Puerto Montt",
    fecha: "2026-08-30",
    hora: "09:20"
  },
  {
    nombre: "Hued hued del sur",
    tipo: "terrestre",
    lugar: "Puerto Montt",
    fecha: "2026-08-29",
    hora: "11:10"
  },
  {
    nombre: "Bandurria",
    tipo: "terrestre",
    lugar: "Valdivia",
    fecha: "2026-08-27",
    hora: "15:30"
  },
  {
    nombre: "Traro",
    tipo: "rapaz",
    lugar: "Puerto Montt",
    fecha: "2026-08-25",
    hora: "13:45"
  },
  {
    nombre: "Cisne de cuello negro",
    tipo: "acuatica",
    lugar: "Chiloé",
    fecha: "2026-08-23",
    hora: "08:15"
  },
  {
    nombre: "Tiuque",
    tipo: "rapaz",
    lugar: "Puerto Montt",
    fecha: "2026-08-21",
    hora: "17:00"
  },
  {
    nombre: "Loro tricahue",
    tipo: "terrestre",
    lugar: "Santo Domingo",
    fecha: "2026-08-19",
    hora: "10:40"
  },
  {
    nombre: "Tórtola turca",
    tipo: "terrestre",
    lugar: "Santo Domingo",
    fecha: "2026-08-17",
    hora: "16:25"
  }
];

const filtroTipo = document.getElementById("filtro-tipo");
const orden = document.getElementById("orden");

const lista = document.getElementById("lista-avistamientos");

const cantidadResultados =
  document.getElementById("cantidad-resultados");

const botonAnterior =
  document.getElementById("anterior");

const botonSiguiente =
  document.getElementById("siguiente");

const paginaActualTexto =
  document.getElementById("pagina-actual");

let paginaActual = 1;

const elementosPorPagina = 3;

const obtenerNombreTipo = (tipo) => {
  if (tipo === "rapaz") {
    return "Rapaz";
  }

  if (tipo === "acuatica") {
    return "Acuática";
  }

  if (tipo === "terrestre") {
    return "Terrestre";
  }

  if (tipo === "marina") {
    return "Marina";
  }

  return tipo;
};

const obtenerAvistamientosProcesados = () => {
  let resultado = [...avistamientos];

  if (filtroTipo.value !== "") {
    resultado = resultado.filter((avistamiento) => {
      return avistamiento.tipo === filtroTipo.value;
    });
  }

  if (orden.value === "fecha-reciente") {
    resultado.sort((a, b) => {
      return new Date(b.fecha) - new Date(a.fecha);
    });
  }

  if (orden.value === "fecha-antigua") {
    resultado.sort((a, b) => {
      return new Date(a.fecha) - new Date(b.fecha);
    });
  }

  if (orden.value === "lugar-az") {
    resultado.sort((a, b) => {
      return a.lugar.localeCompare(b.lugar);
    });
  }

  if (orden.value === "lugar-za") {
    resultado.sort((a, b) => {
      return b.lugar.localeCompare(a.lugar);
    });
  }

  return resultado;
};

const mostrarAvistamientos = () => {
  const resultado =
    obtenerAvistamientosProcesados();

  const totalPaginas =
    Math.ceil(
      resultado.length / elementosPorPagina
    );

  if (
    paginaActual > totalPaginas &&
    totalPaginas > 0
  ) {
    paginaActual = totalPaginas;
  }

  if (totalPaginas === 0) {
    paginaActual = 1;
  }

  const inicio =
    (paginaActual - 1) * elementosPorPagina;

  const fin =
    inicio + elementosPorPagina;

  const pagina =
    resultado.slice(inicio, fin);

  lista.innerHTML = "";

  pagina.forEach((avistamiento) => {
    const articulo =
      document.createElement("article");

    articulo.classList.add("avistamiento");

    const titulo =
      document.createElement("h3");

    titulo.innerText =
      avistamiento.nombre;

    const tipo =
      document.createElement("p");

    tipo.innerText =
      "Tipo: " +
      obtenerNombreTipo(
        avistamiento.tipo
      );

    const lugar =
      document.createElement("p");

    lugar.innerText =
      "Lugar: " +
      avistamiento.lugar;

    const fecha =
      document.createElement("p");

    fecha.innerText =
      "Fecha: " +
      avistamiento.fecha +
      " - " +
      avistamiento.hora;

    articulo.appendChild(titulo);
    articulo.appendChild(tipo);
    articulo.appendChild(lugar);
    articulo.appendChild(fecha);

    lista.appendChild(articulo);
  });

  cantidadResultados.innerText =
    "Se encontraron " +
    resultado.length +
    " avistamientos.";

  paginaActualTexto.innerText =
    "Página " +
    paginaActual +
    " de " +
    Math.max(totalPaginas, 1);

  botonAnterior.disabled =
    paginaActual === 1;

  botonSiguiente.disabled =
    paginaActual >= totalPaginas;
};

filtroTipo.addEventListener(
  "change",
  () => {
    paginaActual = 1;
    mostrarAvistamientos();
  }
);

orden.addEventListener(
  "change",
  () => {
    paginaActual = 1;
    mostrarAvistamientos();
  }
);

botonAnterior.addEventListener(
  "click",
  () => {
    if (paginaActual > 1) {
      paginaActual--;
      mostrarAvistamientos();
    }
  }
);

botonSiguiente.addEventListener(
  "click",
  () => {
    const resultado =
      obtenerAvistamientosProcesados();

    const totalPaginas =
      Math.ceil(
        resultado.length /
        elementosPorPagina
      );

    if (paginaActual < totalPaginas) {
      paginaActual++;
      mostrarAvistamientos();
    }
  }
);

mostrarAvistamientos();