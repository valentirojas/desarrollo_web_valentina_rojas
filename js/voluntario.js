const formulario = document.getElementById("form-voluntario");

const nombre = document.getElementById("nombre");
const email = document.getElementById("email");
const telefono = document.getElementById("telefono");
const region = document.getElementById("region");
const comuna = document.getElementById("comuna");

const errorNombre = document.getElementById("error-nombre");
const errorEmail = document.getElementById("error-email");
const errorTelefono = document.getElementById("error-telefono");
const errorRegion = document.getElementById("error-region");
const errorComuna = document.getElementById("error-comuna");

const mensajeExito = document.getElementById("mensaje-exito");

const validarEmail = (valor) => {
  const expresion = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return expresion.test(valor);
};

const validarTelefono = (valor) => {
  const expresion = /^\+?[0-9]{8,12}$/;
  return expresion.test(valor);
};

formulario.addEventListener("submit", (event) => {
  event.preventDefault();

  const nombreValor = nombre.value.trim();
  const emailValor = email.value.trim();
  const telefonoValor = telefono.value.trim();
  const comunaValor = comuna.value.trim();

  let valido = true;

  if (nombreValor.length < 3) {
    errorNombre.classList.add("visible");
    valido = false;
  } else {
    errorNombre.classList.remove("visible");
  }

  if (!validarEmail(emailValor)) {
    errorEmail.classList.add("visible");
    valido = false;
  } else {
    errorEmail.classList.remove("visible");
  }

  if (!validarTelefono(telefonoValor)) {
    errorTelefono.classList.add("visible");
    valido = false;
  } else {
    errorTelefono.classList.remove("visible");
  }

  if (region.value === "") {
    errorRegion.classList.add("visible");
    valido = false;
  } else {
    errorRegion.classList.remove("visible");
  }

  if (comunaValor === "") {
    errorComuna.classList.add("visible");
    valido = false;
  } else {
    errorComuna.classList.remove("visible");
  }

  if (!valido) {
    mensajeExito.innerText = "";
    return;
  }

  mensajeExito.innerText = "Voluntario registrado correctamente.";
  formulario.reset();
});