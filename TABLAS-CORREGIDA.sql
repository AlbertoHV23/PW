USE TimeToPlay;

create table if not exists tbl_usuarios(
  id_usuarios 		int 			auto_increment,
  username 			varchar(45) 	not null	unique,
  email 			varchar(45) 	not null,
  _password 		varchar(45) 	not null,
  imagen 			varchar(45) 	null,
  rol 				varchar(45) 	NOT null,
  descripcion 		varchar(45) 	null,
  facebook 			varchar(45) 	null,
  twitter			varchar(45) 	null,
  instagram	 		varchar(45) 	null,
  activo 			bool 			default 0,
  primary key (id_usuarios)
);

create table if not exists tbl_noticia(
	id_noticia				int 			auto_increment,
	titulo					varchar(50) 	not null,
    descripcion_Corta		varchar(100) 	not null,
    fecha					varchar(30)		not null,
    hora					varchar(20)		not null,
    noticia					varchar(1000) 	not null,
    aprovado				bool 			default 0,
    valoracion_like 		int default 0,
    valoracion_nolike 		int default 0,
    fk_usuarios				int				not null,
	primary key (id_noticia),
	foreign key (fk_usuarios) references tbl_usuarios(id_usuarios)
);

create table if not exists tbl_categoria(
	id_categoria	int auto_increment,
    nombre			varchar(50) not null,
    descripcion		varchar(200) null,
	primary key (Id_categoria)
);

create table if not exists tbl_imagenes(
	id_imagen	int 		auto_increment,
    extencion	varchar(50) not null,
    fk_noticia	int 		not null,
	primary key (id_imagen),
	foreign key (fk_noticia) references tbl_noticia(id_noticia)
);

create table if not exists videos(
	id_video	int auto_increment,
    ulr			varchar(50) not null,
    fk_noticia	int not null,
	primary key (id_video),
    foreign key (fk_noticia) references tbl_noticia(id_noticia)
);

create table if not exists tbl_Comentarios(
	id_comentario	int auto_increment,
    comentario		varchar(200) not null,
	fk_usuario		int not null,
    fk_noticia		int not null,
    Valoracion_like 		int default 0,
    Valoracion_Nolike 		INT default 0,
	Negado			bool default 0,
    PRIMARY KEY (id_comentario),
	foreign key (fk_usuario) references tbl_usuarios(id_usuarios),
	foreign key (fk_noticia) references tbl_noticia(id_noticia)
);

create table if not exists tbl_marcadas(
	id_marcada		int auto_increment,
	fk_noticia		int not null,
	fk_usuario		int not null,
	primary key (id_marcada),
    foreign key (fk_usuario) references tbl_usuarios(id_usuarios),
    foreign key (fk_noticia) references tbl_noticia(id_noticia)
);


