/*SP PARA INSERTAR DATOS EN LA TABLA USUARIOS*/
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Insert_usuarios`(
  in Username 			VARCHAR(45),
  in Email 				VARCHAR(45),
  in _Password 			VARCHAR(45),
  in Image 				VARCHAR(45),
  in Rol 				VARCHAR(45),
  in Descripcion 		VARCHAR(45),
  in Facebook 			VARCHAR(45),
  in Twitter			VARCHAR(45),
  in Instagram	 		VARCHAR(45),
  in Activo 			bool
)
BEGIN
INSERT INTO `timetoplay`.`tbl_usuarios`
(`id_USUARIOS`,
`Username`,
`Email`,
`_Password`,
`Image`,
`Rol`,
`Descripcion`,
`Facebook`,
`Twitter`,
`Instagram`,
`Activo`)
VALUES
(Username ,
Email,
_Password,
Image,
Rol,
Descripcion,
Facebook,
Twitter,
Instagram,
Activo);

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Delete_usuarios`(
in id int, 
out estado tinyint)
BEGIN
	if(select count(id_USUARIOS) from Tbl_USUARIOS where id_USUARIOS = id) = 0 then
	select 0 into estado;
	else
	delete from Tbl_USUARIOS where id_USUARIOS = id;
    select 1 into estado;
	end if;
END$$
DELIMITER ;

CALL `Sp_Delete_usuarios`(2,@retorno);
select @retorno;

CALL `Sp_Insert_usuarios`('AlberThor','@gmail.com','123','NoImage','Administrador','AlberThor','AlberThor','AlberThor','AlberThor',true);

select *from tbl_usuarios;