# Se describen dos escenarios de prueba diferentes para la funcionalidad de retiro de efectivo en un
# cajero automático, uno para un retiro exitoso y otro para un retiro fallido.

Feature: Retiro de efectivo

    Scenario Outline: Retiro exitoso
        Given estoy en la pantalla principal del cajero automático
        When ingreso mi número de tarjeta y mi PIN
        And selecciono la opción "Retiro de efectivo"
        And selecciono la cantidad de efectivo que deseo retirar
        And confirmo mi selección
        Then debería ver una pantalla que muestre la cantidad de efectivo retirada y mi saldo actualizado

    Scenario Outline: Retiro fallido
        Given estoy en la pantalla principal del cajero automático
        When ingreso mi número de tarjeta y un PIN incorrecto
        And selecciono la opción "Retiro de efectivo"
        And selecciono una cantidad de efectivo mayor que mi saldo disponible
        And confirmo mi selección
        Then debería ver un mensaje de error que indique que el retiro no se pudo Scenario Outline:


    # Se valida si el cajero automático puede detectar y manejar adecuadamente cuando un usuario
    # trata de retirar una cantidad de efectivo que excede su límite diario de retiro

    Scenario Outline: : Retiro fallido por límite diario excedido
        Given estoy en la pantalla principal del cajero automático
        When ingreso mi número de tarjeta y mi PIN
        And selecciono la opción "Retiro de efectivo"
        And selecciono una cantidad de efectivo que excede mi límite diario de retiro
        And confirmo mi selección
        Then debería ver un mensaje de error que indique que he excedido mi límite diario de retiro

    # Se valida si el cajero automático puede detectar y manejar adecuadamente
    # cuando un usuario intenta retirar efectivo con una tarjeta vencida.

    Scenario Outline: : Retiro fallido por tarjeta vencida
        Given estoy en la pantalla principal del cajero automático
        When ingreso mi número de tarjeta y mi PIN
        And selecciono la opción "Retiro de efectivo"
        And mi tarjeta ha vencido
        And selecciono la cantidad de efectivo que deseo retirar
        And confirmo mi selección
        Then debería ver un mensaje de error que indique que mi tarjeta ha vencido


    # Se valida si el cajero automático puede detectar y manejar adecuadamente cuando un usuario
    # intenta retirar efectivo con una tarjeta que ha sido bloqueada por el banco.

    Scenario Outline: : Retiro fallido por tarjeta bloqueada
        Given estoy en la pantalla principal del cajero automático
        When ingreso mi número de tarjeta y mi PIN
        And selecciono la opción "Retiro de efectivo"
        And mi tarjeta ha sido bloqueada por el banco
        And selecciono la cantidad de efectivo que deseo retirar
        And confirmo mi selección
        Then debería ver un mensaje de error que indique que mi tarjeta ha sido bloqueada
