######## Creacion y uso de la base de datos ########
#CREATE DATABASE tiendalostiburones;

USE tiendalostiburones;

######## modulo de login y usuarios ########
CREATE TABLE usuarios (
    cedula_usuario BIGINT PRIMARY KEY,
    email_usuario VARCHAR(255) NOT NULL,
    nombre_usuario VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    usuario VARCHAR(255) NOT NULL
); 

INSERT INTO usuarios VALUES(001,'roca230313@gmail.com','Diego Rodriguez','admin123456','admininicial');
INSERT INTO usuarios VALUES(002,'roca230313@.gmail.com','Diego Rodriguez','pass','user');
INSERT INTO usuarios VALUES(003,'roca230313@gmail.com','Diego Rodriguez','pass2','user2');
INSERT INTO usuarios VALUES(004,'a','a','a','a');
INSERT INTO usuarios VALUES(005,'a','a','a','a2');
INSERT INTO usuarios VALUES(006,'a','a','a','a3');
INSERT INTO usuarios VALUES(007,'a','a','a','a4');
INSERT INTO usuarios VALUES(008,'a','a','a','a5');
INSERT INTO usuarios VALUES(009,'a','a','a','a6');
INSERT INTO usuarios VALUES(010,'a','a','a','a7');
INSERT INTO usuarios VALUES(011,'a','a','a','a8');
INSERT INTO usuarios VALUES(012,'a','a','a','a9');
INSERT INTO usuarios VALUES(013,'a','a','a','a10');


CREATE UNIQUE INDEX usuario_unico 
ON usuarios(usuario);

######## modulo de clientes ########
CREATE TABLE clientes (
    cedula_cliente BIGINT PRIMARY KEY,
    direccion_cliente VARCHAR(255) NOT NULL,
    email_cliente VARCHAR(255) NOT NULL,
    nombre_cliente VARCHAR(255) NOT NULL,
    telefono_cliente VARCHAR(255) NOT NULL
);

INSERT INTO clientes VALUES(001,'Calle falsa 123','roca@gmail.com','Diego Rodriguez','3000000000');


######## modulo de proveedores ########
CREATE TABLE proveedores (
    nit_proveedor BIGINT PRIMARY KEY,
    ciudad_proveedor VARCHAR(255) NOT NULL,
    direccion_proveedor VARCHAR(255) NOT NULL,
    nombre_proveedor VARCHAR(255) NOT NULL,
    telefono_proveedor VARCHAR(255) NOT NULL
);

INSERT INTO proveedores VALUES(001,'Bogota','KR 7 CLL 45','Colanta','+57300000000');
INSERT INTO proveedores VALUES(002,'Bogota','KR 7 CLL 45','Colanta','+57300000000');
INSERT INTO proveedores VALUES(003,'Bogota','KR 7 CLL 45','Colanta','+57300000000');
INSERT INTO proveedores VALUES(004,'Bogota','KR 7 CLL 45','Colanta','+57300000000');
INSERT INTO proveedores VALUES(005,'Bogota','KR 7 CLL 45','Colanta','+57300000000');

######## modulo de productos ########
CREATE TABLE productos (
    codigo_producto BIGINT PRIMARY KEY,
    iva_compra DOUBLE NOT NULL,
    nit_proveedor BIGINT NOT NULL,
    nombre_producto VARCHAR(255) NOT NULL,
    precio_compra DOUBLE NOT NULL,
    precio_venta DOUBLE NOT NULL,
    FOREIGN KEY (nit_proveedor) REFERENCES proveedores(nit_proveedor)
);

INSERT INTO productos VALUES(201,0.19,1,'Leche Entera',2000.0,3000.0);

######## modulo de ventas ########
create table ventas(
codigo_venta bigint primary key auto_increment,
cedula_cliente bigint,
cedula_usuario bigint,
ivaventa double,
total_venta double,
valor_venta double,
FOREIGN KEY (cedula_cliente) REFERENCES clientes(cedula_cliente)
);

ALTER TABLE ventas
ADD FOREIGN KEY (cedula_usuario) REFERENCES usuarios(cedula_usuario);

create table detalle_ventas(
codigo_detalle_venta bigint primary key auto_increment,
cantidad_producto int,
codigo_producto bigint,
codigo_venta bigint,
valor_total double,
valor_venta double,
valoriva double,
FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
);

ALTER TABLE detalle_ventas
ADD FOREIGN KEY (codigo_venta) REFERENCES ventas(codigo_venta);

############# revisar estado de la bd 
select id, user, host, db, command, time, state, info, progress
from information_schema.processlist;

####### obteniendo el siguiente consecutivo en ventas
SELECT `AUTO_INCREMENT`
FROM  INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'tiendalostiburones'
AND   TABLE_NAME   = 'ventas';


