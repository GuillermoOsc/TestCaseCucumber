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
        Then debería ver un mensaje de error que indique que el retiro no se pudo completar

