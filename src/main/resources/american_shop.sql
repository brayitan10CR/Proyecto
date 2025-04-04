/*Se crea la base de datos */
drop schema if exists american_shop;
drop user if exists usuario_prueba;
drop user if exists usuario_reportes;
CREATE SCHEMA american_shop ;

/*Se crea un usuario para la base de datos llamado "usuario_prueba" y tiene la contraseña "Usuario_Clave."*/
create user 'usuario_prueba'@'%' identified by 'Usuar1o_Clave.';
create user 'usuario_reportes'@'%' identified by 'Usuar1o_Reportes.';

/*Se asignan los prvilegios sobr ela base de datos TechShop al usuario creado */
grant all privileges on american_shop.* to 'usuario_prueba'@'%';
grant select on american_shop.* to 'usuario_reportes'@'%';
flush privileges;

use american_shop;

/* la tabla de categoria contiene categorias de productos*/
create table categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(30) NOT NULL,
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  descripcion VARCHAR(30) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  precio double,
  existencias int,  
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_producto),
  foreign key fk_producto_caregoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se crea la tabla de clientes llamada cliente... igual que la clase Cliente */
CREATE TABLE usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(75) NULL,
  telefono VARCHAR(15) NULL,
  ruta_imagen varchar(1024),
  activo boolean,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha date,  
  total double,
  estado int,
  PRIMARY KEY (id_factura),
  foreign key fk_factura_usuario (id_usuario) references usuario(id_usuario)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table venta (
  id_venta INT NOT NULL AUTO_INCREMENT,
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  precio double, 
  cantidad int,
  PRIMARY KEY (id_venta),
  foreign key fk_ventas_factura (id_factura) references factura(id_factura),
  foreign key fk_ventas_producto (id_producto) references producto(id_producto) 
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se insertan 2 registros en la tabla cliente como ejemplo */
INSERT INTO usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'admin','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Administrador', 'American Shop',    'americanShop02@gmail.com',    '4556-8978', 'https://img2.rtve.es/i/?w=1600&i=1677587980597.jpg',true),
(2,'user','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','usuario',  'American Shop', 'usuarioPrueba@gmail.com', '5456-8789','https://media.licdn.com/dms/image/v2/C5603AQGwjJ5ht4bWXQ/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1661476259292?e=2147483647&v=beta&t=9_i5zTdqHRMSXlb9H4TuWkWeRGQXmaZLjxkBlWsg2lg',true);



/*Se insertan 4 categorias de productos como ejemplo */
INSERT INTO categoria (id_categoria,descripcion,ruta_imagen,activo) VALUES 
('1','Bebe', 'https://elmercaditodekilla.com/wp-content/uploads/2024/03/RP1111233_A.webp',   true), 
('2','Ropa',  'https://sopotey.com/blog/wp-content/uploads/2024/04/ropa-de-marca-original.jpg',   true),
('3','Hogar','https://dauihome.com/wp-content/uploads/2022/09/muebles-practicos-organizar-hogar.png',true),
('4','Electrodomesticos','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUEbW7uUty9TH_e1kbZJ_RqfHL7ajtuKNyJg&s',true),
('5','Cosmeticos','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSQU4BK8T19D0UewHiylcZbCm84SlaqF0AZw&s',true),
('6','Muebles','https://roble.store/cdn/shop/articles/NordicStory_mueble_flotante_aparador_de_pared_comoda_mueble_de_TV_madera_maciza_roble_diseno_nordico_escandinavo_moderno_13_3024x.jpg?v=1662470702', false);

