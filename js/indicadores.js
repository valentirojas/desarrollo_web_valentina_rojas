const voluntarios = [
  {
    region: "Los Lagos"
  },
  {
    region: "Los Lagos"
  },
  {
    region: "Los Lagos"
  },
  {
    region: "Los Ríos"
  },
  {
    region: "Los Ríos"
  },
  {
    region: "Valparaíso"
  },
  {
    region: "Valparaíso"
  },
  {
    region: "Valparaíso"
  },
  {
    region: "Metropolitana"
  },
  {
    region: "Metropolitana"
  }
];

const avistamientosIndicadores = [
  {
    nombre: "Chucao",
    tipo: "terrestre"
  },
  {
    nombre: "Hued hued del sur",
    tipo: "terrestre"
  },
  {
    nombre: "Bandurria",
    tipo: "terrestre"
  },
  {
    nombre: "Traro",
    tipo: "rapaz"
  },
  {
    nombre: "Cisne de cuello negro",
    tipo: "acuatica"
  },
  {
    nombre: "Tiuque",
    tipo: "rapaz"
  },
  {
    nombre: "Loro tricahue",
    tipo: "terrestre"
  },
  {
    nombre: "Tórtola turca",
    tipo: "terrestre"
  }
];

const totalVoluntarios =
  document.getElementById("total-voluntarios");

const totalAvistamientos =
  document.getElementById("total-avistamientos");

const graficoVoluntarios =
  document.getElementById("grafico-voluntarios");

const graficoAvistamientos =
  document.getElementById("grafico-avistamientos");

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

  const porcentaje =
    (cantidad / maximo) * 100;

  valor.style.width = porcentaje + "%";
  valor.innerText = cantidad;

  barra.appendChild(valor);

  contenedor.appendChild(etiqueta);
  contenedor.appendChild(barra);

  return contenedor;
};

const voluntariosPorRegion = {
  "Los Lagos": 0,
  "Los Ríos": 0,
  "Valparaíso": 0,
  "Metropolitana": 0
};

voluntarios.forEach((voluntario) => {
  voluntariosPorRegion[voluntario.region]++;
});

const avistamientosPorTipo = {
  "Terrestre": 0,
  "Rapaz": 0,
  "Acuática": 0
};

avistamientosIndicadores.forEach((avistamiento) => {
  if (avistamiento.tipo === "terrestre") {
    avistamientosPorTipo["Terrestre"]++;
  }

  if (avistamiento.tipo === "rapaz") {
    avistamientosPorTipo["Rapaz"]++;
  }

  if (avistamiento.tipo === "acuatica") {
    avistamientosPorTipo["Acuática"]++;
  }
});

totalVoluntarios.innerText =
  voluntarios.length;

totalAvistamientos.innerText =
  avistamientosIndicadores.length;

const maximoVoluntarios =
  Math.max(
    ...Object.values(voluntariosPorRegion)
  );

Object.entries(voluntariosPorRegion).forEach(
  ([region, cantidad]) => {
    const barra =
      crearBarra(
        region,
        cantidad,
        maximoVoluntarios
      );

    graficoVoluntarios.appendChild(barra);
  }
);

const maximoAvistamientos =
  Math.max(
    ...Object.values(avistamientosPorTipo)
  );

Object.entries(avistamientosPorTipo).forEach(
  ([tipo, cantidad]) => {
    const barra =
      crearBarra(
        tipo,
        cantidad,
        maximoAvistamientos
      );

    graficoAvistamientos.appendChild(barra);
  }
);