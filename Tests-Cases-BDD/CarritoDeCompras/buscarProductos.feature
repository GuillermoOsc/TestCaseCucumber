Feature: Búsqueda de productos

    Scenario Outline: Búsqueda exitosa
        Given estoy en la página de búsqueda
        When ingreso el nombre del producto que estoy buscando
        And hago clic en el botón "Buscar"
        Then debería ver una lista de resultados que coincidan con mi búsqueda

    Scenario Outline: Búsqueda sin resultados
        Given estoy en la página de búsqueda
        When ingreso un nombre de producto que no existe
        And hago clic en el botón "Buscar"
        Then debería ver un mensaje que indique que no se encontraron resultados para mi búsqueda
