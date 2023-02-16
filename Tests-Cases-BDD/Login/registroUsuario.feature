Feature: Registro de usuario

    Scenario Outline: Registro exitoso
        Given estoy en la página de registro
        When ingreso mis datos personales y mi dirección de correo electrónico
        And selecciono un nombre de usuario y una contraseña
        And hago clic en el botón "Registrarme"
        Then debería ver un mensaje de confirmación de registro

    Scenario Outline: Registro fallido
        Given estoy en la página de registro
        When ingreso una dirección de correo electrónico inválida
        And selecciono un nombre de usuario ya existente
        And hago clic en el botón "Registrarme"
        Then debería ver un mensaje de error que indique que no se pudo completar el registro
