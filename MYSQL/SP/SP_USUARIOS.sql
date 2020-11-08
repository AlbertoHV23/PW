CREATE PROCEDURE `Sp_insert_users` (
  in rol 			varchar(50),
  in username 		varchar(50),
  in email 			varchar(50),
  in _password 		varchar(50),
  in imagen 		varchar(100),
  in descripcion 	varchar(50),
  in face 		    varchar(50),
  in twit           varchar(50),
  in insta          varchar(50),
  in activo         bool
  )
BEGIN
INSERT INTO `timetoplay`.`tbl_usuarios`
(`rol`,
`username`,
`email`,
`_password`,
`imagen`,
`descripcion`,
`face`,
`twit`,
`insta`,
`activo`)
VALUES
(rol,
username,
email,
_password,
imagen,
descripcion,
face,
twit,
insta,
activo
);

END
DELETE FROM `tbl_usuarios`
WHERE id_usuario = 1;



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

select *from tbl_usuarios;

CALL Sp_insert_users('test','test','test','test','test','test','test','test','test',true);
