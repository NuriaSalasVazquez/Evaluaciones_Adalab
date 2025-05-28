🏪 TiendaOnline

📌 Descripción

La clase TiendaOnline simula una tienda en línea, permitiendo gestionar productos en inventario. Incluye métodos para agregar, buscar, eliminar productos 

⚙️ Métodos

🔹 agregar_producto(nombre, precio, cantidad)

Agrega un producto al inventario o actualiza la cantidad si ya existe.

✅ Ejemplo:

 tienda = TiendaOnline()
 tienda.agregar_producto("Camisa", 20, 40)

🔹 ver_inventario()

Muestra el inventario de la tienda con todos los productos.

✅ Ejemplo:

tienda.ver_inventario()

📌 Salida esperada:

Nombre: Camisa, Precio: $20, Cantidad: 40

🔹 buscar_producto(nombre)

Busca un producto en el inventario y muestra sus detalles si existe.

✅ Ejemplo:

tienda.buscar_producto("Camisa")

📌 Salida esperada:

Nombre: Camisa, Precio: $20, Cantidad: 40

🔹 actualizar_stock(nombre, cantidad)

Modifica la cantidad de un producto en el inventario.

✅ Ejemplo:

tienda.actualizar_stock("Camisa", 10)

🔹 eliminar_producto(nombre)

Elimina un producto del inventario.

✅ Ejemplo:

tienda.eliminar_producto("Camisa")

🔹 calcular_valor_inventario()

Calcula y muestra el valor total del inventario.

✅ Ejemplo:

tienda.calcular_valor_inventario()

📌 Salida esperada:

Valor total del inventario: $800

🚀 Uso

# Crear una instancia de la tienda
mi_tienda = TiendaOnline()

# Agregar productos
tienda.agregar_producto("Camisa", 20, 40)
tienda.agregar_producto("Pantalón", 30, 30)

# Ver el inventario
tienda.ver_inventario()

# Buscar un producto
tienda.buscar_producto("Camisa")

# Actualizar stock
tienda.actualizar_stock("Camisa", 10)

# Calcular valor del inventario
tienda.calcular_valor_inventario()

📢 Nota: Puedes expandir la funcionalidad de TiendaOnline agregando más métodos según sea necesario.

