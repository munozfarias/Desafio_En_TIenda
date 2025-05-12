-- 1. Crear BD
CREATE DATABASE tienda_chain;
USE tienda_chain;

-- 2. Tabla Tiendas
CREATE TABLE Tiendas (
  tienda_id INT AUTO_INCREMENT PRIMARY KEY,
  tienda_nombre VARCHAR(100)     NOT NULL,
  tienda_direccion VARCHAR(255)  NOT NULL,
  tienda_telefono VARCHAR(20)    NOT NULL
);

-- 3. Tabla Productos
CREATE TABLE Productos (
  producto_id INT AUTO_INCREMENT PRIMARY KEY,
  producto_nombre VARCHAR(100)        NOT NULL,
  producto_descripcion TEXT           NULL,
  producto_precio DECIMAL(10,2)       NOT NULL
);

-- 4. Tabla Categorias
CREATE TABLE Categorias (
  categoria_id INT AUTO_INCREMENT PRIMARY KEY,
  categoria_nombre VARCHAR(50)        NOT NULL
);

-- 5. Tabla Inventarios
CREATE TABLE Inventarios (
  inventario_id INT AUTO_INCREMENT PRIMARY KEY,
  tienda_id INT                       NOT NULL,
  producto_id INT                     NOT NULL,
  cantidad_stock INT                  NOT NULL DEFAULT 0,
  FOREIGN KEY (tienda_id)   REFERENCES Tiendas(tienda_id),
  FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

-- 6. Tabla Proveedores
CREATE TABLE Proveedores (
  proveedor_id INT AUTO_INCREMENT PRIMARY KEY,
  proveedor_nombre VARCHAR(100)       NOT NULL,
  proveedor_direccion VARCHAR(255)    NOT NULL,
  proveedor_telefono VARCHAR(20)      NOT NULL
);

-- 7. Tabla Pedidos
CREATE TABLE Pedidos (
  pedido_id INT AUTO_INCREMENT PRIMARY KEY,
  proveedor_id INT                    NOT NULL,
  pedido_fecha DATE                   NOT NULL,
  pedido_estado ENUM('PENDIENTE','RECIBIDO','CANCELADO') NOT NULL DEFAULT 'PENDIENTE',
  FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id)
);

-- 8. Relación Producto–Categoría
ALTER TABLE Productos
  ADD COLUMN categoria_id INT       NULL,
  ADD FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id);
