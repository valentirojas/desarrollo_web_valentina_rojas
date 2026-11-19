
const formularioAvistamiento =
  document.getElementById("form-avistamiento");

const voluntario = document.getElementById("voluntario");
const tipoAve = document.getElementById("tipo-ave");
const nombreAve = document.getElementById("nombre-ave");
const lugar = document.getElementById("lugar");
const fecha = document.getElementById("fecha");
const hora = document.getElementById("hora");
const registro = document.getElementById("registro");

const errorVoluntario = document.getElementById("error-voluntario");
const errorTipoAve = document.getElementById("error-tipo-ave");
const errorNombreAve = document.getElementById("error-nombre-ave");
const errorLugar = document.getElementById("error-lugar");
const errorFecha = document.getElementById("error-fecha");
const errorHora = document.getElementById("error-hora");
const errorRegistro = document.getElementById("error-registro");

const mensajeAvistamiento =
  document.getElementById("mensaje-avistamiento");


// Validar fecha y hora del avistamiento
const validarFecha = (fechaValor, horaValor) => {
  if (!fechaValor || !horaValor) {
    return false;
  }

  const fechaAvistamiento =
    new Date(fechaValor + "T" + horaValor);

  if (isNaN(fechaAvistamiento.getTime())) {
    return false;
  }

  const ahora = new Date();

  if (fechaAvistamiento > ahora) {
    return false;
  }

  const haceTreintaDias = new Date();
  haceTreintaDias.setDate(ahora.getDate() - 30);

  if (fechaAvistamiento < haceTreintaDias) {
    return false;
  }

  return true;
};


// Validar fotografías y videos
const validarArchivos = () => {
  if (registro.files.length === 0) {
    return false;
  }

  const tiposPermitidos = [
    "image/jpeg",
    "image/png",
    "image/gif",
    "image/webp",
    "video/mp4",
    "video/webm",
    "video/quicktime"
  ];

  for (const archivo of registro.files) {
    if (!tiposPermitidos.includes(archivo.type)) {
      return false;
    }
  }

  return true;
};


// Validar formulario antes de enviarlo
formularioAvistamiento.addEventListener("submit", (event) => {
  let valido = true;

  // Voluntario
  if (voluntario.value === "") {
    errorVoluntario.classList.add("visible");
    valido = false;
  } else {
    errorVoluntario.classList.remove("visible");
  }

  // Tipo de ave
  if (tipoAve.value === "") {
    errorTipoAve.classList.add("visible");
    valido = false;
  } else {
    errorTipoAve.classList.remove("visible");
  }

  // Nombre del ave
  if (nombreAve.value === "") {
    errorNombreAve.classList.add("visible");
    valido = false;
  } else {
    errorNombreAve.classList.remove("visible");
  }

  // Lugar
  if (lugar.value.trim() === "") {
    errorLugar.classList.add("visible");
    valido = false;
  } else {
    errorLugar.classList.remove("visible");
  }

  // Fecha y hora
  if (!validarFecha(fecha.value, hora.value)) {
    errorFecha.classList.add("visible");
    valido = false;
  } else {
    errorFecha.classList.remove("visible");
  }

  // Hora obligatoria
  if (hora.value === "") {
    errorHora.classList.add("visible");
    valido = false;
  } else {
    errorHora.classList.remove("visible");
  }

  // Fotografías y videos
  if (!validarArchivos()) {
    errorRegistro.classList.add("visible");
    valido = false;
  } else {
    errorRegistro.classList.remove("visible");
  }

  // Detener el envío solamente cuando existan errores
  if (!valido) {
    event.preventDefault();
    mensajeAvistamiento.innerText = "";
  }
});
