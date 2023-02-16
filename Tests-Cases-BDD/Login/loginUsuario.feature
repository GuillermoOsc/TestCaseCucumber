# Ejemplo de un caso de prueba en lenguaje Gherkin aplicado al login del sitio https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

# Documentación Gherkin/Cucumber https://cucumber.io/docs/gherkin/reference/


# En este ejemplo, se describen tres escenarios de prueba diferentes:
# uno para un inicio de sesión exitoso, otro para un inicio de sesión con un usuario inválido
# y otro para un inicio de sesión con una contraseña inválida.
# Cada escenario describe el estado inicial, las acciones que se realizan y el resultado esperado.

Feature: Login de usuario

    Scenario Outline: Login exitoso
        Given estoy en la página de inicio de sesión
        When ingreso mi nombre de usuario "Admin" y mi contraseña "admin123"
        And  hago clic en el botón "Login"
        Then debería ver la página de inicio de mi cuenta

    Scenario Outline: Usuario inválido
        Given estoy en la página de inicio de sesión
        When ingreso un nombre de usuario inválido "usuario_no_existente" y mi contraseña "Admin123"
        And hago clic en el botón "Login"
        Then debería ver un mensaje de error que indique que mi usuario no es válido

    Scenario Outline: Contraseña inválida
        Given que estoy en la página de inicio de sesión
        When ingreso mi nombre de usuario "Admin" y una contraseña inválida "contraseña_invalida"
        And hago clic en el botón "Login"
        Then debería ver un mensaje de error que indique que mi contraseña es inválida


# -------------------------------------------------------------------------------------------------------------------------------------

# En este ejemplo, se describen dos escenarios de prueba utilizando DataTables:
# uno para probar varios usuarios y contraseñas válidos, y otro para probar usuarios y/o contraseñas inválidos.
# Cada fila de la tabla corresponde a un conjunto diferente de credenciales de usuario y contraseña que se utilizan en cada prueba.

Feature: Login de usuario

    Scenario Outline:Login exitoso con diferentes usuarios
        Given estoy en la página de inicio de sesión
        When ingreso mi nombre de usuario y contraseña válidos:
            | Usuario  | Contraseña  |
            | ejemplo1 | contraseña1 |
            | ejemplo2 | contraseña2 |
            | ejemplo3 | contraseña3 |
        And hago clic en el botón "Login"
        Then debería ver la página de inicio de mi cuenta

    Scenario Outline: Usuario y/o contraseña inválidos
        Given que estoy en la página de inicio de sesión
        When ingreso un usuario y/o contraseña inválidos:
            | Usuario       | Contraseña       |
            | usuario_no_ex | contraseña_inv   |
            | usuario_inv   | contraseña_no_ex |
        And hago clic en el botón "Login"
        Then debería ver un mensaje de error que indique que mis credenciales son inválidas


