Feature: Retiro de efectivo

    Scenario Outline: Retiro exitoso
        Given estoy en la pantalla principal del cajero automático
        When ingreso mi número de tarjeta y mi PIN
        And selecciono la opción "Retiro de efectivo"
        And selecciono la cantidad de efectivo que deseo retirar
        And confirmo mi selección
        Then debería ver una pantalla que muestre la cantidad de efectivo retirada y mi saldo actualizado


    # Se utiliza una tabla de datos para proporcionar información específica sobre el monto a retirar y el tipo
    # de cuenta. En la sección "Cuando ingreso el monto a retirar y el tipo de cuenta en la tabla:", se utiliza
    # una tabla de datos para proporcionar los datos que se ingresarán en la pantalla de retiro de efectivo.

    Scenario Outline: Scenario Outline name: Realizar un retiro de efectivo con un cajero automático
        Given estoy en la pantalla de inicio del cajero automático
        When ingreso mi número de cuenta "123456" y mi PIN "6789"
        Then se me presentan las opciones de "Consultar saldo", "Retirar efectivo" y "Cancelar"
        When elijo "Retirar efectivo"
        Then se me presenta una tabla con las opciones de "Monto a retirar" y "Tipo de cuenta"
        When ingreso el monto a retirar y el tipo de cuenta en la tabla:
            | Monto a retirar | Tipo de cuenta |
            | 50              | Corriente      |
        And presiono el botón "Continuar"
        Then se muestra una pantalla de confirmación con el mensaje "¿Desea confirmar la transacción?"
        When confirmo la transacción
        Then se dispensa el efectivo solicitado y se muestra un recibo con los detalles de la transacción



    # Se valida si el cajero automático puede detectar y manejar adecuadamente
    # cuando un usuario ingresa un PIN incorrecto

    Scenario Outline: Retiro fallido
        Given estoy en la pantalla principal del cajero automático
        When ingreso mi número de tarjeta y un PIN incorrecto
        And selecciono la opción "Retiro de efectivo"
        And selecciono una cantidad de efectivo mayor que mi saldo disponible
        And confirmo mi selección
        Then debería ver un mensaje de error que indique que el retiro no se pudo Scenario Outline:


    # Se valida si el cajero automático puede detectar y manejar adecuadamente cuando un usuario
    # trata de retirar una cantidad de efectivo que excede su límite diario de retiro

    Scenario Outline: Retiro fallido por límite diario excedido
        Given estoy en la pantalla principal del cajero automático
        When ingreso mi número de tarjeta y mi PIN
        And selecciono la opción "Retiro de efectivo"
        And selecciono una cantidad de efectivo que excede mi límite diario de retiro
        And confirmo mi selección
        Then debería ver un mensaje de error que indique que he excedido mi límite diario de retiro

    # Se valida si el cajero automático puede detectar y manejar adecuadamente
    # cuando un usuario intenta retirar efectivo con una tarjeta vencida.

    Scenario Outline: Retiro fallido por tarjeta vencida
        Given estoy en la pantalla principal del cajero automático
        When ingreso mi número de tarjeta y mi PIN
        And selecciono la opción "Retiro de efectivo"
        And mi tarjeta ha vencido
        And selecciono la cantidad de efectivo que deseo retirar
        And confirmo mi selección
        Then debería ver un mensaje de error que indique que mi tarjeta ha vencido


    # Se valida si el cajero automático puede detectar y manejar adecuadamente cuando un usuario
    # intenta retirar efectivo con una tarjeta que ha sido bloqueada por el banco.

    Scenario Outline: Retiro fallido por tarjeta bloqueada
        Given estoy en la pantalla principal del cajero automático
        When ingreso mi número de tarjeta y mi PIN
        And selecciono la opción "Retiro de efectivo"
        And mi tarjeta ha sido bloqueada por el banco
        And selecciono la cantidad de efectivo que deseo retirar
        And confirmo mi selección
        Then debería ver un mensaje de error que indique que mi tarjeta ha sido bloqueada
