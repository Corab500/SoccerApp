drop table joueurSaison;
drop table evenement;
drop table faitdematch;
drop table player;
drop table saisonclub;
drop table rencontre;
drop table equipe;
drop table club;
drop table saison;
drop table championnat;


create table Championnat (
     Id numeric(5) not null,
     Nom varchar(100) not null,
     constraint IDChampionnat primary key (Id));

create table Club (
     Id numeric(10) not null,
     Nom varchar(50) not null,
     constraint IDClub primary key (Id));

create table Equipe (
     Id numeric(10) not null,
     Nom varchar(25) not null,
     clubId numeric(10) not null,
     constraint IDEquipe_ID primary key (Id));

create table evenement (
     id numeric(10) not null,
     nom varchar(35) not null,
     constraint idEvenement primary key (id));

create table faitdematch (
     id numeric(20) not null,
     evenement_id numeric(10) not null,
     acteur numeric(10) not null,
     dateFait date not null,
     rencontre_id numeric(10) not null,
     constraint IDfaitdematch primary key (id));

create table joueurSaison (
     joueurID numeric(10) not null,
     clubID numeric(10) not null,
     saisonID numeric(10) not null,
     constraint IDjoueurSaison primary key (joueurID, clubID, saisonID));

create table Player (
     Nom varchar(25) not null,
     Prenom varchar(25) not null,
     Id numeric(10) not null,
     constraint IDPlayer primary key (Id));

create table Rencontre (
     rencontre_id numeric(10) not null,
     dateRencontre date not null,
     equ_dom_id numeric(10) not null,
     eq_ex_id numeric(10) not null,
     score_eq_dom numeric(3) not null,
     score_eq_ext numeric(3) not null,
     jouer char,
     arreter char,
     equ_victorieuse numeric(10),
     saison_id numeric(10) not null,
     constraint IDRencontre primary key (rencontre_id));

create table Saison (
     Id numeric(10) not null,
     Nom varchar(50) not null,
     Date_Debut date not null,
     chamId numeric(5) not null,
     constraint IDSaison primary key (Id));

create table SaisonClub (
     clubID numeric(10) not null,
     saisonID numeric(10) not null,
     constraint IDSaisonClub primary key (clubID, saisonID));


-- Constraints Section
-- ___________________ 

alter table Equipe add constraint IDEquipe_FK
     foreign key (Id)
     references Club;

alter table faitdematch add constraint eventMatchRef
     foreign key (evenement_id)
     references evenement;

alter table faitdematch add constraint acteurFaitMatchRef
     foreign key (acteur)
     references Club;

alter table faitdematch add constraint refRencontre
     foreign key (rencontre_id)
     references Rencontre;

alter table joueurSaison add constraint refJoueur
     foreign key (joueurID)
     references Player;

alter table joueurSaison add constraint refClubSaison
     foreign key (clubID)
     references Club;

alter table joueurSaison add constraint refSaisonSais
     foreign key (saisonID)
     references Saison;

alter table Rencontre add constraint equipeDomicileRencRef
     foreign key (equ_dom_id)
     references Equipe;

alter table Rencontre add constraint equipeExtencRef
     foreign key (eq_ex_id)
     references Equipe;

alter table Rencontre add constraint EquipeVictorieuseRencRef
     foreign key (equ_victorieuse)
     references Equipe;

alter table Rencontre add constraint saisonRencontreRef
     foreign key (saison_id)
     references Saison;

alter table Saison add constraint championatRef
     foreign key (chamId)
     references Championnat;

alter table SaisonClub add constraint refClubId
     foreign key (clubID)
     references Club;

alter table SaisonClub add constraint refSaisonId
     foreign key (saisonID)
     references Saison;