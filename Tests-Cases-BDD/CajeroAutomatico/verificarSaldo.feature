    # Se utiliza una tabla de datos para mostrar los detalles del saldo de la cuenta,
    # que incluyen el tipo de cuenta y el saldo actual en la cuenta.

    Scenario Outline: Verificar el saldo de una cuenta
        Given estoy en la pantalla de inicio del cajero automático
        When ingreso mi número de cuenta "123456" y mi PIN "6789"
        Then se me presentan las opciones de "Consultar saldo", "Retirar efectivo" y "Cancelar"
        When elijo "Consultar saldo"
        Then se me muestra el saldo actual de mi cuenta "123456" en la pantalla:
            | Tipo de cuenta | Saldo       |
            | Corriente      | $100.00 USD |
            | Ahorros        | $500.00 USD |