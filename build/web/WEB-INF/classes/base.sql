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

DROP TABLE IF EXISTS configuration;

DROP TABLE IF EXISTS consomation CASCADE;
CREATE TABLE consomation(
    id serial primary key,
    valeur float8 check valeur>0
);

