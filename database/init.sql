GRANT ALL PRIVILEGES ON DATABASE isi TO postgres;

\c isi;

create table if not exists products ( id int not null primary key, Name varchar not null, Description varchar);

create table if not exists users (id int not null primary key, Name varchar not null);


create table if not exists reviews (id serial primary key, User_id int not null, Product_id int not null, Review varchar not null, Rating varchar not null, foreign key (User_id) references Users(id), foreign key (Product_id) references Products(id));

alter table reviews add constraint uq_reviews unique(user_id,product_id);

insert into users(id,name) values('1','Sarah Adams');
insert into users(id,name) values('2','Hanna Flores');
insert into users(id,name) values('3','Reece Alford');
insert into users(id,name) values('4','Jax Kendall');
insert into users(id,name) values('5','Petra Benson');

insert into products(id,name,description) values ('1', 'Couch','A comfortable grey coloured 2 seater couch');
insert into products(id,name,description) values ('2', 'Desk','A white desk');
insert into products(id,name,description) values ('3', 'Dresser','A grey colured 3 drawer dresser');
insert into products(id,name,description) values ('4', 'Coffee Table','');
insert into products(id,name,description) values ('5', 'Rug','A rustic brwon rug');
insert into products(id,name,description) values ('6', 'Bean Bag', 'XL size');
insert into products(id,name,description) values ('7', 'Desk Chair', '');
insert into products(id,name,description) values ('8', 'Night Stand', 'A nightstand with one shelf');
insert into products(id,name,description) values ('9', 'Dining Table', 'Round white color dining table');
insert into products(id,name,description) values ('10', 'Dining Chair','A pair of cushion set back chairs');
