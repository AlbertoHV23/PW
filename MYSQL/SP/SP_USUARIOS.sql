/*SP_INSERT_USER*/
CREATE PROCEDURE `Sp_insert_users` (
  in rol 			    varchar(50),
  in username 	  varchar(50),
  in email 			  varchar(50),
  in _password 	  varchar(50),
  in imagen 		  varchar(100),
  in descripcion 	varchar(50),
  in face 		    varchar(50),
  in twit         varchar(50),
  in insta        varchar(50),
  in activo       bool
  )
BEGIN
INSERT INTO `timetoplay`.`tbl_usuarios`(`rol`,`username`,`email`,`_password`,`imagen`,`descripcion`,`face`,`twit`,`insta`,`activo`)
VALUES(rol,username,email,_password,imagen,descripcion,face,twit,insta,activo);

END

/*SP_DELETE_USER*/
CREATE PROCEDURE `Sp_Delete_users` (
in  id  int,
out estado int)
BEGIN
if (select count(id_usuario) from tbl_usuarios where id_usuarios = id) = 0 then
select 0 into estado;
	else
	DELETE FROM `tbl_usuarios`
	WHERE id_usuario = id;
    select 1 into estado;

end if;
END

/*SP_INSERT_CATEGORIA*/
CREATE PROCEDURE `Sp_insert_categoria` (
  in nombre			  varchar(50),
  in descripcion	varchar(200)
)
BEGIN
INSERT INTO `timetoplay`.`tbl_categoria`(`nombre`, `descripcion`)
VALUES(nombre, comentario);

END

/*SP_INSERT_NOTICIA*/
CREATE PROCEDURE `Sp_insert_noticia` (
  in titulo				      varchar(50),
  in descripcion_corta  varchar(250),
  in descripcion_larga	varchar(2500),
  in fecha				      varchar(30),
  in hora				        varchar(20),
  in aprovado			      bool,
  in valoracion_like 	  int,
  in valoracion_Nolike 	int,
  in fk_usuarios			  int,
  in fk_categoria       int
  )
BEGIN
INSERT INTO `timetoplay`.`tbl_noticia`(`titulo`, `descripcion_corta`, `descripcion_larga`, `fecha`, `hora`, `aprovado`, `valoracion_like`, `valoracion_Nolike`, `fk_usuarios`, `fk_categoria`)
VALUES(titulo, descripcion_corta, descripcion_larga, fecha, hora, aprovado, valoracion_like, valoracion_Nolike, fk_usuarios, fk_categoria);

END


/*SP_DELETE_NOTICIA ALCHILE NOSE SI ESTA BIEN CHECALA WE*/
CREATE PROCEDURE `Sp_Delete_noticia` (
in  id  int,
out estado int)
BEGIN
if (select count(id_noticia) from tbl_noticia where id_noticia = id) = 0 then
select 0 into estado;
	else
	DELETE FROM `tbl_noticia`
	WHERE id_noticia = id;
    select 1 into estado;
end if;
END

/*SP_INSERT_IMAGENES*/
CREATE PROCEDURE `Sp_insert_imagenes` (
  in extencion	varchar(100),
  in fk_noticia	int
  )
BEGIN
INSERT INTO `timetoplay`.`tbl_imagenes`(`extencion`, `fk_noticia`)
VALUES(extencion, fk_noticia);

END

/*SP_INSERT_VIDEOS*/
CREATE PROCEDURE `Sp_insert_videos` (
  in extencion	varchar(100),
  in fk_noticia	int
  )
BEGIN
INSERT INTO `timetoplay`.`tbl_videos`(`extencion`, `fk_noticia`)
VALUES(extencion, fk_noticia);

END

/*SP_INSERT_COMENTARIO*/
CREATE PROCEDURE `Sp_insert_comentario` (
    in comentario		      varchar(1000),
	  in fk_usuario		      int,
    in fk_noticia		      int,
    in valoracion_like 	  int,
    in valoracion_Nolike 	int,
    in aprovado			      bool
)
BEGIN
INSERT INTO `timetoplay`.`tbl_comentarios`(`comentario`, `fk_usuario`, `fk_noticia`, `valoracion_like`, `valoracion_Nolike`, `aprovado`)
VALUES(comentario, fk_usuario, fk_noticia, valoracion_like, valoracion_Nolike, aprovado);

END

/*SP_DELETE_COMENTARIO ALCHILE NOSE SI ESTA BIEN CHECALA WE*/
CREATE PROCEDURE `Sp_Delete_comentario` (
in  id  int,
out estado int)
BEGIN
if (select count(id_comentario) from tbl_comentarios where id_comentario = id) = 0 then
select 0 into estado;
	else
	DELETE FROM `tbl_comentarios`
	WHERE id_comentario = id;
    select 1 into estado;
end if;
END

/*SP_INSERT_RESPONDER_COMENTARIO*/
CREATE PROCEDURE `Sp_insert_responder` (
  in fk_comentario       int,
  in comentario          varchar(1000),
  in aprovado            bool
  )
BEGIN
INSERT INTO `timetoplay`.`tbl_comentario_a_comentario`(`fk_comentario`, `comentario`, `aprovado`)
VALUES(fk_comentario, comentario, aprovado);

END

/*SP_INSERT_RESPONDER_COMENTARIO ALCHILE NOSE SI ESTA BIEN CHECALA WE*/
CREATE PROCEDURE `Sp_Delete_responder` (
in  id  int,
out estado int)
BEGIN
if (select count(id_sub_comentario) from tbl_comentario_a_comentario where id_sub_comentario = id) = 0 then
select 0 into estado;
	else
	DELETE FROM `tbl_comentario_a_comentario`
	WHERE id_sub_comentario = id;
    select 1 into estado;
end if;
END

/*SP_INSERT_MARCADAS*/
CREATE PROCEDURE `Sp_insert_marcadas` (
  in fk_usuario	int,
	in fk_noticia	int
  )
BEGIN
INSERT INTO `timetoplay`.`tbl_marcadas`(`fk_usuario`, `fk_noticia`)
VALUES(fk_usuario, fk_noticia);

END

/*SP_INSERT_MARCADAS ALCHILE NOSE SI ESTA BIEN CHECALA WE*/
CREATE PROCEDURE `Sp_Delete_marcadas` (
in  id  int,
out estado int)
BEGIN
if (select count(id_marcadas) from tbl_marcadas where id_marcadas = id) = 0 then
select 0 into estado;
	else
	DELETE FROM `tbl_marcadas`
	WHERE id_marcadas = id;
    select 1 into estado;
end if;
END