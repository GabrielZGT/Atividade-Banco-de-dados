create database saonuncadist;
use saonuncadist;

create table Cliente(
Cod_cliente int not null primary key auto_increment,
Nome varchar(50),
Email char(65),
Telefone char (18)
);

create table Produto(
Cod_prod int not null primary key auto_increment,
Descricao varchar(50),
Quantidade decimal(5,2),
PrecoCompra decimal (10,2),
PrecoVenda decimal (10,2)
);

create table Venda(
Cod_venda int not null primary key auto_increment,
Cod_cliente int ,
datavenda date);

create table itemVenda(
Cod_itemvenda int not null primary key auto_increment,
Cod_venda int,
cod_prod int,
quantidade int
);



alter table Venda add foreign key (Cod_cliente) references  Cliente (Cod_cliente);
alter table itemVenda add foreign key (Cod_venda) references  Venda (Cod_venda);
alter table itemVenda add foreign key (cod_Prod) references  Produto (Cod_prod);


insert into Cliente (Nome,Email,Telefone)values
("Sebastiao Vetel","VrumVrumVetel@gmail.com",31982222648),
("Rubinetos Rubichelos","Narigudo@gmail,com",31222226545);

insert into Produto (Descricao, Quantidade, PrecoCompra, PrecoVenda)values
("Pao de alho dracula",6.0, 2.90,10.99),
("Carvao fogo infinito",50.0, 5.90,13.30),
("Refrigerante infinito",20.0, 3.70,14.20);

insert into Venda (Cod_cliente, datavenda ) values
('1', '2021-02-22'),
('2', '2021-06-17');

insert into itemVenda (Cod_venda, cod_prod, quantidade) values
('1','1','3'),
('2','2','6'),
('1','1','2');


select Nome, Cod_venda,datavenda from Venda
inner join Cliente on Cliente.Cod_Cliente = venda.Cod_cliente;

update Produto set PrecoVenda = (PrecoVenda * 1.10);