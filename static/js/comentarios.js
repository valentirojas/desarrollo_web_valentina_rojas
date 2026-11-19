document.addEventListener("DOMContentLoaded", () => {
    const seccion = document.getElementById("seccion-comentarios");
    const formulario = document.getElementById("formulario-comentario");
    const lista = document.getElementById("lista-comentarios");
    const mensaje = document.getElementById("mensaje-comentario");

    const avistamientoId = seccion.dataset.avistamientoId;
    const url = `/comentarios/${avistamientoId}`;

    const cargarComentarios = async () => {
        try {
            const respuesta = await fetch(url);

            if (!respuesta.ok) {
                throw new Error("No se pudieron cargar los comentarios.");
            }

            const comentarios = await respuesta.json();
            lista.replaceChildren();

            if (comentarios.length === 0) {
                const aviso = document.createElement("p");
                aviso.textContent = "Todavía no hay comentarios.";
                lista.appendChild(aviso);
                return;
            }

            comentarios.forEach((comentario) => {
                const articulo = document.createElement("article");
                const titulo = document.createElement("h4");
                const fecha = document.createElement("p");
                const texto = document.createElement("p");

                titulo.textContent = comentario.nombre;
                fecha.textContent = comentario.fecha;
                texto.textContent = comentario.texto;

                articulo.append(titulo, fecha, texto);
                lista.appendChild(articulo);
            });
        } catch (error) {
            mensaje.textContent = error.message;
        }
    };

    formulario.addEventListener("submit", async (evento) => {
        evento.preventDefault();

        const nombre = document.getElementById("nombre-comentario").value.trim();
        const texto = document.getElementById("texto-comentario").value.trim();

        mensaje.textContent = "";

        if (nombre.length < 3 || nombre.length > 50) {
            mensaje.textContent = "El nombre debe tener entre 3 y 50 caracteres.";
            return;
        }

        if (texto.length < 5 || texto.length > 300) {
            mensaje.textContent = "El comentario debe tener entre 5 y 300 caracteres.";
            return;
        }

        try {
            const respuesta = await fetch(url, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ nombre, texto })
            });

            const resultado = await respuesta.json();

            if (!respuesta.ok) {
                mensaje.textContent = resultado.errores
                    ? resultado.errores.join(" ")
                    : resultado.error || "No se pudo guardar el comentario.";
                return;
            }

            formulario.reset();
            mensaje.textContent = resultado.mensaje;

            await cargarComentarios();
        } catch (error) {
            mensaje.textContent = "Error de conexión con el servidor.";
        }
    });

    cargarComentarios();
});