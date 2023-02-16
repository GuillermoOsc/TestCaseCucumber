# Se describen dos escenarios de prueba diferentes para la funcionalidad de transferencia de fondos
# en un cajero automático, uno para una transferencia exitosa y otro para una transferencia fallida.


Feature: Transferencia de fondos

    Scenario Outline: Transferencia exitosa
        Given estoy en la pantalla principal del cajero automático
        When ingreso mi número de tarjeta y mi PIN
        And selecciono la opción "Transferencia de fondos"
        And ingreso el número de tarjeta del destinatario y la cantidad de fondos que deseo transferir
        And confirmo mi selección
        Then debería ver una pantalla que muestre los detalles de la transferencia y mi saldo actualizado

    Scenario Outline: Transferencia fallida
        Given estoy en la pantalla principal del cajero automático
        When ingreso mi número de tarjeta y mi PIN
        And selecciono la opción "Transferencia de fondos"
        And ingreso el número de tarjeta del destinatario incorrecto o una cantidad mayor que mi saldo disponible
        And confirmo mi selección
        Then debería ver un mensaje de error que indique que la transferencia no se pudo completar
