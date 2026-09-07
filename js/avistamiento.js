const formularioAvistamiento =
  document.getElementById("form-avistamiento");

const tipoAve = document.getElementById("tipo-ave");
const nombreAve = document.getElementById("nombre-ave");
const lugar = document.getElementById("lugar");
const fecha = document.getElementById("fecha");
const hora = document.getElementById("hora");
const registro = document.getElementById("registro");

const errorTipoAve = document.getElementById("error-tipo-ave");
const errorNombreAve = document.getElementById("error-nombre-ave");
const errorLugar = document.getElementById("error-lugar");
const errorFecha = document.getElementById("error-fecha");
const errorHora = document.getElementById("error-hora");
const errorRegistro = document.getElementById("error-registro");

const mensajeAvistamiento =
  document.getElementById("mensaje-avistamiento");

const validarFecha = (fechaValor, horaValor) => {
  if (!fechaValor || !horaValor) {
    return false;
  }

  const fechaAvistamiento =
    new Date(fechaValor + "T" + horaValor);

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

formularioAvistamiento.addEventListener("submit", (event) => {
  event.preventDefault();

  const nombreValor = nombreAve.value.trim();
  const lugarValor = lugar.value.trim();

  let valido = true;

  if (tipoAve.value === "") {
    errorTipoAve.classList.add("visible");
    valido = false;
  } else {
    errorTipoAve.classList.remove("visible");
  }

  if (nombreValor.length < 2) {
    errorNombreAve.classList.add("visible");
    valido = false;
  } else {
    errorNombreAve.classList.remove("visible");
  }

  if (lugarValor === "") {
    errorLugar.classList.add("visible");
    valido = false;
  } else {
    errorLugar.classList.remove("visible");
  }

  if (!validarFecha(fecha.value, hora.value)) {
    errorFecha.classList.add("visible");
    valido = false;
  } else {
    errorFecha.classList.remove("visible");
  }

  if (hora.value === "") {
    errorHora.classList.add("visible");
    valido = false;
  } else {
    errorHora.classList.remove("visible");
  }

  if (registro.files.length === 0) {
    errorRegistro.classList.add("visible");
    valido = false;
  } else {
    errorRegistro.classList.remove("visible");
  }

  if (!valido) {
    mensajeAvistamiento.innerText = "";
    return;
  }

  mensajeAvistamiento.innerText =
    "Avistamiento registrado correctamente.";

  formularioAvistamiento.reset();
});

