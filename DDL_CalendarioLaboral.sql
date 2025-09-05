-- Quitar estas líneas
-- DROP DATABASE CalendarioLaboral WITH (FORCE);
-- CREATE DATABASE CalendarioLaboral;

-- Dejar solo las instrucciones para crear tablas e índices
CREATE TABLE TipoFestivo(
    Id SERIAL PRIMARY KEY,
    Tipo VARCHAR(100) NOT NULL
);

CREATE UNIQUE INDEX ixTipoFestivo ON TipoFestivo(Tipo);

CREATE TABLE Pais(
    Id SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Festivo(
    Id SERIAL PRIMARY KEY,
    IdPais INT NOT NULL,
    CONSTRAINT fkFestivo_Pais FOREIGN KEY (IdPais) REFERENCES Pais(Id),
    Nombre VARCHAR(100) NOT NULL,
    Dia INT NOT NULL,
    Mes INT NOT NULL,
    DiasPascua INT NOT NULL,
    IdTipo INT NOT NULL,
    CONSTRAINT fkFestivo_Tipo FOREIGN KEY (IdTipo) REFERENCES TipoFestivo(Id)
);

CREATE TABLE Tipo(
    Id SERIAL PRIMARY KEY,
    Tipo VARCHAR(100) NOT NULL
);

CREATE UNIQUE INDEX ixTipo ON Tipo(Tipo);

CREATE TABLE Calendario(
    Id SERIAL PRIMARY KEY,
    Fecha DATE NOT NULL,
    IdTipo INT NOT NULL,
    CONSTRAINT fkCalendario_Tipo FOREIGN KEY (IdTipo) REFERENCES Tipo(Id),
    Descripcion VARCHAR(100) NULL,
    IdPais INT NOT NULL,
    CONSTRAINT fkCalendario_Pais FOREIGN KEY (IdPais) REFERENCES Pais(Id)
);

CREATE UNIQUE INDEX ixCalendario ON Calendario(IdPais, Fecha);
