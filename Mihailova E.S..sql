create database mix;


create table client (
uuid uuid,
first_name varchar,
last_name varchar,
phone varchar,
email varchar,
address varchar,
create_at date,
confirmed boolean,
country_id varchar,
balance real,
primary key(uuid));

create sequence product_id;
create table product (
id int not null default nextval ('product_id'),
name_product varchar,
discription_product text,
amount int,
price int, 
provider varchar,
address_provider varchar,
country_provider varchar,
primary key(id));

create sequence basket_id;
create table basket (
id int not null default nextval ('basket_id'),
id_client uuid references client (uuid),
id_product int references product(id),
primary key(id));

create sequence country_id;
create table country(
id int not null default nextval ('country_id'),
name varchar,
short_code varchar,
primary key(id));

Create sequence name_id;
create table name(
id int not null default nextval ('name_id'),
name_product varchar,
discription_product text,
primary key(id));

alter table product drop column name_product, drop column discription_product; 
alter table product add column name_id int references name(id);

create sequence provider_id;
create table provider(
id int not null default nextval ('provider_id'),
provider varchar,
address_provider varchar,
country_provider varchar,
primary key(id));

alter table product drop column provider, drop column address_provider, drop column country_provider; 
alter table product add column provider_id int references provider(id);

create extension if not exists "uuid-ossp";
insert into client(uuid, first_name, last_name, phone, email, address, create_at, confirmed, country_id, balance) values(
uuid_generate_v4(), 'Petr', 'Petrov', '78524563245', 'hrydk@jfh.ru', 'Moscow, Lenina-21', '2012/01/03', 't', 'RU', '54521'),
(uuid_generate_v4(), 'Ivan', 'Ivanov', '82456325891', 'hdksne@mdju.ru', 'Samara, Petrova-4', '2018/01/05', 't', 'RU', '589632'),
(uuid_generate_v4(), 'Iliy', 'Petrov', '32641287562563', 'jdbccj@hui.com', 'Minsk, Sizova-51', '2014/03/07', 't', 'BL', '74899'),
(uuid_generate_v4(), 'Alex', 'Alexeev', '8745212658', 'trsvh12@yru.ru', 'Tambov, Latova-8', '2016/05/02', 'f', 'RU', '54123'),
(uuid_generate_v4(), 'William', 'Scott', '1452367885566', 'wwwiiil@ygc.cim', 'Chicago, Lincoln-45', '2014/02/01', 't', 'USA', '5214'),
(uuid_generate_v4(), 'Sergey', 'Sergeev', '541266547', 'fhjdbfg@hj.ru', 'Ufa, Ivanova-54', '2020/02/01', 't', 'RU', '521'),
(uuid_generate_v4(), 'Petr', 'Ivanov', '4585', 'hgfgd@ldj.j', 'Tver, Gagarina-7', '2014/02/02', 'f', 'RU', '452'),
(uuid_generate_v4(), 'Greg', 'Hon', '41852', 'hdgfcgh@dhdh.jf', 'Ivanovo, Talaya-63', '2021/08/03', 't', 'RU', '5478'),
(uuid_generate_v4(), 'Anna', 'Ivanova', '58785', 'dfbs@n.fj', 'Omsk, Letnyaya-7', '2020/06/07', 't', 'RU', '845'),
(uuid_generate_v4(), 'Ira', 'Gor', '57777888', 'ghfddsg@gfds.dghj', 'Chita, Lenina-9', '2011/06/08', 't', 'RU', '8888'
);

insert into country (name, short_code) values (
'Russia', 'RU'),
('Belarus', 'BL'),
('Kazakhstan', 'KZ'),
('Armenia', 'AM'),
('Bulgaria', 'BG'),
('England', 'EG'),
('Italy', 'IT'),
('Spain', 'SP'),
('Georgia', 'GR'),
('Poland', 'PL');

insert into name (name_product, discription_product) values
('telefon', 'smartfon'),
('planshet', 'book'),
('TV', 'LSD'),
('recorder', 'CD'),
('camera','optics'),
('mouse', 'radio'),
('keyboard', 'wireless'),
('fridge', 'big'),
('stove', 'gas'),
('blender', 'wired');

insert into provider (provider, address_provider, country_provider) values 
('lanta', 'Moscow, Petrova-5', 'Russia'),
('Vasso','Tambov, Latova-8', 'Russia'),
('Petrrro', 'Ufa, Ivanova-54', 'Russia'),
('Ross', 'Omsk, Letnyaya-7', 'Russia'),
('Yurrr','Omsk, Letnyaya-22', 'Russia'),
('Niuuu', 'Samara, Petrova-4', 'Russia'),
('Teer','Tver, Gagarina-7', 'Russia'),
('Lion', 'Ufa, Ivanova-54', 'Russia'),
('njh', 'Minsk, Sizova-51', 'Belarus'),
('tyhb', 'Lipetsk, Geroev-7', 'Russia');




