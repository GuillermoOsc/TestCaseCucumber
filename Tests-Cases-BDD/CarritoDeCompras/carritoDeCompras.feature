Feature: Agregar productos al carrito de compras

    Scenario Outline: Agregar un producto al carrito de compras
        Given que estoy en la página de detalles del producto
        When hago clic en el botón "Agregar al carrito"
        When debería ver una confirmación de que el producto se agregó al carrito

    Scenario Outline: Agregar múltiples productos al carrito de compras
        Given que estoy en la página de resultados de búsqueda
        When selecciono varios productos que deseo agregar al carrito
        And hago clic en el botón "Agregar al carrito"
        When debería ver una confirmación de que todos los productos se agregaron al carrito
