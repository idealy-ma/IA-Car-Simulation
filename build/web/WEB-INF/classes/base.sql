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



INSERT INTO utilisateur VALUES (default,'Idealy', 150, 'Idealy', '1234');
INSERT INTO configuration VALUES (default, 'Climatiseur');
INSERT INTO configuration VALUES (default, 'Inclinaison Chaise');

INSERT INTO utilisateurpreference VALUES(1, 1, 24);
INSERT INTO utilisateurpreference VALUES(1, 2 ,90);

INSERT INTO configurationdefault VALUES(1,10);
INSERT INTO configurationdefault VALUES(2,45);

CREATE OR REPLACE VIEW utilisateurPref AS(
    SELECT utilisateurid,
       configurationid,
       label config,
       valeur
    FROM utilisateurpreference
    JOIN configuration
    ON utilisateurpreference.configurationid = configuration.id
);

CREATE OR REPLACE VIEW v_configurationDefaut AS(
    SELECT utilisateur.id utilisateurId,
           configurationid,
           label config,
           valeur
    FROM configurationdefault
    JOIN configuration
    ON configurationdefault.configurationid = configuration.id
    CROSS JOIN utilisateur
);

CREATE OR REPLACE VIEW default_disposition AS (
    SELECT utilisateur.id utilisateurId,
           posx,
           posy
    FROM dispositiondefault
    CROSS JOIN utilisateur
    WHERE (utilisateur.taille between dispositiondefault.tailledebut and dispositiondefault.taillefin)
);

select * from utilisateurpref;
select * from configurationdefaut;

select * from chaisedisposition;
select * from default_disposition;

select v_configurationDefaut.* from utilisateurpref;

CREATE OR REPLACE VIEW v_not_in_user_pref AS(
    select v_configurationDefaut.* from v_configurationDefaut 
    left join utilisateurpref 
    on v_configurationDefaut.configurationid = utilisateurpref.configurationid 
    where utilisateurpref.utilisateurid is null
);

CREATE OR REPLACE VIEW v_userPref AS(
    SELECT * 
    FROM utilisateurpref
    UNION
    SELECT * 
    FROM v_not_in_user_pref
);

select * from v_userPref;