/*Se insertan 4 productos por categoria */
INSERT INTO producto (id_producto,id_categoria,descripcion,detalle,precio,existencias,ruta_imagen,activo) VALUES
(1,1,'Camiseta de bebe','Vienen en distintos colores y estampados. ',5000,5,'https://www.textilesredpoint.com/wp-content/uploads/2021/11/0147-celeste.jpg',true),
(2,1,'Pantalon de bebe','Vienen en distintos colores y estampados. ',7000,2,'https://www.rodecoracion.com/12949-large_default/pantalon-bebe-nino-aygey-indigo.jpg',true),
(3,2,'Zapatos','Plantillas cómodas son esenciales para la seguridad y comodidad.',25000,5,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU_f1bZJwV7IP_NbJWTF8iUS9h1eP5TACKZQ&s',true),
(4,2,'Zapatillas deportivas','Ofrecen buen soporte.',27600,2,'https://m.media-amazon.com/images/I/71Es6z83kfL._AC_UF894,1000_QL80_.jpg',true),
(5,3,'Sofá','El mueble central de la sala. Puedes optar por sofás seccionales, de dos o tres plazas, o futones si tienes poco espacio.',45780,5,'https://www.tiendasekono.com/media/catalog/product/u/n/unnamed_19__2.jpg',true),
(6,3,'Estanteria','Para libros, decoraciones o almacenamiento adicional. Pueden ser abiertas o con puertas.',15000,2,'https://cr.epaenlinea.com/media/catalog/product/1/0/100005993.jpg_20250311194054176759.jpeg?optimize=medium&bg-color=255,255,255&fit=bounds&height=&width=',true),
(7,4,'Microondas','Para calentar alimentos rápidamente o cocinar platos sencillos.',25400,5,'https://res.cloudinary.com/sharp-consumer-eu/image/fetch/w_1100,f_auto,q_auto/https://s3.infra.brandquad.io/accounts-media/SHRP/DAM/origin/76743e70-e21b-11ee-9368-e2f64a9402cb.jpg',true),
(8,4,'Refrigeradora','Imprescindible para mantener los alimentos frescos. Existen opciones con congelador superior, inferior, de puertas francesas o de una sola puerta.',45000,3,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvzTpBM5wdeCJNKRvxJjtF8Gmqy6dKRf76-A&s',true),
(9,5,'Crema hidratante',' Para mantener la piel suave e hidratada. Hay opciones específicas para el día o la noche.',285000,0,'https://medipielcr.vtexassets.com/arquivos/ids/159891-800-auto?v=638599394293700000&width=800&height=auto&aspect=true',true),
(10,5,'Protector solar','Indispensable para proteger la piel del daño solar. Se recomienda usar diariamente para prevenir envejecimiento prematuro y manchas.',154000,5,'https://walmartcr.vtexassets.com/arquivos/ids/703932/3918_01.jpg?v=638615088755900000',true),
(11,6,'Cama','Puede ser de tamaño individual, matrimonial, queen o king. Existen camas con almacenamiento bajo, ideales para espacios pequeños.',330000,3,'https://cdn.rencdn.com/ashley/high/B130-581-10X8-CROP.jpg',true),
(12,6,'Espejo de baño','Espejos antivaho o con almacenamiento adicional, como los que tienen estantes o un diseño de espejo doble.',273000,4,'https://i.ebayimg.com/thumbs/images/g/aUoAAOSwGJlndGq9/s-l1200.jpg',true);

/*Se crean 6 facturas */   /*'Activa','Pagada','Anulada')*/
INSERT INTO factura (id_factura,id_usuario,fecha,total,estado) VALUES
(1,1,'2024-06-05',211560,2),
(2,2,'2024-06-07',554340,2),
(3,2,'2024-08-07',871000,2),
(4,1,'2024-08-15',244140,1),
(5,2,'2024-09-17',414800,1),
(6,2,'2024-09-21',420000,1);

INSERT INTO venta (id_venta,id_factura,id_producto,precio,cantidad) values
(1,1,5,45000,3),
(2,1,9,15780,2),
(3,1,10,15000,3),
(4,2,5,45000,1),
(5,2,12,154000,3),
(6,2,9,15780,3),
(7,3,12,154000,1),
(8,3,6,57000,1),
(9,3,12,330000,2),
(10,1,6,57000,2),
(11,1,8,27600,3),
(12,1,9,15780,3),
(13,2,8,27600,3),
(14,2,12,154000,2),
(15,2,3,24000,1),
(16,3,12,330000,1),
(17,3,12,45000,1),
(18,3,10,15000,3);

create table role (  
  rol varchar(20),
  PRIMARY KEY (rol)  
);

insert into role (rol) values ('ADMIN'), ('USUARIO'), ('USER');

create table rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

insert into rol (id_rol, nombre, id_usuario) values
 (1,'ADMIN',1), (2,'USUARIO',1), (3,'USER',1),
 (4,'USUARIO',2), (5,'USER',2),
 (6,'USER',2);


CREATE TABLE ruta (
    id_ruta INT AUTO_INCREMENT NOT NULL,
    patron VARCHAR(255) NOT NULL,
    rol_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (id_ruta))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO ruta (patron, rol_name) VALUES
('/', 'ADMIN'),
('/producto/nuevo', 'ADMIN'),
('/producto/guardar', 'ADMIN'),
('/producto/modificar/**', 'ADMIN'),
('/producto/eliminar/**', 'ADMIN'),
('/categoria/nuevo', 'ADMIN'),
('/categoria/guardar', 'ADMIN'),
('/categoria/modificar/**', 'ADMIN'),
('/categoria/eliminar/**', 'ADMIN'),
('/usuario/**', 'ADMIN'),
('/constante/**', 'ADMIN'),
('/role/**', 'ADMIN'),
('/usuario_role/**', 'ADMIN'),
('/ruta/**', 'ADMIN'),
('/informacion/listado', 'USUARIO'),
('/perfil/listado', 'USUARIO'),
('/redes/listado', 'USUARIO'),
('/producto/listado', 'USUARIO'),
('/categoria/listado', 'USUARIO'),
('/pruebas/**', 'USUARIO'),
('/payment/**', 'USER');

CREATE TABLE ruta_permit (
    id_ruta INT AUTO_INCREMENT NOT NULL,
    patron VARCHAR(255) NOT NULL,
	PRIMARY KEY (id_ruta))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO ruta_permit (patron) VALUES 
('/'),
('/index'),
('/errores/**'),
('/carrito/**'),
('/registro/**'),
('/js/**'),
('/fav/**'),
('/webjars/**');

CREATE TABLE constante (
    id_constante INT AUTO_INCREMENT NOT NULL,
    atributo VARCHAR(25) NOT NULL,
    valor VARCHAR(150) NOT NULL,
	PRIMARY KEY (id_constante))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO constante (atributo,valor) VALUES 
('dominio','localhost'),
('certificado','c:/cert'),
('dolar','520.75'),
('paypal.client-id','AUjOjw5Q1I0QLTYjbvRS0j4Amd8xrUU2yL9UYyb3TOTcrazzd3G3lYRc6o7g9rOyZkfWEj2wxxDi0aRz'),
('paypal.client-secret','EMdb08VRlo8Vusd_f4aAHRdTE14ujnV9mCYPovSmXCquLjzWd_EbTrRrNdYrF1-C4D4o-57wvua3YD2u'),
('paypal.mode','sandbox'),
('urlPaypalCancel','http://localhost/payment/cancel'),
('urlPaypalSuccess','http://localhost/payment/success');
