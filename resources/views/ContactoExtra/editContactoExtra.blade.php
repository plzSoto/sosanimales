<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="{{ asset('css/ContactoExtra/editContactoExtra.css') }}">
    <link rel="stylesheet" href="{{ asset('css/botones.css') }}">
    <title>Editar Contacto Extra</title>
</head>
<body>
    <h1>Editar Contacto Extra</h1>
    <form id="editContactoExtraForm">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" value="{{ $contactoExtra->NOMBRE }}" required><br><br>

        <label for="telefono">Telefono:</label>
        <input type="number" id="telefono" value="{{ $contactoExtra->TELEFONO }}" required><br><br>

        <label for="email">Email:</label>
        <input type="text" id="email" value="{{ $contactoExtra->EMAIL }}" required><br><br>

        <button class="editar" type="button" id="{{ $contactoExtra->ID }}">Actualizar</button>
    </form>

    <script type="module" src="{{ asset('JavaScript/ContactoExtra/contactoExtra.js') }}"></script>
</body>
</html>
