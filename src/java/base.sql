/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  i.m.a
 * Created: Feb 4, 2023
 */

DROP TABLE IF EXISTS utlisateur CASCADE;
CREATE TABLE utilisateur(
    id serial PRIMARY KEY,
    nom VARCHAR(80),
    taille float8,
    login VARCHAR(80) UNIQUE,
    motdepasse VARCHAR(255)
);

DROP TABLE IF EXISTS configuration CASCADE;
CREATE TABLE configuration(
    id serial primary key,
    label varchar(80)
);

DROP TABLE IF EXISTS utilisateurPreference CASCADE;
CREATE TABLE utilisateurPreference(
    utilisateurId int references utilisateur(id),
    configurationId int references configuration(id),
    valeur float8
);

DROP TABLE IF EXISTS configurationDefault CASCADE;
CREATE TABLE configurationDefault(
    configurationId int references configuration(id),
    valeur float8
);

DROP TABLE IF EXISTS chaiseDisposition CASCADE;
CREATE TABLE chaiseDisposition(
    utilisateurId int references utilisateur(id),
    posX float8,
    posY float8
);

DROP TABLE IF EXISTS dispositionDefault CASCADE;
CREATE TABLE dispositionDefault(
    posX float8,
    posY float8,
    tailleDebut float8,
    tailleFin float8
);

DROP TABLE IF EXISTS kilometrageFait CASCADE;
CREATE TABLE kilometrageFait(
    id serial PRIMARY KEY,
    valuer float8
);

DROP TABLE IF EXISTS consomation CASCADE;
CREATE TABLE consomation(
    id serial primary key,
    valeur float8 check (valeur>0)
);

INSERT INTO utilisateur VALUES (default,'Idealy',150, 'Idealy', '1234');