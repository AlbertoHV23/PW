
USE TimeToPlay;

create table if not exists Tbl_USUARIOS(
  id_USUARIOS 		INT 			auto_increment,
  Username 			VARCHAR(45) 	NOT NULL	UNIQUE,
  Email 			VARCHAR(45) 	NOT NULL,
  _Password 		VARCHAR(45) 	NOT NULL,
  Image 			VARCHAR(45) 	NULL,
  Rol 				VARCHAR(45) 	NOT NULL,
  Descripcion 		VARCHAR(45) 	NULL,
  Facebook 			VARCHAR(45) 	NULL,
  Twitter			VARCHAR(45) 	NULL,
  Instagram	 		VARCHAR(45) 	NULL,
  Activo 			bool 			DEFAULT 0,
  PRIMARY KEY (id_USUARIOS)
);


create table if not exists Tbl_NOTICIA(
	Id_Noticia				int 			auto_increment,
	Titulo					varchar(50) 	not null,
    Descripcion_Corta		varchar(100) 	not null,
    Descripcion				varchar(100) 	not null,
    Fecha					varchar(30)		not null,
    Hora					varchar(20)		not null,
    Noticia					varchar(1000) 	not null,
    aprovado				bool 			default 0,
    Valoracion 				int				default 0,
    fk_USUARIOS				INT				not null,
    
	PRIMARY KEY (Id_Noticia),
	foreign key (fk_USUARIOS) references Tbl_USUARIOS(id_USUARIOS)
    
);

create table if not exists Tbl_Categoria(
	Id_categoria	int auto_increment,
    Nombre			varchar(50) not null,
    Descripcion		varchar(200) null,
	PRIMARY KEY (Id_categoria)
);

create table if not exists Tbl_Noticia_Categoria(
	id_Noticia_Categoria		int 	auto_increment,
	fk_noticia					int 	not null,
    fk_categoria				int 	not null,
    PRIMARY KEY (id_Noticia_Categoria),
    foreign key (fk_noticia)   references Tbl_NOTICIA(Id_Noticia),
    foreign key (fk_categoria) references Tbl_Categoria(Id_categoria)
);

create table if not exists Tbl_IMAGENES(
	id_imagen	int 		auto_increment,
    extencion	varchar(50) not null,
    fk_noticia	int 		not null,
	PRIMARY KEY (id_imagen),
	foreign key (fk_noticia) references Tbl_Noticia(id_noticia)
);

create table if not exists VIDEOS(
	id_video	int auto_increment,
    ulr			varchar(50) not null,
    fk_noticia	int not null,
	PRIMARY KEY (id_video),
    foreign key (fk_noticia) references Tbl_Noticia(id_noticia)
);

create table if not exists Tbl_COMENTARIOS(
	id_comentario	int auto_increment,
    comentario		varchar(200) not null,
	fk_usuario		int not null,
    fk_noticia		int not null,
    Id_emisor   	int,
    Id_receptor		int,
    Valoracion_like 		int default 0,
    Valoracion_Nolike 		INT default 0,
    PRIMARY KEY (id_comentario),
	foreign key (fk_usuario) references Tbl_USUARIOS(id_USUARIOS),
	foreign key (fk_noticia) references Tbl_NOTICIA(Id_Noticia)
);


create table if not exists Tbl_MARCADAS(
	id_guardadas	int auto_increment,
    etiqueta		varchar(50) not null, 
    fk_usuario		int not null,
	fk_noticia		int not null,
     PRIMARY KEY (id_guardadas),
    foreign key (fk_usuario) references  Tbl_USUARIOS(id_USUARIOS),
    foreign key (fk_noticia) references Tbl_NOTICIA(Id_Noticia)
);






