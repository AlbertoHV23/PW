use TimeToPlay;

create table if not exists tbl_usuarios(
  id_usuario    int auto_increment,
  rol 			varchar(50) not null,
  username 		varchar(50) not null UNIQUE,
  email 		varchar(50) not null,
  _password 	varchar(50) not null,
  imagen 		varchar(100) null,
  descripcion 	varchar(50) null,
  face 		    varchar(50) null,
  twit          varchar(50) null,
  insta         varchar(50) null,
  activo        bool default 1,
  primary key (id_usuario)
);

create table if not exists tbl_categoria(
	id_categoria    int auto_increment,
    nombre			varchar(50) not null,
    descripcion		varchar(200) null,
	primary key (id_categoria)
);

create table if not exists tbl_noticia(
	id_noticia          int auto_increment,
	titulo				varchar(50) not null,
    descripcion_corta	varchar(250) not null,
    descripcion_larga	varchar(2500) not null,
    fecha				varchar(30) not null,
    hora				varchar(20) not null,
    aprovado			bool default 1,
    valoracion_like 	int default 0,
    valoracion_Nolike 	int default 0,
    fk_usuarios			int	not null,
    fk_categoria        int not null,
	primary key (id_noticia),
    foreign key (fk_categoria) references tbl_categoria(id_categoria),
	foreign key (fk_usuarios) references tbl_usuarios(id_usuario)
);

create table if not exists tbl_imagenes(
	id_imagen	int auto_increment,
    extencion	varchar(100) not null,
    fk_noticia	int not null,
	primary key (id_imagen),
	foreign key (fk_noticia) references tbl_noticia(id_noticia)
);

create table if not exists tbl_videos(
	id_video	int auto_increment,
    extencion	varchar(100) not null,
    fk_noticia	int not null,
	primary key (id_video),
    foreign key (fk_noticia) references tbl_noticia(id_noticia)
);

create table if not exists tbl_comentarios(
	id_comentario       int auto_increment,
    comentario		    varchar(1000) not null,
	fk_usuario		    int not null,
    fk_noticia		    int not null,
    valoracion_like 	int default 0,
    valoracion_Nolike 	int default 0,
    aprovado			bool default 0,
    primary key (id_comentario),
	foreign key (fk_usuario) references tbl_usuarios(id_usuario),
	foreign key (fk_noticia) references tbl_noticia(id_noticia)
);

create table if not exists tbl_comentario_a_comentario(
    id_sub_comentario   int auto_increment,
    fk_comentario       int not null,
    comentario          varchar(1000) not null,
    aprovado            bool default 0,
    primary key (id_sub_comentario),
    foreign key (fk_comentario) references tbl_comentarios(id_comentario)
);

create table if not exists tbl_marcadas(
	id_marcadas	int auto_increment,
    fk_usuario	int not null,
	fk_noticia	int not null,
    primary key (id_marcadas),
    foreign key (fk_usuario) references  tbl_usuarios(id_usuario),
    foreign key (fk_noticia) references tbl_noticia(id_noticia)
);

create table if not exists tbl_comentario_editor(
	id_comentario	int 	auto_increment,
    fk_usuario		int 	null,
	fk_noticia		int 	not null,
    comentario varchar(2000),
    primary key (id_comentario),
    foreign key (fk_usuario) references  tbl_usuarios(id_usuario),
    foreign key (fk_noticia) references tbl_noticia(id_noticia)
);






