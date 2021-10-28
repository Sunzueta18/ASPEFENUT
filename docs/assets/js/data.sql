USE master
GO

CREATE DATABASE Pedido
GO

USE Pedido
GO

--CREACION DE LAS TABLA
CREATE TABLE Cliente
(
idCliente char(5) NOT NULL,
NomCli varchar(20) NOT NULL,
DirCli varchar(20) NOT NULL,
   CONSTRAINT PKCliente PRIMARY KEY(idCliente)
)

CREATE TABLE Pedido
(
idPedido char(10) NOT NULL,
FechaPed datetime NOT NULL,
MontoPed money NOT NULL,
idCliente char(5) NOT NULL
   CONSTRAINT PKPedido PRIMARY KEY(idPedido)
)

CREATE TABLE Detalle_Pedido
(
idPedido char(10) NOT NULL,
idArticulo char(5) NOT NULL,
CantPed int NOT NULL,
PreVen money NOT NULL,
   CONSTRAINT PKDetallePedido PRIMARY KEY(idPedido,idArticulo)
)

CREATE TABLE Articulo
(
idArticulo char(5) NOT NULL,
NomArt varchar(2) NOT NULL,
PrecioArt money NOT NULL,
   CONSTRAINT PKArticulo PRIMARY KEY(idArticulo)
)

--CREACION DE LAS LLAVES FORANEAS
ALTER TABLE Pedido
ADD CONSTRAINT FKPedidoCliente FOREIGN KEY (idCliente)
REFERENCES Cliente(idCliente)

ALTER TABLE Detalle_Pedido
ADD CONSTRAINT FKDetallePedidoPedido FOREIGN KEY (idPedido)
REFERENCES Pedido(idPedido)

ALTER TABLE Detalle_Pedido
ADD CONSTRAINT FKDetallePedidoArticulo FOREIGN KEY (idArticulo)
REFERENCES Articulo(idArticulo)

