DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_area_referencia_examen;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_area_referencia_examen(
	IN 
    i_id	int,
i_nombreArea	varchar(255)
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  area_referencia_examen
    ( 
        
		nombreArea
    )
    VALUES  
    ( 
		 
		i_nombreArea
    );
   
   
   SELECT LAST_INSERT_ID() AS lastInserted;
   
END;
;;
 

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_area_referencia_examen;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_area_referencia_examen(
	IN 
	 i_id	int,i_nombreArea	varchar(255)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   area_referencia_examen
	 SET  
		id=i_id,nombreArea=i_nombreArea
	WHERE      id = i_id;

END;
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_area_referencia_examen;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_area_referencia_examen
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM area_referencia_examen
WHERE      id = i_id;

 END; 

;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_area_referencia_examen;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_area_referencia_examen( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombreArea
		FROM 	area_referencia_examen
		WHERE   id = i_id;
END;

;;
 
 
 DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_area_referencia_examen;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_area_referencia_examen
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM area_referencia_examen
WHERE      id = i_id;

 END; 

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_area_referencia_examen;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_area_referencia_examen()
	BEGIN 
	SELECT id,nombreArea
	FROM area_referencia_examen;
END; 
 
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_area_referencia_examen;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_area_referencia_examen(
	i_filter varchar(256)
)
	BEGIN 
	SELECT id,nombreArea
	FROM area_referencia_examen
	WHERE nombreArea LIKE CONCAT('%', i_filter , '%');
END; 

;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_categoria;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_categoria(
	IN 
    i_id	int,
i_nombreCategoria	varchar(256)
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  categoria
    ( 
       
		nombreCategoria
    )
    VALUES  
    ( 
		 
		i_nombreCategoria
    );
   
   
   SELECT LAST_INSERT_ID() AS lastInserted;
   
END;
;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_categoria;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_categoria(
	IN 
	 i_id	int,i_nombreCategoria	varchar(256)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   categoria
	 SET  
		id=i_id,nombreCategoria=i_nombreCategoria
	WHERE      id = i_id;

END;
;; 

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_categoria;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_categoria
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM categoria
WHERE      id = i_id;

 END; 

;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_categoria;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_categoria()
	BEGIN 
	SELECT id,nombreCategoria
	FROM categoria;
END; 
 
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_categoria;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_categoria(
	i_filter varchar(256)
)
	BEGIN 
	SELECT id,nombreCategoria
	FROM categoria
	WHERE nombreCategoria LIKE CONCAT('%', i_filter , '%');
END; 

;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_categoria;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_categoria( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombreCategoria
		FROM 	categoria
		WHERE   id = i_id;
END;
;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_categoria;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_categoria( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombreCategoria
		FROM 	categoria
		WHERE   id = i_id;
END;

;;
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_categoria_muestra;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_categoria_muestra(
	IN 
    i_id	int,
i_muestraID	int,
i_categoriaID	int
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  categoria_muestra
    ( 
       
		muestraID,
		categoriaID
    )
    VALUES  
    ( 
		 
		i_muestraID,
		i_categoriaID
    );
   
   
   SELECT LAST_INSERT_ID() AS lastInserted;
   
END;
;;		


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_categoria_muestra;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_categoria_muestra(
	IN 
	 i_id	int,i_muestraID	int,i_categoriaID	int
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   categoria_muestra
	 SET  
		id=i_id,muestraID=i_muestraID,categoriaID=i_categoriaID
	WHERE      id = i_id;

END;
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_categoria_muestra;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_categoria_muestra
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM categoria_muestra
WHERE      id = i_id;

 END; 

;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_categoria_muestra;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_categoria_muestra( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,muestraID,categoriaID
		FROM 	categoria_muestra
		WHERE   id = i_id;
END;

;;
 
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_categoria_muestra;
;;

DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_categoria_muestra( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				categoria_muestra.id,nombreMuestra,muestraID,categoriaID
		FROM 	categoria_muestra INNER JOIN muestra ON
		        categoria_muestra.muestraID = muestra.id
		WHERE   categoriaID = i_id;
END;
;; 
		
		
		
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_muestra;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_muestra()
	BEGIN 
	SELECT id,nombreMuestra
	FROM muestra;
END; 
 
;; 		
		
	
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_definicion_examen;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_definicion_examen(
	IN 
    i_id	int,
	i_nombreExamen	varchar(255),
	i_categoriaID	int,
	i_examenEspecial int
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  definicion_examen
    ( 
        
		nombreExamen,
		categoriaID,
		examenEspecial
    )
    VALUES  
    ( 
		
		i_nombreExamen,
		i_categoriaID,
		i_examenEspecial
    );
   
   
  SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id,
			nombreExamen,
			categoriaID,
			examenEspecial
	FROM 	definicion_examen
	WHERE   id = w_id;
   
END;
;;
 	
		
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_definicion_examen;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_definicion_examen(
	IN 
	 i_id	int,i_nombreExamen	varchar(255),i_categoriaID	int
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   definicion_examen
	 SET  
		id=i_id,nombreExamen=i_nombreExamen,categoriaID=i_categoriaID
	WHERE      id = i_id;

END;
;; 		


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_definicion_examen;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_definicion_examen
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM definicion_examen
WHERE      id = i_id;

 END; 

;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_definicion_examen;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_definicion_examen( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombreExamen,categoriaID
		FROM 	definicion_examen
		WHERE   id = i_id;
END;

;;
 
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_definicion_examen;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_definicion_examen( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				definicion_examen.id,nombreExamen,categoriaID,nombreCategoria
		FROM 	definicion_examen INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
		WHERE   categoriaID = i_id;
END;
;; 
		
		
		DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_especialidad;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_especialidad(
	IN 
    i_id	int,
i_nombreEspecialidad	varchar(255)
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  especialidad
    ( 
        id,
nombreEspecialidad
    )
    VALUES  
    ( 
		i_id,
i_nombreEspecialidad
    );
   
   
   SELECT LAST_INSERT_ID() AS lastInserted;
   
END;
;;
 		
		
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_especialidad;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_especialidad(
	IN 
	 i_id	int,i_nombreEspecialidad	varchar(255)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   especialidad
	 SET  
		id=i_id,nombreEspecialidad=i_nombreEspecialidad
	WHERE      id = i_id;

END;
;; 		


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_especialidad;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_especialidad
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM especialidad
WHERE      id = i_id;

 END; 

;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_especialidad;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_especialidad( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombreEspecialidad
		FROM 	especialidad
		WHERE   id = i_id;
END;

;;



DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_especialidad;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_especialidad()
	BEGIN 
	SELECT id,nombreEspecialidad
	FROM especialidad;
END; 
 
;; 



DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_especialidad;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_especialidad(
	i_filter varchar(256)
)
	BEGIN 
	SELECT id,nombreEspecialidad
	FROM especialidad
	WHERE nombreEspecialidad LIKE CONCAT('%', i_filter , '%');
END; 

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_medico;
;;
 
DELIMITER ;;  
CREATE   PROCEDURE SP_ADD_medico(
	IN 
    i_id	int,
	i_nombreCompleto	varchar(255),
	i_telefono	varchar(256),
	i_numeroJuntaVigilancia	varchar(255),
	i_correo	varchar(255),
	i_direccion	varchar(255),
	i_especialidadID	int,
	i_consultorioID	int
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  medico
    ( 
   
		nombreCompleto,
		telefono,
		numeroJuntaVigilancia,
		correo,
		direccion,
		especialidadID,
		consultorioID
    )
    VALUES  
    ( 
	 
		i_nombreCompleto,
		i_telefono,
		i_numeroJuntaVigilancia,
		i_correo,
		i_direccion,
		i_especialidadID,
		i_consultorioID
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id,
			nombreCompleto,
			telefono,
			numeroJuntaVigilancia,
			correo,
			direccion,
			especialidadID,
			consultorioID
	FROM 	medico
	WHERE   id = w_id;
   
END;
;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_medico;
;;
 
 
DELIMITER ;;  
CREATE  PROCEDURE SP_EDIT_medico(
	IN 
	 i_id	int,i_nombreCompleto	varchar(255),i_telefono	varchar(256),i_numeroJuntaVigilancia	varchar(255),i_correo	varchar(255),i_direccion	varchar(255),i_especialidadID	int,i_consultorioID	int
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   medico
	 SET  
		 nombreCompleto=i_nombreCompleto,telefono=i_telefono,numeroJuntaVigilancia=i_numeroJuntaVigilancia,correo=i_correo,direccion=i_direccion,especialidadID=i_especialidadID,consultorioID=i_consultorioID
	WHERE      id = i_id;
	
	SELECT   
			id,nombreCompleto,telefono,numeroJuntaVigilancia,correo,direccion,especialidadID,consultorioID
	FROM 	medico
	WHERE   id = i_id;

END;
;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_medico;
;; 


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_medico(
	i_filter varchar(256)
)
	BEGIN 
	SELECT medico.id,nombreCompleto,telefono,numeroJuntaVigilancia,correo,direccion,nombreEspecialidad,nombreConsultorio
	FROM medico INNER JOIN especialidad ON medico.especialidadID = especialidad.id 
	     LEFT JOIN consultorio ON medico.consultorioID = consultorio.id
	WHERE nombreCompleto LIKE CONCAT('%', i_filter , '%') OR  
			telefono LIKE CONCAT('%', i_filter , '%') OR  
			numeroJuntaVigilancia LIKE CONCAT('%', i_filter , '%') OR  
			correo LIKE CONCAT('%', i_filter , '%') OR  
			direccion LIKE CONCAT('%', i_filter , '%');
END; 
;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_medico;
;; 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_ALL_medico()
	BEGIN 
	SELECT medico.id,nombreCompleto,telefono,numeroJuntaVigilancia,correo,direccion,nombreEspecialidad,nombreConsultorio
	FROM medico LEFT JOIN especialidad ON medico.especialidadID = especialidad.id 
	    LEFT JOIN consultorio ON medico.consultorioID = consultorio.id;
END; 
;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_medico;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_medico( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombreCompleto,telefono,numeroJuntaVigilancia,correo,direccion,especialidadID,consultorioID
		FROM 	medico
		WHERE   id = i_id;
END;

;;
 

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_medico;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_medico
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM medico
WHERE      id = i_id;

 END; 

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_muestra;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_muestra(
	IN 
    i_id	int,
i_nombreMuestra	varchar(255)
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  muestra
    ( 
     
		nombreMuestra
    )
    VALUES  
    ( 
		 
		i_nombreMuestra
    );
   
   
   SELECT LAST_INSERT_ID() AS lastInserted;
   
END;
;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_muestra;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_muestra(
	IN 
	 i_id	int,i_nombreMuestra	varchar(255)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   muestra
	 SET  
		id=i_id,nombreMuestra=i_nombreMuestra
	WHERE      id = i_id;

END;
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_muestra;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_muestra
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM muestra
WHERE      id = i_id;

 END; 

;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_muestra;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_muestra( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombreMuestra
		FROM 	muestra
		WHERE   id = i_id;
END;

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_muestra;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_muestra()
	BEGIN 
	SELECT id,nombreMuestra
	FROM muestra;
END; 
 
;; 
 
 
 DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_muestra;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_muestra(
	i_filter varchar(256)
)
	BEGIN 
	SELECT id,nombreMuestra
	FROM muestra
	WHERE nombreMuestra LIKE CONCAT('%', i_filter , '%');
END; 

;; 


DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_ADD_paciente;
;;


DELIMITER ;;
CREATE   PROCEDURE SP_ADD_paciente(
	IN 
    i_id	int,
	i_fechaNacimiento	varchar(255),
	i_nombresPaciente	varchar(255),
	i_apellidosPaciente	varchar(255),
	i_catalogoID	int,
	i_dui	int,
	i_pasaporte	varchar(255),
	i_celular	varchar(255),
	i_telefono	varchar(255),
	i_direccion	varchar(255),
	i_nombreResponsable	varchar(255),
	i_apellidosResponsable	varchar(255),
	i_celularResponsable	varchar(255),
	i_telefonoResponsable	varchar(255),
	i_tipoPaciente	int,
	i_correlativo_expediente	varchar(256)
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  paciente
    ( 
        
		fechaNacimiento,
		nombresPaciente,
		apellidosPaciente,
		catalogoID,
		dui,
		pasaporte,
		celular,
		telefono,
		direccion,
		nombreResponsable,
		apellidosResponsable,
		celularResponsable,
		telefonoResponsable,
		tipoPaciente,
		correlativo_expediente
    )
    VALUES  
    ( 
		 
		i_fechaNacimiento,
		i_nombresPaciente,
		i_apellidosPaciente,
		i_catalogoID,
		i_dui,
		i_pasaporte,
		i_celular,
		i_telefono,
		i_direccion,
		i_nombreResponsable,
		i_apellidosResponsable,
		i_celularResponsable,
		i_telefonoResponsable,
		i_tipoPaciente,
		i_correlativo_expediente
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			 
			fechaNacimiento,
			nombresPaciente,
			apellidosPaciente,
			catalogoID,
			dui,
			pasaporte,
			celular,
			telefono,
			direccion,
			nombreResponsable,
			apellidosResponsable,
			celularResponsable,
			telefonoResponsable,
			tipoPaciente,
			correlativo_expediente
	FROM 	paciente
	WHERE   id = w_id;
   
END;
;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_EDIT_paciente;
;;


DELIMITER ;; 
CREATE  PROCEDURE SP_EDIT_paciente(
	IN 
	 i_id	int,i_fechaNacimiento	varchar(255),i_nombresPaciente	varchar(255),i_apellidosPaciente	varchar(255),i_catalogoID	int,i_dui	int,i_pasaporte	varchar(255),i_celular	varchar(255),i_telefono	varchar(255),i_direccion	varchar(255),i_nombreResponsable	varchar(255),i_apellidosResponsable	varchar(255),i_celularResponsable	varchar(255),i_telefonoResponsable	varchar(255),i_tipoPaciente	int,i_correlativo_expediente	varchar(256)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   paciente
	 SET  
		 fechaNacimiento=i_fechaNacimiento,nombresPaciente=i_nombresPaciente,apellidosPaciente=i_apellidosPaciente,catalogoID=i_catalogoID,dui=i_dui,pasaporte=i_pasaporte,celular=i_celular,telefono=i_telefono,direccion=i_direccion,nombreResponsable=i_nombreResponsable,apellidosResponsable=i_apellidosResponsable,celularResponsable=i_celularResponsable,telefonoResponsable=i_telefonoResponsable,tipoPaciente=i_tipoPaciente,correlativo_expediente=i_correlativo_expediente
	WHERE      id = i_id;
	
	SELECT   
			id,fechaNacimiento,nombresPaciente,apellidosPaciente,catalogoID,dui,pasaporte,celular,telefono,direccion,nombreResponsable,apellidosResponsable,celularResponsable,telefonoResponsable,tipoPaciente,correlativo_expediente
	FROM 	paciente
	WHERE   id = i_id;

END;
;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_paciente;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_paciente
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM paciente
WHERE      id = i_id;

 END; 

;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_paciente;
;; 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_ALL_paciente()
	BEGIN 
	SELECT 	P.id,
			P.fechaNacimiento,
			P.nombresPaciente,
			P.apellidosPaciente,
			C.descripcion AS catalogoID,
			P.dui,
			P.pasaporte,
			P.celular,
			P.telefono,
			P.direccion,
			P.nombreResponsable,
			P.apellidosResponsable,			
			P.celularResponsable,
			P.telefonoResponsable,
			P.tipoPaciente,
			P.correlativo_expediente
	FROM paciente P INNER JOIN catalogo_general C ON P.catalogoID = C.id;
END; 
;; 

DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_paciente;
;;
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_ROW_paciente( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,
				fechaNacimiento,
				nombresPaciente,
				apellidosPaciente,
				catalogoID,
				dui,
				pasaporte,
				celular,
				telefono,
				direccion,
				IFNULL(nombreResponsable,"") AS nombreResponsable,
				IFNULL(apellidosResponsable,"") AS apellidosResponsable,
				IFNULL(celularResponsable,"") AS celularResponsable,
				telefonoResponsable,
				tipoPaciente,
				correlativo_expediente
		FROM 	paciente
		WHERE   id = i_id;
END;
;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_paciente;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_paciente(
	i_filter varchar(256)
)
	BEGIN 
	SELECT paciente.id,fechaNacimiento,nombresPaciente,apellidosPaciente,descripcion as catalogoID,dui,pasaporte,celular,telefono,direccion,nombreResponsable,apellidosResponsable,celularResponsable,telefonoResponsable,tipoPaciente,correlativo_expediente
	FROM paciente INNER JOIN catalogo_general ON paciente.catalogoID = catalogo_general.id
	WHERE fechaNacimiento LIKE CONCAT('%', i_filter , '%') OR  
nombresPaciente LIKE CONCAT('%', i_filter , '%') OR  
apellidosPaciente LIKE CONCAT('%', i_filter , '%') OR  
pasaporte LIKE CONCAT('%', i_filter , '%') OR  
celular LIKE CONCAT('%', i_filter , '%') OR  
telefono LIKE CONCAT('%', i_filter , '%') OR  
direccion LIKE CONCAT('%', i_filter , '%') OR  
nombreResponsable LIKE CONCAT('%', i_filter , '%') OR  
apellidosResponsable LIKE CONCAT('%', i_filter , '%') OR  
celularResponsable LIKE CONCAT('%', i_filter , '%') OR  
telefonoResponsable LIKE CONCAT('%', i_filter , '%') OR  
correlativo_expediente LIKE CONCAT('%', i_filter , '%');
END; 

;;

DELIMITER ;;   
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_catalogo_general;
;;  
 
 
DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_catalogo_general(
	i_filter varchar(256)
)
	BEGIN 
	SELECT id,descripcion,clave,namespace
	FROM catalogo_general
	WHERE  clave LIKE CONCAT('%', i_filter , '%');
END; 
;; 


DELIMITER ;;
 DROP PROCEDURE IF EXISTS  SP_ADD_parametro;
 ;;
 
DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_parametro(
	IN 
    i_id	int,
	i_nombreParametro	varchar(255),
	i_codigoParametroDisposivito	varchar(255),
	i_defExamenID	int,
	i_factor	int,
	i_unidadMedidaID	int,
	i_elementTypeID	int,
	i_orden	int,
	i_dependeGenero	int,
	i_dependeEdad	int
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  parametro
    ( 
  
		nombreParametro,
		codigoParametroDisposivito,
		defExamenID,
		factor,
		unidadMedidaID,
		elementTypeID,
		orden,
		dependeGenero,
		dependeEdad
    )
    VALUES  
    ( 
		 
		UPPER(i_nombreParametro),
		i_codigoParametroDisposivito,
		i_defExamenID,
		i_factor,
		i_unidadMedidaID,
		1,
		i_orden,
		i_dependeGenero,
		i_dependeEdad
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
		id,
		nombreParametro,
		codigoParametroDisposivito,
		defExamenID,
		factor,
		unidadMedidaID,
		elementTypeID,
		orden,
		dependeGenero,
		dependeEdad
	FROM 	parametro
	WHERE   id = w_id;
   
END;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_parametro;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_parametro
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM parametro
WHERE      id = i_id;

 END; 

;;


DELIMITER ;;
 DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_parametro;
 ;;
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_parametro(
	i_filter varchar(256)
)
	BEGIN 
	SELECT   
				parametro.id,
				nombreParametro,
				codigoParametroDisposivito,
				nombreExamen,
				IFNULL(factor,'') AS factor, 
				unidadMedidaID,
				IFNULL(unidadMedida,'') AS unidadMedida
		FROM parametro INNER JOIN definicion_examen ON parametro.defExamenID = definicion_examen.id
				LEFT JOIN unidad_medida ON parametro.unidadMedidaID = unidad_medida.id
	WHERE nombreParametro LIKE CONCAT('%', i_filter , '%') OR  
codigoParametroDisposivito LIKE CONCAT('%', i_filter , '%');
END; 
 ;; 
 
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_parametro;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_parametro( 
    i_id int(12)
) 
BEGIN 
	SELECT   
				parametro.id,
				nombreParametro,
				codigoParametroDisposivito,
				nombreExamen,
				IFNULL(factor,'') AS factor, 
				unidadMedidaID,
				IFNULL(unidadMedida,'') AS unidadMedida,
				subGrupoID
		FROM parametro INNER JOIN definicion_examen ON parametro.defExamenID = definicion_examen.id
				LEFT JOIN unidad_medida ON parametro.unidadMedidaID = unidad_medida.id
		WHERE   defExamenID = i_id
		ORDER BY orden;
END;
;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_ORDER_COLLECTION_parametro;
;;	

DELIMITER ;;
CREATE   PROCEDURE SP_ORDER_COLLECTION_parametro(
	 
    IN i_collection JSON
)
BEGIN 

	/* Collections */
    DECLARE w_document 		VARCHAR(8000);
    DECLARE w_collection 	VARCHAR(4000);
    DECLARE w_model 		VARCHAR(4000);
    DECLARE w_parent_id 	INT(12);
    DECLARE w_action 		CHAR(1);
    
    /*Variables de trabajo del detalle*/
 	DECLARE w_id	int;
 	DECLARE w_orden	int;
	DECLARE w_nombreParametro	varchar(255);
	DECLARE w_codigoParametroDisposivito	varchar(255);
	DECLARE w_defExamenID	int;
	DECLARE w_factor	int;
	DECLARE w_unidadMedidaID	int;
	DECLARE w_elementTypeID	int;
     
	DECLARE w_affectedRowsDetail INT DEFAULT 0;
    
    DECLARE i INT DEFAULT 0;
    
    SELECT JSON_EXTRACT(i_collection, "$.models") 	INTO w_collection; 
 
    
	WHILE i < JSON_LENGTH(w_collection) DO
		SELECT JSON_EXTRACT(w_collection,CONCAT('$[',i,']')) INTO w_model;
		SELECT 	
			JSON_VALUE(w_model,"$.id"),
			JSON_VALUE(w_model,"$.nombreParametro"),
			JSON_VALUE(w_model,"$.codigoParametroDisposivito"),
			JSON_VALUE(w_model,"$.defExamenID"),
			JSON_VALUE(w_model,"$.factor"),
			JSON_VALUE(w_model,"$.unidadMedidaID"),
			JSON_VALUE(w_model,"$.elementTypeID"),
			JSON_VALUE(w_model,"$.orden")
		INTO
			w_id,
			w_nombreParametro,
			w_codigoParametroDisposivito,
			w_defExamenID,
			w_factor,
			w_unidadMedidaID,
			w_elementTypeID,
			w_orden;
	 
			UPDATE   parametro
			SET  orden = w_orden
 			WHERE      id = w_id;
 
				
		SELECT i + 1 INTO i;
        SELECT w_affectedRowsDetail + 1 into w_affectedRowsDetail;
        
	END WHILE;
   
	SELECT w_affectedRowsDetail  as affectedRows;
   
END;
;;	


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_perfil;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_perfil(
	IN 
    i_id	int,
i_nombrePerfil	varchar(255),
i_precio	decimal(14,4)
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  perfil
    ( 
        
		nombrePerfil,
		precio
    )
    VALUES  
    ( 
			
		i_nombrePerfil,
		i_precio
    );
   
   
   SELECT LAST_INSERT_ID() AS lastInserted;
   
END;
;;
 
 
DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_EDIT_perfil;
;;

 DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_perfil(
	IN 
	 i_id	int,i_nombrePerfil	varchar(255),i_precio	decimal(14,4)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   perfil
	 SET  
		id=i_id,nombrePerfil=i_nombrePerfil,precio=i_precio
	WHERE      id = i_id;
	
	SELECT   
			id,nombrePerfil,precio
	FROM 	perfil
	WHERE   id = i_id;

END;
;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_perfil;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_perfil
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM perfil
WHERE      id = i_id;

 END; 

;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_perfil;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_perfil()
	BEGIN 
	SELECT id,nombrePerfil,FORMAT(precio,2) as precio
	FROM perfil;
END; 
 
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_perfil;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_perfil(
	i_filter varchar(256)
)
	BEGIN 
	SELECT id,nombrePerfil,FORMAT(precio,2) as precio
	FROM perfil
	WHERE nombrePerfil LIKE CONCAT('%', i_filter , '%');
END; 

;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_perfil;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_perfil( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombrePerfil,FORMAT(precio,2) as precio
		FROM 	perfil
		WHERE   id = i_id;
END;

;;
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_perfil_detalle;
;; 
 
 
DELIMITER ;;  
CREATE   PROCEDURE SP_ADD_perfil_detalle(
	IN 
    i_id	int,
i_perfilID	int,
i_defExamenID	int
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  perfil_detalle
    ( 
      
		perfilID,
		defExamenID
    )
    VALUES  
    ( 
	 
		i_perfilID,
		i_defExamenID
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id,
			perfilID,
			defExamenID
	FROM 	perfil_detalle
	WHERE   id = w_id;
   
END;
;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_perfil_detalle;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_perfil_detalle(
	IN 
	 i_id	int,i_perfilID	int,i_defExamenID	int
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   perfil_detalle
	 SET  
		id=i_id,perfilID=i_perfilID,defExamenID=i_defExamenID
	WHERE      id = i_id;

END;
;; 



DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_perfil_detalle;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_perfil_detalle
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM perfil_detalle
WHERE      id = i_id;

 END; 

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_perfil_detalle;
;;


DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_perfil_detalle( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				perfil_detalle.id,perfilID,nombreExamen
		FROM 	perfil_detalle INNER JOIN definicion_examen ON perfil_detalle.defExamenID = definicion_examen.id
		WHERE   perfilID = i_id;
END;
 ;;
 
 
 


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_definicion_examen;
;; 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_definicion_examen( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				definicion_examen.id,nombreExamen,nombreCategoria
		 	FROM definicion_examen INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
		WHERE   categoriaID = i_id;
END;
 
 
;;  


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_definicion_examen;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_definicion_examen()
	BEGIN 
	SELECT id,nombreExamen,categoriaID
	FROM definicion_examen;
END; 
 
;; 


DELIMITER ;;   
 DROP PROCEDURE IF EXISTS  SP_ADD_referencia;
;;   
 
 DELIMITER ;;   
CREATE   PROCEDURE SP_ADD_referencia(
	IN 
    i_id	int,
	i_edad_desde	int,
	i_unidadTiempoDesde	int,
	i_edad_hasta	int,
	i_unidadTiempoHasta	int,
	i_generoID	int,
	i_unidadID	int,
	i_minimo	decimal(14,4),
	i_operador	varchar(256),
	i_maximo	decimal(14,4),
	i_parametroID	int,
	i_notas varchar(256),
	i_dependeGenero int,
	i_dependeEdad int
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  referencia
    ( 
 
		edad_desde,
		unidadTiempoDesde,
		edad_hasta,
		unidadTiempoHasta,
		generoID,
		unidadID,
		minimo,
		operador,
		maximo,
		parametroID,
		notas,
		dependeGenero,
		dependeEdad
    )
    VALUES  
    ( 
	 
		i_edad_desde,
		i_unidadTiempoDesde,
		i_edad_hasta,
		i_unidadTiempoHasta,
		i_generoID,
		i_unidadID,
		i_minimo,
		i_operador,
		i_maximo,
		i_parametroID,
		i_notas,
		i_dependeGenero,
		i_dependeEdad
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id,
			edad_desde,
			unidadTiempoDesde,
			edad_hasta,
			unidadTiempoHasta,
			generoID,
			unidadID,
			minimo,
			operador,
			maximo,
			parametroID,
			notas,
			dependeGenero,
			dependeEdad
	FROM 	referencia
	WHERE   id = w_id;
   
END;
;; 


DELIMITER ;;  
DROP PROCEDURE IF EXISTS  SP_EDIT_referencia;
;;  
 
DELIMITER ;;   
CREATE  PROCEDURE SP_EDIT_referencia(
	IN 
	 i_id	int,
	 i_edad_desde	int,
	 i_unidadTiempoDesde	int,
	 i_edad_hasta	int,
	 i_unidadTiempoHasta	int,
	 i_generoID	int,
	 i_unidadID	int,
	 i_minimo	decimal(14,4),
	 i_operador	varchar(256),
	 i_maximo	decimal(14,4),
	 i_parametroID	int,
	 i_notas varchar(256),
	 i_dependeGenero int,
	 i_dependeEdad int
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   referencia
	 SET  
	 edad_desde=i_edad_desde,
		 unidadTiempoDesde=i_unidadTiempoDesde,
		 edad_hasta=i_edad_hasta,
		 unidadTiempoHasta=i_unidadTiempoHasta,
		 generoID=i_generoID,
		 minimo=i_minimo,
		 operador=i_operador,
		 maximo=i_maximo,
		 parametroID=i_parametroID,
		 notas = i_notas,
		 dependeGenero = i_dependeGenero,
		 dependeEdad = i_dependeEdad
	WHERE      id = i_id;
	
	SELECT   
			id,
			edad_desde,
			unidadTiempoDesde,
			edad_hasta,
			unidadTiempoHasta,
			generoID,
			unidadID,
			minimo,
			operador,
			maximo,
			parametroID,
			notas,
			dependeGenero,
			dependeEdad
	FROM 	referencia
	WHERE   id = i_id;

END;
;; 

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_referencia;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_referencia
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM referencia
WHERE      id = i_id;

 END; 

;;

DELIMITER ;;  
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_referencia;
;;
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_ROW_referencia( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,
				edad_desde,
				unidadTiempoDesde,
				edad_hasta,
				unidadTiempoHasta,
				generoID,
				minimo,
				operador,
				maximo,
				parametroID,
				notas,
				dependeGenero,
				dependeEdad
		FROM 	referencia
		WHERE   id = i_id;
END;
;;
		
		
DELIMITER ;;  
DROP PROCEDURE IF EXISTS  SP_SELECT_COLLECTION_BY_PARENT_ID_referencia;
;;  


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_referencia( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				referencia.id,
				IFNULL(edad_desde,'') AS edad_desde,
				IFNULL(unidadTiempoDesde,'') AS unidadTiempoDesde,
				IFNULL(edad_hasta,'') AS edad_hasta,
				IFNULL(unidadTiempoHasta,'') AS unidadTiempoHasta,
				generoID,
				IFNULL(minimo,0) AS minimo,
				IFNULL(maximo,0) AS maximo,
				parametroID,
				IFNULL(rangoMinimo.descripcion,'') AS unidadTiempoDesde,
				IFNULL(rangoMaximo.descripcion,'') AS unidadTiempoHasta,
				IFNULL(operador.descripcion,'') AS operador,
				nombreParametro,
				IFNULL(genero.descripcion,'') AS genero,
				notas
		FROM 	referencia	LEFT JOIN catalogo_general AS genero ON referencia.generoID = genero.id
				INNER JOIN parametro ON referencia.parametroID = parametro.id
				LEFT JOIN catalogo_general AS operador ON referencia.operador =  operador.id
				LEFT JOIN catalogo_general AS rangoMinimo ON referencia.unidadTiempoDesde =  rangoMinimo.id
		 LEFT JOIN catalogo_general AS rangoMaximo ON referencia.unidadTiempoHasta =  rangoMaximo.id
		WHERE   parametroID = i_id;
END;
;; 		



DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_orden_examenes_detalle;
;; 
 
DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_ROW_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				orden_examenes_detalle.id,
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				ordenID,
				defExamenID,
				fechaInicio,
				fechaFin,
				horaInicio,
				horaFin,
				fechaProceso,
				horaProceso,
				catalogoID,
				usuarioElaboroID,
				usuarioValidoID,
				observaciones
		FROM 	orden_examenes_detalle 
				INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON  categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   orden_examenes_detalle.id = i_id;
END;
;; 


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_orden_examenes;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_orden_examenes( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id as ordenID,
				fecha,
				hora,
				presuntoDiagnostico,
				diagnostico,
				pacienteID,
				medicoTratanteID,
				medicoReferenteID,
				areaReferenciaHospitalID,
				frecuenciaExamenes,
				medicamentoPermanente,
				edadActual,
				descripcion as unidadTiempo
		FROM 	orden_examenes INNER JOIN catalogo_general
					ON orden_examenes.unidadTiempo = catalogo_general.id
		WHERE   id = i_id;
END;

;;



DELIMITER ;;
DROP PROCEDURE IF EXISTS PR_ActualizarPasoUno;
;;
 
 
DELIMITER ;; 
CREATE  PROCEDURE `PR_ActualizarPasoUno`(
   i_ordenID INT(12)
)
BEGIN
	DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();

/*
	estado 1 = Facturado
    estado 2 = En proceso
    estado 3 = En Impresion
*/
	UPDATE 		orden_examenes
    SET 		estado = 2
    WHERE 		id = i_ordenID;

	UPDATE orden_examenes_detalle
	SET catalogoID = 2,
		fechaInicio = w_add_date,
		horaInicio = w_add_time
	WHERE ordenID = i_ordenID;

END



DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_item;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_item( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,descripcion,catalogoID,cuentaID,areaID,unidadMedidaID
		FROM 	item
		WHERE   id = i_id;
END;

;;



DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_ROWS_FILTER_catalogo_general;
;;
 
DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_ALL_ROWS_FILTER_catalogo_general(
	IN 
		i_id	int,i_descripcion	varchar(255),i_clave	varchar(255),i_namespace	varchar(256)
)
BEGIN 
		SELECT 	id,descripcion,clave,namespace
		FROM 	catalogo_general
		WHERE 	clave = i_clave AND  
				namespace = i_namespace;
END; 
;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_orden_examenes_detalle;
;;  
 
DELIMITER ;;  
CREATE  PROCEDURE SP_EDIT_orden_examenes_detalle(
	IN 
	 i_id	int,
	 i_ordenID	int,
	 i_defExamenID	int,
	 i_fechaInicio	date,
	 i_fechaFin	date,
	 i_horaInicio	time,
	 i_horaFin	time,
	 i_fechaProceso	date,
	 i_horaProceso	time,
	 i_catalogoID	int,
	 i_usuarioElaboroID	int,
	 i_usuarioValidoID	int,
	 i_observaciones VARCHAR(256)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   orden_examenes_detalle
	 SET  
		 ordenID=i_ordenID,
		 defExamenID=i_defExamenID,
		 fechaInicio = i_fechaInicio,
		 fechaFin=i_fechaFin,
		 horaFin=i_horaFin,
		 fechaProceso=i_fechaProceso,
		 horaProceso=i_horaProceso,
		 catalogoID=i_catalogoID,
		 usuarioElaboroID=i_usuarioElaboroID,
		 usuarioValidoID=i_usuarioValidoID,
		 observaciones = i_observaciones
	WHERE      id = i_id;
	
	SELECT   
			id,ordenID,defExamenID,fechaInicio,fechaFin,horaInicio,horaFin,fechaProceso,horaProceso,catalogoID,usuarioElaboroID,usuarioValidoID,observaciones
	FROM 	orden_examenes_detalle
	WHERE   id = i_id;

END;
;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_ROWS_FILTER_orden_examenes;
;; 
 
DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_ROWS_FILTER_orden_examenes(
	IN 
		i_fecha_ini	DATE,
		i_fecha_fin	DATE,
		i_estadoOrdenID	INT(12),
		i_estadoDetalleID	INT(12),
		i_filter	VARCHAR(256)
)
BEGIN
	
	
	IF LENGTH(i_filter) = 0 THEN 
		SELECT 		concat(nombresPaciente,' ', apellidosPaciente) as nombrePaciente,
					orden_examenes.id,
					DATE_FORMAT(orden_examenes.fecha, "%d/%m/%Y") as fecha,
					hora,
					presuntoDiagnostico,
					diagnostico,
					pacienteID,
					medicoTratanteID,
					medicoReferenteID,
					frecuenciaExamenes,
					medicamentoPermanente,
					edadActual
		FROM 	orden_examenes INNER JOIN paciente ON orden_examenes.pacienteID = paciente.id
		WHERE  	 (		orden_examenes.fecha BETWEEN i_fecha_ini 
						AND  	i_fecha_fin
						AND  estado =  i_estadoOrdenID )
	   ORDER BY orden_examenes.fecha DESC,hora DESC;
		 
	
					
	ELSE 
	
		SELECT 		concat(nombresPaciente,' ', apellidosPaciente) as nombrePaciente,
						orden_examenes.id,
						DATE_FORMAT(orden_examenes.fecha, "%d/%m/%Y") as fecha,
						hora,
						presuntoDiagnostico,
						diagnostico,
						pacienteID,
						medicoTratanteID,
						medicoReferenteID,
						frecuenciaExamenes,
						medicamentoPermanente,
						edadActual
			FROM 	orden_examenes INNER JOIN paciente ON orden_examenes.pacienteID = paciente.id
			WHERE  	 (		orden_examenes.fecha BETWEEN i_fecha_ini 
							AND  i_fecha_fin
							AND  estado =  i_estadoOrdenID )
						AND  (	nombresPaciente  LIKE CONCAT('%', i_filter , '%'	)
						OR 	apellidosPaciente LIKE CONCAT('%', i_filter , '%'	))
			ORDER BY orden_examenes.fecha DESC,hora DESC;
	
	
	END IF;
END
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_orden_examenes_detalle;
;; 
 
DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_ROW_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,
				ordenID,
				defExamenID,
				fechaInicio,
				fechaFin,
				horaInicio,
				horaFin,
				fechaProceso,
				horaProceso,
				catalogoID,
				usuarioElaboroID,
				usuarioValidoID
		FROM 	orden_examenes_detalle
		WHERE   id = i_id;
END;
;; 

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DISPLAY_ROW_paciente;
;;

DELIMITER ;;
CREATE PROCEDURE SP_DISPLAY_ROW_paciente( 
    i_id int(12)
) 
BEGIN 
	
		DECLARE w_add_date DATE;
		SET w_add_date = NOW(); 
		
		SELECT   
				paciente.id,
				fechaNacimiento,
				nombresPaciente,
				apellidosPaciente,
				catalogoID,
				dui,
				pasaporte,
				celular,
				telefono,
				direccion,
				IFNULL(nombreResponsable,"") AS nombreResponsable,
				IFNULL(apellidosResponsable,"") AS apellidosResponsable,
				IFNULL(celularResponsable,"") AS celularResponsable,
				telefonoResponsable,
				tipoPaciente,
				correlativo_expediente,
				catalogo_general.descripcion as genero,
				YEAR(w_add_date) - YEAR(fechaNacimiento) as edad
		FROM 	paciente INNER JOIN catalogo_general ON paciente.catalogoID = catalogo_general.id
		WHERE   paciente.id = i_id;
END;
;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_orden_examenes_detalle;
;;
 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
		SELECT  
				
				orden_examenes_detalle.id,
				defExamenID, 
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				DATE_FORMAT(fechaInicio, "%d/%m/%Y") as fechaInicio,
				fechaFin,
				horaInicio,
				horaFin,
				fechaProceso,
				horaProceso,
				usuarioElaboroID,
				usuarioValidoID,
				IFNULL(tiempoTranscurrido,'00:00:00') as tiempoTranscurrido,
				CASE catalogoID WHEN '1' THEN 'Pendiente'
				 WHEN '35' THEN 'En proceso'
				 WHEN '36' THEN 'Pendiente de Impresion'
				END AS Estado,
				catalogoID,
				ordenID
		FROM 	orden_examenes_detalle INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   ordenID  = i_id;
END;
 ;;
 
DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_FILTER_orden_examenes_detalle;
;;
 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_FILTER_orden_examenes_detalle( 
    i_parentID int(12),
	i_categoriaID int(12),
	i_estado int(12)
) 
BEGIN 
		SELECT  
				
				orden_examenes_detalle.id,
				defExamenID, 
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				DATE_FORMAT(fechaInicio, "%d/%m/%Y") as fechaInicio,
				fechaFin,
				horaInicio,
				horaFin,
				fechaProceso,
				horaProceso,
				usuarioElaboroID,
				usuarioValidoID,
				IFNULL(tiempoTranscurrido,'00:00:00') as tiempoTranscurrido,
				CASE catalogoID WHEN '1' THEN 'Pendiente'
				 WHEN '35' THEN 'En proceso'
				 WHEN '36' THEN 'Pendiente de Impresion'
				END AS Estado,
				catalogoID
		FROM 	orden_examenes_detalle INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   ordenID  = i_parentID AND categoria.id = i_categoriaID AND catalogoID = i_estado;
END;
 ;;
 
 
DELIMITER ;;
DROP PROCEDURE IF EXISTS PR_ActualizarPasoUno;
;;
 
 
DELIMITER ;; 
CREATE  PROCEDURE `PR_ActualizarPasoUno`(
   i_ordenID INT(12)
)
BEGIN
	SET time_zone = "-06:00";

/*
	estado 1 = Facturado
    estado 2 = En proceso
    estado 3 = En Impresion
*/
	UPDATE 		orden_examenes
    SET 		estado = 2
    WHERE 		id = i_ordenID;

	UPDATE orden_examenes_detalle
	SET catalogoID = 35,
		
	WHERE ordenID = i_ordenID;

END



DELIMITER ;;
DROP PROCEDURE IF EXISTS PR_ActualizarPasoDos;
;;

DELIMITER ;; 
CREATE   PROCEDURE `PR_ActualizarPasoDos`(

  i_ordenID INT(12),
  i_ordenDetalleID INT(12)

)
BEGIN
	/*
		estado 1 = Facturado
		estado 2 = En proceso
		estado 3 = En Impresion
	*/
	UPDATE orden_examenes
    SET estado = 3
    WHERE id = i_ordenID;

	UPDATE orden_examenes_detalle
    SET catalogoID  = 36
    WHERE id = i_ordenDetalleID;


END;
;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_PASO_DOS;
;;


DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_PASO_DOS()
BEGIN 
			SELECT 		concat(P.nombresPaciente,' ', P.apellidosPaciente) as nombrePaciente,
						OE.id,
						DATE_FORMAT(OE.fecha, "%d/%m/%Y") as fecha, 
						OE.hora,
						OE.presuntoDiagnostico,
						OE.diagnostico,
						OE.pacienteID,
						OE.medicoTratanteID,
						OE.medicoReferenteID,
						OE.frecuenciaExamenes,
						OE.medicamentoPermanente,
						OE.edadActual
			FROM  		orden_examenes OE INNER JOIN paciente P ON OE.pacienteID = P.id
			WHERE      	estado = 2
						AND OE.id IN ( SELECT ordenID  FROM orden_examenes_detalle WHERE  orden_examenes_detalle.catalogoID = 35 )
			ORDER by OE.fecha DESC,OE.hora DESC
			LIMIT 25;
 
END; 
;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_PASO_TRES;
;;


DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_PASO_TRES()
BEGIN 
			SELECT 		concat(P.nombresPaciente,' ', P.apellidosPaciente) as nombrePaciente,
						OE.id,
						DATE_FORMAT(OE.fecha, "%d/%m/%Y") as fecha, 
						OE.hora,
						OE.presuntoDiagnostico,
						OE.diagnostico,
						OE.pacienteID,
						OE.medicoTratanteID,
						OE.medicoReferenteID,
						OE.frecuenciaExamenes,
						OE.medicamentoPermanente,
						OE.edadActual
			FROM  		orden_examenes OE INNER JOIN paciente P ON OE.pacienteID = P.id
			WHERE      	estado = 2
						AND OE.id IN ( SELECT ordenID  FROM orden_examenes_detalle WHERE  orden_examenes_detalle.catalogoID = 36 )
			ORDER by OE.fecha DESC,OE.hora DESC;
		
 
END; 
;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_PASO_UNO;
;;


DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_PASO_UNO()
BEGIN 
			SELECT 		concat(nombresPaciente,' ', apellidosPaciente) as nombrePaciente,
						orden_examenes.id,
						DATE_FORMAT(fecha, "%d/%m/%Y") as fecha,
						hora,presuntoDiagnostico,
						diagnostico,
						pacienteID,
						medicoTratanteID,
						medicoReferenteID,
						frecuenciaExamenes,
						medicamentoPermanente,
						edadActual
			FROM  		orden_examenes INNER JOIN paciente ON orden_examenes.pacienteID = paciente.id
			WHERE      	estado = 1
						AND orden_examenes.id IN ( SELECT ordenID  FROM orden_examenes_detalle WHERE  orden_examenes_detalle.catalogoID = 1 )
			ORDER by fecha DESC;
 
END; 
;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_BY_PARENT_ID_orden_examenes_detalle;
;;
 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_ROWS_BY_PARENT_ID_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
		SELECT  
				
				orden_examenes_detalle.id,
				defExamenID, 
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				DATE_FORMAT(fechaInicio, "%d/%m/%Y") as fechaInicio,
				fechaFin,
				horaInicio,
				horaFin,
				fechaProceso,
				horaProceso,
				usuarioElaboroID,
				usuarioValidoID,
				IFNULL(tiempoTranscurrido,'00:00:00') as tiempoTranscurrido,
				CASE catalogoID WHEN '1' THEN 'Pendiente'
				 WHEN '35' THEN 'En proceso'
				 WHEN '36' THEN 'Pendiente de Impresion'
				END AS Estado,
				catalogoID
		FROM 	orden_examenes_detalle INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   ordenID  = i_id AND catalogoID = 36;
END;
 ;;
 
 
 
DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_catalogo_general;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_catalogo_general( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,descripcion,clave,namespace
		FROM 	catalogo_general
		WHERE   id = i_id;
END;

;;
 
 

DELIMITER ;;
DROP PROCEDURE IF EXISTS PR_MuestrasPorOrdenes;
;;


DELIMITER ;;
CREATE   PROCEDURE `PR_MuestrasPorOrdenes`(
 i_ordenID INT(12)
)
BEGIN

		SELECT  orden_examenes.id,
				nombreMuestra,
                concat(nombresPaciente,' ' , apellidosPaciente) AS nombrePaciente,
                DATE_FORMAT(fecha, "%d/%m/%Y") as fecha,
                hora
		FROM muestra INNER JOIN categoria_muestra 
				ON muestra.id = categoria_muestra.muestraID
				INNER JOIN categoria ON categoria_muestra.categoriaID = categoria.id
				INNER JOIN definicion_examen ON definicion_examen.categoriaID = categoria.id
				INNER JOIN orden_examenes_detalle ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN orden_examenes ON orden_examenes_detalle.ordenID = orden_examenes.id
                INNER JOIN paciente ON orden_examenes.pacienteID = paciente.id
		WHERE orden_examenes.id = i_ordenID;

END;
;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS PR_FacturarOrdenExamen;
;;

DELIMITER ;;
CREATE   PROCEDURE `PR_FacturarOrdenExamen`(
 IN
	i_ventaID INT(12),
	i_presuntoDiagnostico VARCHAR(256),
	i_diagnostico VARCHAR(256),
	i_pacienteID INT(12),
	i_medicoTratanteID INT(12),
	i_medicoReferenteID INT(12),
	i_areaReferenciaHospitalID INT(12),
	i_frecuenciaExamenes VARCHAR(256),
	i_medicamentoPermanente VARCHAR(256)
)
BEGIN
		DECLARE w_id INT(12);
        DECLARE w_ordenID INT(12);
        
		DECLARE w_add_date DATE;
		DECLARE w_add_time  TIME; 
        
        DECLARE w_totalItemsRelacionados INT(12);
		DECLARE w_totalItemsFacturados INT(12);
		DECLARE w_edadActual INT(12);
		DECLARE w_genero INT(1);
		DECLARE w_unidadTiempo INT(12);
		DECLARE w_day INT(12);
		DECLARE w_detalleID INT(12);
		DECLARE w_examenID INT(12);
		DECLARE w_parametroID INT(12);
		DECLARE w_totalReferencia INT(12);
		DECLARE w_totalGenero INT(12);
		DECLARE w_totalEdad INT(12);
	    DECLARE w_referenciaID INT(12);
		DECLARE w_ambos INT(12);
		DECLARE w_dependeEdad INT(1);
		DECLARE w_dependeGenero INT(1);
		 
		DECLARE done INT DEFAULT FALSE;
 
		DECLARE cur CURSOR FOR 
		SELECT 	
				orden_examenes_detalle.id AS detalleID, 
				orden_examenes_detalle.defExamenID,
				parametro.id AS parametroID,
				IFNULL(parametro.dependeGenero,0) AS dependeGenero,
				IFNULL(parametro.dependeEdad,0) AS dependeEdad
		FROM 	orden_examenes_detalle 
				INNER JOIN parametro ON orden_examenes_detalle.defExamenID = parametro.defExamenID		
		WHERE ordenID = w_ordenID;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE; 
        
		SET time_zone = "-06:00";
		
		SET w_add_date = NOW(); 
		SET w_add_time  = CURTIME();
        
 
        
		SET w_edadActual = (SELECT YEAR(w_add_date) - YEAR(fechaNacimiento) FROM paciente WHERE id = i_pacienteID );
		SET w_genero = (SELECT catalogoID FROM paciente WHERE id = i_pacienteID );
		
		/*
			Edad en Años
		*/
		IF w_edadActual >= 2 THEN
			SET w_unidadTiempo = 30;
	    END IF;
		
		
		/*
			Edad en meses y dias
		*/		
		IF w_edadActual < 2 THEN
			
		 SET w_edadActual = (SELECT DATEDIFF(w_add_date, fechaNacimiento) FROM paciente WHERE id = i_pacienteID);
		 IF w_edadActual < 29 THEN 
				SET w_unidadTiempo = 27;
			ELSE 		
				SET w_unidadTiempo = 29;
				SET w_edadActual = ( SELECT TIMESTAMPDIFF(MONTH, w_add_date, fechaNacimiento) FROM paciente WHERE id = i_pacienteID);
			END IF;
		 
	    END IF;
 
 
 
		/*
			Validar que existe una relacion entre los items a facturar y la definicion de 
            los examenes
        */
        SET w_totalItemsFacturados = (
			SELECT COUNT(1)
            FROM venta_detalle
            WHERE ventaID = i_ventaID
        );
        
        
        SET w_totalItemsRelacionados = (
			SELECT COUNT(1)
            FROM orden_examenes_detalle
            WHERE defExamenID IN (
				SELECT defExamenID
                FROM factura_laboratorio
                WHERE estado = 1
            )
        );
        
        
			/*
				Crear la Orden 
			*/
			   INSERT INTO  orden_examenes
				( 
					fecha,
					hora,
					presuntoDiagnostico,
					diagnostico,
					pacienteID,
					medicoTratanteID,
					medicoReferenteID,
					areaReferenciaHospitalID,
					frecuenciaExamenes,
					medicamentoPermanente,
					edadActual
				)
				VALUES  
				( 
					w_add_date,
					w_add_time,
					i_presuntoDiagnostico,
					i_diagnostico,
					i_pacienteID,
					i_medicoTratanteID,
					i_medicoReferenteID,
					i_areaReferenciaHospitalID,
					i_frecuenciaExamenes,
					i_medicamentoPermanente,
					w_edadActual
				);
			   
			   
				SET w_ordenID = ( SELECT LAST_INSERT_ID() );      
                
                /*
					Insertar el detalle de ordenes
                */
                
			   INSERT INTO orden_examenes_detalle(
					ordenID,
					defExamenID, 
					fechaInicio, 
					horaInicio,
                    catalogoID
			   ) select 
					w_ordenID,
                    defExamenID,
					w_add_date,
					w_add_time,
                    1
				 FROM venta_detalle INNER JOIN factura_laboratorio
					  ON venta_detalle.itemID = factura_laboratorio.itemID
                 WHERE ventaID = i_ventaID;
                
                
   
	  OPEN cur;
	  read_loop: LOOP
		FETCH cur INTO w_detalleID,w_examenID,w_parametroID,w_dependeGenero,w_dependeEdad;
			IF done THEN
			  LEAVE read_loop;
			END IF;
		     
     
             SET w_totalReferencia = ( SELECT COUNT(1) FROM referencia  WHERE parametroID = w_parametroID );
			 SET w_referenciaID = 0;
			 
			 IF w_totalReferencia > 0 THEN
			 
			 		IF w_dependeGenero = 0 AND w_dependeEdad = 0 THEN
			
						IF w_totalReferencia = 1 THEN
							SET w_referenciaID = (
								SELECT IFNULL(id,0)
								FROM referencia 
								WHERE	parametroID = w_parametroID
								LIMIT 1
							);						
						
						END IF;
						
					END IF;
			 
 			
					IF w_dependeGenero = 1 AND w_dependeEdad = 1 THEN
					
						SET w_referenciaID = (
							SELECT IFNULL(id,0)
							FROM referencia 
							WHERE generoID = w_genero AND (
							   w_edadActual BETWEEN edad_desde AND edad_hasta
							) AND parametroID = w_parametroID
							LIMIT 1
						);
					END IF;
					
					IF w_dependeGenero = 1 AND w_dependeEdad = 0 THEN
					
						SET w_referenciaID = (
							SELECT IFNULL(id,0)
							FROM referencia 
							WHERE generoID = w_genero  AND parametroID = w_parametroID
							LIMIT 1
						);
					END IF;					
					IF w_dependeGenero = 0 AND w_dependeEdad = 1 THEN
					
						SET w_referenciaID = (
							SELECT IFNULL(id,0)
							FROM referencia 
							WHERE   (
							   w_edadActual BETWEEN edad_desde AND edad_hasta
							) AND parametroID = w_parametroID
							LIMIT 1
						);
					END IF;		
 
			 END IF;
 	 
			IF w_referenciaID IS NULL THEN
				SET w_referenciaID = 0;
			END IF;
			
			INSERT INTO orden_examenes_parametros(
				trans_orden_detalleID, 
				defExamenID,
				parametroID,
				referenciaID
				 
				 
			)  VALUES (
				w_detalleID,
				w_examenID,
				w_parametroID,
				w_referenciaID
				 
				
			);
			 
             
	  END LOOP;
	  CLOSE cur;                 
         
      
END;

;;				


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_parametro;
;;
 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_ROW_parametro( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,
				nombreParametro,
				codigoParametroDisposivito,
				defExamenID,
				factor,
				unidadMedidaID,
				elementTypeID,
				orden,
				dependeGenero,
				dependeEdad
		FROM 	parametro
		WHERE   id = i_id;
END;
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_catalogo_general;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_catalogo_general
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM catalogo_general
WHERE      id = i_id;

 END; 

;;


DELIMITER ;;  
DROP PROCEDURE IF EXISTS  SP_ADD_catalogo_general;
;;

DELIMITER ;;  
CREATE   PROCEDURE SP_ADD_catalogo_general(
	IN 
    i_id	int,
	i_descripcion	varchar(255),
	i_clave	varchar(255),
	i_namespace	varchar(256)
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  catalogo_general
    ( 
        
		descripcion,
		clave,
		namespace
    )
    VALUES  
    ( 
		i_descripcion,
		i_clave,
		i_namespace
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id,
			descripcion,
			clave,
			namespace
	FROM 	catalogo_general
	WHERE   id = w_id;
   
END; 
;;



/*

	27/05/2024 17:47
	
*/
DELIMITER ;;
DROP PROCEDURE IF EXISTS PR_FacturarOrdenExamen;
;;

DELIMITER ;;
CREATE   PROCEDURE `PR_FacturarOrdenExamen`(
 IN
	i_ventaID INT(12),
	i_presuntoDiagnostico VARCHAR(256),
	i_diagnostico VARCHAR(256),
	i_pacienteID INT(12),
	i_medicoTratanteID INT(12),
	i_medicoReferenteID INT(12),
	i_areaReferenciaHospitalID INT(12),
	i_frecuenciaExamenes VARCHAR(256),
	i_medicamentoPermanente VARCHAR(256)
)
BEGIN
		DECLARE w_id INT(12);
        DECLARE w_ordenID INT(12);
        
		DECLARE w_add_date datetime;
		DECLARE w_add_time  TIME; 
        
        DECLARE w_totalItemsRelacionados INT(12);
		DECLARE w_totalItemsFacturados INT(12);
		DECLARE w_edadActual INT(12);
		DECLARE w_genero INT(1);
		DECLARE w_unidadTiempo INT(12);
		DECLARE w_day INT(12);
		DECLARE w_detalleID INT(12);
		DECLARE w_examenID INT(12);
		DECLARE w_parametroID INT(12);
		DECLARE w_totalReferencia INT(12);
		DECLARE w_totalGenero INT(12);
		DECLARE w_totalEdad INT(12);
	    DECLARE w_referenciaID INT(12);
		DECLARE w_ambos INT(12);
		DECLARE w_dependeEdad INT(1);
		DECLARE w_dependeGenero INT(1);
		 
		DECLARE done INT DEFAULT FALSE;
 
		DECLARE cur CURSOR FOR 
		SELECT 	
				orden_examenes_detalle.id AS detalleID, 
				orden_examenes_detalle.defExamenID,
				parametro.id AS parametroID,
				IFNULL(parametro.dependeGenero,0) AS dependeGenero,
				IFNULL(parametro.dependeEdad,0) AS dependeEdad
		FROM 	orden_examenes_detalle 
				INNER JOIN parametro ON orden_examenes_detalle.defExamenID = parametro.defExamenID		
		WHERE ordenID = w_ordenID;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE; 
        
		SET time_zone = "-06:00";
		
		SET w_add_date = NOW(); 
		SET w_add_time  = CURTIME();
        
 
        
		SET w_edadActual = (SELECT YEAR(w_add_date) - YEAR(fechaNacimiento) FROM paciente WHERE id = i_pacienteID );
		SET w_genero = (SELECT catalogoID FROM paciente WHERE id = i_pacienteID );
		
		/*
			Edad en Años
		*/
		IF w_edadActual >= 2 THEN
			SET w_unidadTiempo = 30;
	    END IF;
		
		
		/*
			Edad en meses y dias
		*/		
		IF w_edadActual < 2 THEN
			
		 SET w_edadActual = (SELECT DATEDIFF(w_add_date, fechaNacimiento) FROM paciente WHERE id = i_pacienteID);
		 IF w_edadActual <= 29 THEN 
				SET w_unidadTiempo = 27;
			ELSE 		
				SET w_unidadTiempo = 29;
				SET w_edadActual = ( SELECT TIMESTAMPDIFF(MONTH, fechaNacimiento,w_add_date ) FROM paciente WHERE id = i_pacienteID);
			END IF;
		 
	    END IF;
 
 
 
		/*
			Validar que existe una relacion entre los items a facturar y la definicion de 
            los examenes
        */
        SET w_totalItemsFacturados = (
			SELECT COUNT(1)
            FROM venta_detalle
            WHERE ventaID = i_ventaID
        );
        
        
        SET w_totalItemsRelacionados = (
			SELECT COUNT(1)
            FROM orden_examenes_detalle
            WHERE defExamenID IN (
				SELECT defExamenID
                FROM factura_laboratorio
                WHERE estado = 1
            )
        );
        
        
			/*
				Crear la Orden 
			*/
			   INSERT INTO  orden_examenes
				( 
					fecha,
					hora,
					presuntoDiagnostico,
					diagnostico,
					pacienteID,
					medicoTratanteID,
					medicoReferenteID,
					areaReferenciaHospitalID,
					frecuenciaExamenes,
					medicamentoPermanente,
					edadActual,
					unidadTiempo
				)
				VALUES  
				( 
					w_add_date,
					w_add_time,
					i_presuntoDiagnostico,
					i_diagnostico,
					i_pacienteID,
					i_medicoTratanteID,
					i_medicoReferenteID,
					i_areaReferenciaHospitalID,
					i_frecuenciaExamenes,
					i_medicamentoPermanente,
					w_edadActual,
					w_unidadTiempo
					
				);
			   
			   
				SET w_ordenID = ( SELECT LAST_INSERT_ID() );      
                
                /*
					Insertar el detalle de ordenes
                */
                
			   INSERT INTO orden_examenes_detalle(
					ordenID,
					defExamenID, 
					fechaInicio, 
					horaInicio,
                    catalogoID
			   ) select 
					w_ordenID,
                    defExamenID,
					w_add_date,
					w_add_time,
                    1
				 FROM venta_detalle INNER JOIN factura_laboratorio
					  ON venta_detalle.itemID = factura_laboratorio.itemID
                 WHERE ventaID = i_ventaID;
                
                
   
	  OPEN cur;
	  read_loop: LOOP
		FETCH cur INTO w_detalleID,w_examenID,w_parametroID,w_dependeGenero,w_dependeEdad;
			IF done THEN
			  LEAVE read_loop;
			END IF;
		     
     
             SET w_totalReferencia = ( SELECT COUNT(1) FROM referencia  WHERE parametroID = w_parametroID );
			 SET w_referenciaID = 0;
			 
			 IF w_totalReferencia > 0 THEN
			 
			 		IF w_dependeGenero = 0 AND w_dependeEdad = 0 THEN
			
						IF w_totalReferencia = 1 THEN
							SET w_referenciaID = (
								SELECT IFNULL(id,0)
								FROM referencia 
								WHERE	parametroID = w_parametroID
								LIMIT 1
							);						
						
						END IF;
						
					END IF;
			 
 			
					IF w_dependeGenero = 1 AND w_dependeEdad = 1 THEN
					
						SET w_referenciaID = (
							SELECT IFNULL(id,0)
							FROM referencia 
							WHERE generoID = w_genero AND (
							   w_edadActual BETWEEN edad_desde AND edad_hasta
							) AND parametroID = w_parametroID AND ( w_unidadTiempo = unidadTiempoDesde OR w_unidadTiempo = unidadTiempoHasta)
							LIMIT 1
						);
					END IF;
					
					IF w_dependeGenero = 1 AND w_dependeEdad = 0 THEN
					
						SET w_referenciaID = (
							SELECT IFNULL(id,0)
							FROM referencia 
							WHERE generoID = w_genero  AND parametroID = w_parametroID
							LIMIT 1
						);
					END IF;					
					IF w_dependeGenero = 0 AND w_dependeEdad = 1 THEN
					
						SET w_referenciaID = (
							SELECT IFNULL(id,0)
							FROM referencia 
							WHERE   (
							   w_edadActual BETWEEN edad_desde AND edad_hasta
							) AND parametroID = w_parametroID AND ( w_unidadTiempo = unidadTiempoDesde OR w_unidadTiempo = unidadTiempoHasta)
							LIMIT 1
						);
					END IF;		
 
			 END IF;
 	 
			IF w_referenciaID IS NULL THEN
				SET w_referenciaID = 0;
			END IF;
			
			INSERT INTO orden_examenes_parametros(
				trans_orden_detalleID, 
				defExamenID,
				parametroID,
				referenciaID
				 
				 
			)  VALUES (
				w_detalleID,
				w_examenID,
				w_parametroID,
				w_referenciaID
				 
				
			);
			 
             
	  END LOOP;
	  CLOSE cur;                 
         
      
END;

;;				



DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_orden_examenes;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_orden_examenes( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				orden_examenes.id as ordenID,
				fecha,
				hora,
				presuntoDiagnostico,
				diagnostico,
				pacienteID,
				medicoTratanteID,
				medicoReferenteID,
				areaReferenciaHospitalID,
				frecuenciaExamenes,
				medicamentoPermanente,
				edadActual,
				IFNULL(descripcion,'NO DEFINIDO') AS unidadTiempo
		FROM 	orden_examenes LEFT JOIN catalogo_general
					ON orden_examenes.unidadTiempo = catalogo_general.id
		WHERE   orden_examenes.id = i_id;
END;
;;





UPDATE referencia
SET equivalenteDesde = edad_desde  
WHERE unidadTiempoDesde = 27;


UPDATE referencia
SET equivalenteHasta = edad_hasta 
WHERE unidadTiempoHasta = 27;


UPDATE referencia
SET equivalenteDesde = edad_desde * 365
WHERE unidadTiempoDesde = 30;


UPDATE referencia
SET equivalenteHasta = edad_hasta * 365
WHERE unidadTiempoHasta = 30;


UPDATE referencia
SET equivalenteDesde = edad_desde * 30
WHERE unidadTiempoDesde = 29;


UPDATE referencia
SET equivalenteHasta = edad_hasta * 30
WHERE unidadTiempoHasta = 29;


UPDATE referencia
SET equivalenteDesdeYear = edad_desde  / 365
WHERE unidadTiempoDesde = 27;


UPDATE referencia
SET equivalenteHastaYear = edad_hasta / 365
WHERE unidadTiempoHasta = 27;


UPDATE referencia
SET equivalenteDesdeYear = edad_desde   
WHERE unidadTiempoDesde = 30;


UPDATE referencia
SET equivalenteHastaYear = edad_hasta  
WHERE unidadTiempoHasta = 30;

/*

	28/05/2024 16:00
	
	31/05/2024 10:36
	
	03/06/2024 18:24
	
*/
DELIMITER ;;
DROP PROCEDURE IF EXISTS PR_FacturarOrdenExamen;
;;

DELIMITER ;;
CREATE   PROCEDURE `PR_FacturarOrdenExamen`(
 IN
	i_ventaID INT(12),
	i_presuntoDiagnostico VARCHAR(256),
	i_diagnostico VARCHAR(256),
	i_pacienteID INT(12),
	i_medicoTratanteID INT(12),
	i_medicoReferenteID INT(12),
	i_areaReferenciaHospitalID INT(12),
	i_frecuenciaExamenes VARCHAR(256),
	i_medicamentoPermanente VARCHAR(256)
)
BEGIN
		DECLARE w_id INT(12);
        DECLARE w_ordenID INT(12);
        
		DECLARE w_add_date datetime;
		DECLARE w_add_time  TIME; 
        
        DECLARE w_totalItemsRelacionados INT(12);
		DECLARE w_totalItemsFacturados INT(12);
		DECLARE w_edadActual INT(12);
		DECLARE w_genero INT(1);
		DECLARE w_unidadTiempo INT(12);
		DECLARE w_day INT(12);
		DECLARE w_detalleID INT(12);
		DECLARE w_examenID INT(12);
		DECLARE w_parametroID INT(12);
		DECLARE w_totalReferencia INT(12);
		DECLARE w_totalGenero INT(12);
		DECLARE w_totalEdad INT(12);
	    DECLARE w_referenciaID INT(12);
		DECLARE w_ambos INT(12);
		DECLARE w_dependeEdad INT(1);
		DECLARE w_dependeGenero INT(1);
		DECLARE w_dias  INT(12);
		DECLARE w_hasPefil INT(1);
		DECLARE w_totalRows INT(12);
		 
		DECLARE done INT DEFAULT FALSE;
 
		DECLARE cur CURSOR FOR 
		SELECT 	
				orden_examenes_detalle.id AS detalleID, 
				orden_examenes_detalle.defExamenID,
				parametro.id AS parametroID,
				IFNULL(parametro.dependeGenero,0) AS dependeGenero,
				IFNULL(parametro.dependeEdad,0) AS dependeEdad
		FROM 	orden_examenes_detalle 
				INNER JOIN parametro ON orden_examenes_detalle.defExamenID = parametro.defExamenID		
		WHERE ordenID = w_ordenID;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE; 
        
		SET time_zone = "-06:00";
		
		SET w_add_date = NOW(); 
		SET w_add_time  = CURTIME();
        
 
        
		SET w_edadActual = (SELECT YEAR(w_add_date) - YEAR(fechaNacimiento) FROM paciente WHERE id = i_pacienteID );
		SET w_dias = ( SELECT TIMESTAMPDIFF(DAY, fechaNacimiento,w_add_date ) FROM paciente WHERE id = i_pacienteID);
		SET w_genero = (SELECT catalogoID FROM paciente WHERE id = i_pacienteID );
		
		/*
			Edad en Años
		*/
		IF w_edadActual >= 1 THEN
			SET w_unidadTiempo = 30;
	    END IF;
		
		
		/*
			Edad en meses y dias
		*/		
		IF w_edadActual < 1 THEN
			
		 SET w_edadActual = (	SELECT DATEDIFF(w_add_date, fechaNacimiento) FROM paciente WHERE id = i_pacienteID	);
		 IF w_edadActual <= 29 THEN 
				SET w_unidadTiempo = 27;
				SET w_edadActual = ( SELECT TIMESTAMPDIFF(DAY, fechaNacimiento,w_add_date ) FROM paciente WHERE id = i_pacienteID);
			ELSE 		
				SET w_unidadTiempo = 29;
				SET w_edadActual = ( SELECT TIMESTAMPDIFF(MONTH, fechaNacimiento,w_add_date ) FROM paciente WHERE id = i_pacienteID);
			END IF;
		 
	    END IF;
 
 
 
		/*
			Validar que existe una relacion entre los items a facturar y la definicion de 
            los examenes
        */
        SET w_totalItemsFacturados = (
			SELECT COUNT(1)
            FROM venta_detalle
            WHERE ventaID = i_ventaID
        );
        
        
        SET w_totalItemsRelacionados = (
			SELECT COUNT(1)
            FROM orden_examenes_detalle
            WHERE defExamenID IN (
				SELECT defExamenID
                FROM factura_laboratorio
                WHERE estado = 1
            )
        );
        
        
			/*
				Crear la Orden 
			*/
			   INSERT INTO  orden_examenes
				( 
					fecha,
					hora,
					presuntoDiagnostico,
					diagnostico,
					pacienteID,
					medicoTratanteID,
					medicoReferenteID,
					areaReferenciaHospitalID,
					frecuenciaExamenes,
					medicamentoPermanente,
					edadActual,
					unidadTiempo
				)
				VALUES  
				( 
					w_add_date,
					w_add_time,
					i_presuntoDiagnostico,
					i_diagnostico,
					i_pacienteID,
					i_medicoTratanteID,
					i_medicoReferenteID,
					i_areaReferenciaHospitalID,
					i_frecuenciaExamenes,
					i_medicamentoPermanente,
					w_edadActual,
					w_unidadTiempo
					
				);
			   
			   
				SET w_ordenID = ( SELECT LAST_INSERT_ID() );      
                
                /*
					Insertar el detalle de ordenes
                */
                
			   INSERT INTO orden_examenes_detalle(
					ordenID,
					defExamenID, 
					fechaInicio, 
					horaInicio,
                    catalogoID
			   ) select 
					w_ordenID,
                    defExamenID,
					w_add_date,
					w_add_time,
                    1
				 FROM venta_detalle INNER JOIN factura_laboratorio
					  ON venta_detalle.itemID = factura_laboratorio.itemID
                 WHERE ventaID = i_ventaID;
                
                SET w_totalRows = (
					select 
						COUNT(1)
					 FROM venta_detalle INNER JOIN factura_laboratorio
						  ON venta_detalle.itemID = factura_laboratorio.itemID
					 WHERE ventaID = i_ventaID AND factura_laboratorio.perfilID IS NOT NULL			
				);
   
	/*
				Examenes por cada perfil
				12/07/2024
	*/			
				IF w_totalRows > 0 THEN
				   INSERT INTO orden_examenes_detalle(
						ordenID,
						defExamenID, 
						fechaInicio, 
						horaInicio,
						catalogoID
				   ) select 
						w_ordenID,
						perfil_detalle.defExamenID,
						w_add_date,
						w_add_time,
						1
					 FROM venta_detalle INNER JOIN factura_laboratorio
						  ON venta_detalle.itemID = factura_laboratorio.itemID
						  INNER JOIN perfil ON factura_laboratorio.perfilID = perfil.id
						  INNER JOIN perfil_detalle ON perfil_detalle.perfilID = perfil.id
					 WHERE ventaID = i_ventaID;				
				END IF;
				
				
   
	  OPEN cur;
	  read_loop: LOOP
		FETCH cur INTO w_detalleID,w_examenID,w_parametroID,w_dependeGenero,w_dependeEdad;
			IF done THEN
			  LEAVE read_loop;
			END IF;
		     
     
             SET w_totalReferencia = ( SELECT COUNT(1) FROM referencia  WHERE parametroID = w_parametroID );
			 SET w_referenciaID = 0;
			 
			 IF w_totalReferencia > 0 THEN
			 
			 		IF w_dependeGenero = 0 AND w_dependeEdad = 0 THEN
			
						IF w_totalReferencia = 1 THEN
							SET w_referenciaID = (
								SELECT IFNULL(id,0)
								FROM referencia 
								WHERE	parametroID = w_parametroID
								LIMIT 1
							);						
						
						END IF;
						
					END IF;
			 
 			
					IF w_dependeGenero = 1 AND w_dependeEdad = 1 THEN
						IF w_unidadTiempo = 27 THEN
							SET w_referenciaID = (
									SELECT IFNULL(id,0)
									FROM referencia 
									WHERE generoID = w_genero AND (
									   w_dias BETWEEN equivalenteDesde AND equivalenteHasta
									) AND parametroID = w_parametroID AND ( w_unidadTiempo = unidadTiempoDesde OR w_unidadTiempo = unidadTiempoHasta)
									LIMIT 1
								);						
						END IF;
						
						IF w_unidadTiempo = 29 THEN
							SET w_referenciaID = (
									SELECT IFNULL(id,0)
									FROM referencia 
									WHERE generoID = w_genero AND (
									   w_dias BETWEEN equivalenteDesde AND equivalenteHasta
									) AND parametroID = w_parametroID AND ( 27 = unidadTiempoDesde OR 27 = unidadTiempoHasta)
									LIMIT 1
								);						
						END IF;		
						
						IF w_unidadTiempo = 30 THEN
							SET w_referenciaID = (
									SELECT IFNULL(id,0)
									FROM referencia 
									WHERE generoID = w_genero AND (
									   w_edadActual BETWEEN equivalenteDesdeYear AND edad_hasta
									) AND parametroID = w_parametroID AND ( w_unidadTiempo = unidadTiempoDesde OR w_unidadTiempo = unidadTiempoHasta)
									LIMIT 1
								);						
						END IF;						

					END IF;
					
					IF w_dependeGenero = 1 AND w_dependeEdad = 0 THEN
					
						SET w_referenciaID = (
							SELECT IFNULL(id,0)
							FROM referencia 
							WHERE generoID = w_genero  AND parametroID = w_parametroID
							LIMIT 1
						);
					END IF;					
					IF w_dependeGenero = 0 AND w_dependeEdad = 1 THEN
					
						 
						IF w_unidadTiempo = 27 THEN
							SET w_referenciaID = (
									SELECT IFNULL(id,0)
									FROM referencia 
									WHERE generoID = w_genero AND (
									   w_dias BETWEEN equivalenteDesde AND equivalenteHasta
									) AND parametroID = w_parametroID AND ( w_unidadTiempo = unidadTiempoDesde OR w_unidadTiempo = unidadTiempoHasta)
									LIMIT 1
								);						
						END IF;
						
						IF w_unidadTiempo = 29 THEN
							SET w_referenciaID = (
									SELECT IFNULL(id,0)
									FROM referencia 
									WHERE generoID = w_genero AND (
									   w_dias BETWEEN equivalenteDesde AND equivalenteHasta
									) AND parametroID = w_parametroID AND ( w_unidadTiempo = unidadTiempoDesde OR w_unidadTiempo = unidadTiempoHasta)
									LIMIT 1
								);						
						END IF;		
						
						IF w_unidadTiempo = 30 THEN
							SET w_referenciaID = (
									SELECT IFNULL(id,0)
									FROM referencia 
									WHERE generoID = w_genero AND (
									   w_edadActual BETWEEN equivalenteDesdeYear AND edad_hasta
									) AND parametroID = w_parametroID AND ( w_unidadTiempo = unidadTiempoDesde OR w_unidadTiempo = unidadTiempoHasta)
									LIMIT 1
								);						
						END IF;
					END IF;		
 
			 END IF;
 	 
			IF w_referenciaID IS NULL THEN
				SET w_referenciaID = 0;
			END IF;
			
			INSERT INTO orden_examenes_parametros(
				trans_orden_detalleID, 
				defExamenID,
				parametroID,
				referenciaID
				 
				 
			)  VALUES (
				w_detalleID,
				w_examenID,
				w_parametroID,
				w_referenciaID
				 
				
			);
			 
             
	  END LOOP;
	  CLOSE cur;                 
         
      
END;

;;				


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_tecnico;
;; 

DELIMITER ;; 
CREATE  PROCEDURE SP_EDIT_tecnico(
	IN 
	 i_id	int,
	 i_nombreCompleto	varchar(256),
	 i_numeroJuntaVigilancia	varchar(256),
	 i_cargo	varchar(256),
	 i_rolID	int,
	 i_sello	varchar(256),
	 i_firmaDigital	varchar(256)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   tecnico
	 SET  
		 nombreCompleto=i_nombreCompleto,numeroJuntaVigilancia=i_numeroJuntaVigilancia,cargo=i_cargo,rolID=i_rolID,sello=i_sello,firmaDigital=i_firmaDigital
	WHERE      id = i_id;
	
	SELECT   
			id,nombreCompleto,numeroJuntaVigilancia,cargo,rolID,sello,firmaDigital
	FROM 	tecnico
	WHERE   id = i_id;

END;
 ;; 
 
 
 DELIMITER ;;    
DROP PROCEDURE IF EXISTS  SP_ADD_tecnico;
;;

DELIMITER ;;    
CREATE   PROCEDURE SP_ADD_tecnico(
	IN 
    i_id	int,
	i_nombreCompleto	varchar(256),
	i_numeroJuntaVigilancia	varchar(256),
	i_cargo	varchar(256),
	i_rolID	int,
	i_sello	varchar(256),
	i_firmaDigital	varchar(256)
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  tecnico
    ( 
		nombreCompleto,
		numeroJuntaVigilancia,
		cargo,
		rolID,
		sello,
		firmaDigital
    )
    VALUES  
    ( 
		i_nombreCompleto,
		i_numeroJuntaVigilancia,
		i_cargo,
		i_rolID,
		i_sello,
		i_firmaDigital
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id,
			nombreCompleto,
			numeroJuntaVigilancia,
			cargo,
			rolID,
			sello,
			firmaDigital
	FROM 	tecnico
	WHERE   id = w_id;
   
END;
;;

DELIMITER ;;  
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_tecnico;
;;   
 
 
DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_tecnico(
	i_filter varchar(256)
)
	BEGIN 
	SELECT ID,nombreCompleto,numeroJuntaVigilancia,cargo,rolID,sello,firmaDigital
	FROM tecnico
	WHERE nombreCompleto LIKE CONCAT('%', i_filter , '%') OR  
			numeroJuntaVigilancia LIKE CONCAT('%', i_filter , '%') OR  
			cargo LIKE CONCAT('%', i_filter , '%');  
END; 
;;   

DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_orden_examenes_detalle;
;;
 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
	
		SET time_zone = "-06:00";
		SELECT  
				
				orden_examenes_detalle.id,
				defExamenID, 
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				DATE_FORMAT(fechaInicio, "%d/%m/%Y") as fechaInicio,
				fechaFin,
				horaInicio,
				horaFin,
				fechaProceso,
				horaProceso,
				usuarioElaboroID,
				usuarioValidoID,
				CONCAT( IFNULL(TIMESTAMPDIFF(HOUR, fechaInicio,now() ),'00:00:00'),
				':',
				(IFNULL(TIMESTAMPDIFF(MINUTE, fechaInicio,now() ) ,'00:00:00')) % 60 ) as tiempoTranscurrido,
				CASE catalogoID WHEN '1' THEN 'Pendiente'
				 WHEN '35' THEN 'En proceso'
				 WHEN '36' THEN 'Pendiente de Impresion'
				END AS Estado,
				catalogoID
		FROM 	orden_examenes_detalle INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   ordenID  = i_id;
END;
 ;;
 
 
 SELECT TIMESTAMPDIFF(MIN, '2024-06-03 18:25:31',now() ) 
 
DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_BY_PARENT_ID_orden_examenes_detalle;
;;
 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_ROWS_BY_PARENT_ID_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
	
		SET time_zone = "-06:00";
		SELECT  
				
				orden_examenes_detalle.id,
				defExamenID, 
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				DATE_FORMAT(fechaInicio, "%d/%m/%Y") as fechaInicio,
				DATE_FORMAT(fechaFin, "%d/%m/%Y") as fechaFin,
				horaInicio,
				horaFin,
				DATE_FORMAT(fechaProceso, "%d/%m/%Y") as fechaProceso,
				horaProceso,
				usuarioElaboroID,
				usuarioValidoID,
				CONCAT( IFNULL(TIMESTAMPDIFF(HOUR, fechaInicioContador,now() ),'00:00:00'),
				':',
				(IFNULL(TIMESTAMPDIFF(MINUTE, fechaInicioContador,now() ) ,'00:00:00')) % 60 ) as tiempoTranscurrido,
				CASE catalogoID WHEN '1' THEN 'Pendiente'
				 WHEN '35' THEN 'En proceso'
				 WHEN '36' THEN 'Pendiente de Impresion'
				END AS Estado,
				catalogoID,
				observaciones
		FROM 	orden_examenes_detalle INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   ordenID  = i_id AND catalogoID = 36;
END;
 ;;
 
DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_EDIT_COLLECTION_orden_examenes_parametros;
;; 
 
 
DELIMITER ;; 
CREATE   PROCEDURE SP_EDIT_COLLECTION_orden_examenes_parametros(
	 
    IN i_collection JSON
)
BEGIN 

	/* Collections */
    DECLARE w_document 		VARCHAR(16000);
    DECLARE w_collection 	VARCHAR(16000);
    DECLARE w_model 		VARCHAR(16000);
    DECLARE w_parent_id 	INT(12);
    DECLARE w_action 		CHAR(1);
    
    /*Variables de trabajo del detalle*/
 	DECLARE w_id	int;
	DECLARE w_trans_orden_detalleID	int;
	DECLARE w_parametroID	int;
	DECLARE w_resultado	varchar(255);
	DECLARE w_referenciaID	int;
	DECLARE w_fueraDeRango	int;
	DECLARE w_comentarios	varchar(255);
	
     
	DECLARE w_affectedRowsDetail INT DEFAULT 0;
    
    DECLARE i INT DEFAULT 0;
    
    SELECT JSON_EXTRACT(i_collection, "$.models") 	INTO w_collection; 
	 
    
	WHILE i < JSON_LENGTH(w_collection) DO
		SELECT JSON_EXTRACT(w_collection,CONCAT('$[',i,']')) INTO w_model;
		SELECT 	
		 
			JSON_VALUE(w_model,"$.id"),
			JSON_VALUE(w_model,"$.trans_orden_detalleID"),
			JSON_VALUE(w_model,"$.parametroID"),
			JSON_VALUE(w_model,"$.resultado"),
			JSON_VALUE(w_model,"$.referenciaID"),
			JSON_VALUE(w_model,"$.fueraDeRango"),
			JSON_VALUE(w_model,"$.comentarios")
		INTO
			 
			w_id,
			w_trans_orden_detalleID,
			w_parametroID,
			w_resultado,
			w_referenciaID,
			w_fueraDeRango,
			w_comentarios;
		 
			
			
			UPDATE   orden_examenes_parametros
			SET  
				 
				resultado=w_resultado,
				comentarios=w_comentarios
			WHERE      id = w_id;
		 
				
		SELECT i + 1 INTO i;
        SELECT w_affectedRowsDetail + 1 into w_affectedRowsDetail;
		
	
        
	END WHILE;
   
	UPDATE orden_examenes_detalle
	SET catalogoID = 36
	WHERE id = w_trans_orden_detalleID;	
   
   
	SELECT w_affectedRowsDetail  as affectedRows;
   
END;
;; 

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_orden_examenes_parametros;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_orden_examenes_parametros( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				orden_examenes_parametros.id,
				trans_orden_detalleID,
				orden_examenes_parametros.parametroID,
				nombreParametro,
				IFNULL(resultado,'') AS resultado,
				IFNULL(minimo,'') AS minimo,
				IFNULL(maximo,'') AS maximo,
				IFNULL(referenciaID,0) AS referenciaID,
				IFNULL(fueraDeRango,'0') AS fueraDeRango,
				IFNULL(comentarios,'') AS comentarios,
				IFNULL(unidadMedida,'') AS unidadMedida,
				IFNULL(elementTypeID,1) AS elementType,
				definicion_examen.id AS examenID,
				nombreParametro as 'columnFilter',
				'resultado' as 'columnName',
				1 as dynamicDataGrid,
				subGrupoID,
				operador
		FROM 	orden_examenes_parametros INNER JOIN parametro   ON 
				orden_examenes_parametros.parametroID = parametro.id
				LEFT JOIN referencia ON orden_examenes_parametros.referenciaID = referencia.id
				LEFT JOIN unidad_medida ON unidad_medida.id = parametro.unidadMedidaID
				INNER JOIN definicion_examen ON parametro.defExamenID = definicion_examen.id
		WHERE   trans_orden_detalleID = i_id
		ORDER BY parametro.orden, subGrupoID;
END;
;;



DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PRINT_ID_orden_examenes_detalle;
;;
 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PRINT_ID_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
	
		SET time_zone = "-06:00";
		SELECT  
				
				orden_examenes_detalle.id,
				defExamenID, 
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				DATE_FORMAT(fechaInicio, "%d/%m/%Y") as fechaInicio,
				fechaFin,
				horaInicio,
				horaFin,
				fechaProceso,
				horaProceso,
				usuarioElaboroID,
				usuarioValidoID,
				CONCAT( IFNULL(TIMESTAMPDIFF(HOUR, fechaInicio,now() ),'00:00:00'),
				':',
				(IFNULL(TIMESTAMPDIFF(MINUTE, fechaInicio,now() ) ,'00:00:00')) % 60 ) as tiempoTranscurrido,
				CASE catalogoID WHEN '1' THEN 'Pendiente'
				 WHEN '35' THEN 'En proceso'
				 WHEN '36' THEN 'Pendiente de Impresion'
				END AS Estado,
				catalogoID
		FROM 	orden_examenes_detalle INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   ordenID  = i_id AND catalogoID = 36;
END;
 ;;
 
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_definicion_examen;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_definicion_examen()
	BEGIN 
	SELECT definicion_examen.id,nombreExamen,categoriaID,nombreCategoria
	FROM definicion_examen INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id;
END; 
 
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_grupo;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_grupo(
	IN 
    i_id	int,
i_nombreGrupo	varchar(256)
)
BEGIN 

 	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  grupo
    ( 
       
		nombreGrupo
    )
    VALUES  
    ( 
		 
		i_nombreGrupo
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id,
nombreGrupo
	FROM 	grupo
	WHERE   id = w_id;
   
END;
;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_grupo;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_grupo(
	IN 
	 i_id	int,i_nombreGrupo	varchar(256)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   grupo
	 SET  
		id=i_id,nombreGrupo=i_nombreGrupo
	WHERE      id = i_id;

END;
;; 

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_grupo;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_grupo
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM grupo
WHERE      id = i_id;

 END; 

;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_grupo;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_grupo( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombreGrupo
		FROM 	grupo
		WHERE   id = i_id;
END;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_grupo;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_grupo( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombreGrupo
		FROM 	grupo
		WHERE   id = i_id;
END;

;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_grupo;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_grupo()
	BEGIN 
	SELECT id,nombreGrupo
	FROM grupo;
END; 
 
;; 

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_grupo;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_grupo(
	i_filter varchar(256)
)
	BEGIN 
	SELECT id,nombreGrupo
	FROM grupo
	WHERE nombreGrupo LIKE CONCAT('%', i_filter , '%');
END; 

;;


DELIMITER ;;
 DROP PROCEDURE IF EXISTS  SP_ADD_parametro;
 ;;
 
DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_parametro(
	IN 
    i_id	int,
	i_nombreParametro	varchar(255),
	i_codigoParametroDisposivito	varchar(255),
	i_defExamenID	int,
	i_factor	int,
	i_unidadMedidaID	int,
	i_elementTypeID	int,
	i_orden	int,
	i_dependeGenero	int,
	i_dependeEdad	int,
	i_subGrupo int
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
	
    INSERT INTO  parametro
    ( 
  
		nombreParametro,
		codigoParametroDisposivito,
		defExamenID,
		factor,
		unidadMedidaID,
		elementTypeID,
		orden,
		dependeGenero,
		dependeEdad,
		subGrupoID
    )
    VALUES  
    ( 
		 
		UPPER(i_nombreParametro),
		i_codigoParametroDisposivito,
		i_defExamenID,
		i_factor,
		i_unidadMedidaID,
		1,
		i_orden,
		i_dependeGenero,
		i_dependeEdad,
		i_subGrupo
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
		id,
		nombreParametro,
		codigoParametroDisposivito,
		defExamenID,
		factor,
		unidadMedidaID,
		elementTypeID,
		orden,
		dependeGenero,
		dependeEdad,
		subGrupoID
	FROM 	parametro
	WHERE   id = w_id;
   
END;

DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_EDIT_parametro;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_parametro(
	IN 
	 i_id	int,
	 i_nombreParametro	varchar(255),
	 i_codigoParametroDisposivito	varchar(255),
	 i_defExamenID	int,
	 i_factor	int,
	 i_unidadMedidaID	int,
	 i_elementTypeID	int,
	 i_orden	int,
	 i_dependeGenero	int,
	 i_dependeEdad	int,
	 i_subGrupo int
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   parametro
	 SET  
		id=i_id,
		nombreParametro= UPPER(i_nombreParametro),
		codigoParametroDisposivito=i_codigoParametroDisposivito,
		defExamenID=i_defExamenID,
		factor=i_factor,
		unidadMedidaID=i_unidadMedidaID,
		elementTypeID=i_elementTypeID,
		orden=i_orden,
		dependeGenero=i_dependeGenero,
		dependeEdad=i_dependeEdad,
		subGrupoID = i_subGrupo 
	WHERE      id = i_id;
	
	SELECT   
			id,
			nombreParametro,
			codigoParametroDisposivito,
			defExamenID,
			factor,
			unidadMedidaID,
			elementTypeID,
			orden,
			dependeGenero,
			dependeEdad,
			subGrupoID
	FROM 	parametro
	WHERE   id = i_id;

END;
;; 


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_parametro;
;;
 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_ROW_parametro( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,
				nombreParametro,
				codigoParametroDisposivito,
				defExamenID,
				factor,
				unidadMedidaID,
				elementTypeID,
				orden,
				dependeGenero,
				dependeEdad,
				subGrupoID
		FROM 	parametro
		WHERE   id = i_id;
END;
;; 

DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_EDIT_COLLECTION_orden_examenes_detalle;
;; 
 
DELIMITER ;; 
CREATE   PROCEDURE SP_EDIT_COLLECTION_orden_examenes_detalle(
	 
    IN i_collection JSON
)
BEGIN 

	/* Collections */
    DECLARE w_document 		VARCHAR(32000);
    DECLARE w_collection 	VARCHAR(32000);
    DECLARE w_model 		VARCHAR(32000);
    DECLARE w_parent_id 	INT(12);
    DECLARE w_action 		CHAR(1);
    
    /*Variables de trabajo del detalle*/
 	DECLARE w_id	int;
	DECLARE w_ordenID	int;
	DECLARE w_defExamenID	int;
	DECLARE w_fechaInicio	date;
	DECLARE w_fechaFin	date;
	DECLARE w_horaInicio	time;
	DECLARE w_horaFin	time;
	DECLARE w_fechaProceso	date;
	DECLARE w_horaProceso	time;
	DECLARE w_catalogoID	int;
	DECLARE w_usuarioElaboroID	int;
	DECLARE w_usuarioValidoID	int;
     
	DECLARE w_affectedRowsDetail INT DEFAULT 0;
    
    DECLARE i INT DEFAULT 0;
    
    SELECT JSON_EXTRACT(i_collection, "$.models") 	INTO w_collection; 
 
    
	WHILE i < JSON_LENGTH(w_collection) DO
		SELECT JSON_EXTRACT(w_collection,CONCAT('$[',i,']')) INTO w_model;
		SELECT 	
			 
			JSON_VALUE(w_model,"$.id"),
			JSON_VALUE(w_model,"$.ordenID"),
			JSON_VALUE(w_model,"$.defExamenID"),
			JSON_VALUE(w_model,"$.fechaInicio"),
			JSON_VALUE(w_model,"$.fechaFin"),
			JSON_VALUE(w_model,"$.horaInicio"),
			JSON_VALUE(w_model,"$.horaFin"),
			JSON_VALUE(w_model,"$.fechaProceso"),
			JSON_VALUE(w_model,"$.horaProceso"),
			JSON_VALUE(w_model,"$.catalogoID"),
			JSON_VALUE(w_model,"$.usuarioElaboroID"),
			JSON_VALUE(w_model,"$.usuarioValidoID"),
			JSON_VALUE(w_model,"$.catalogoID")
		INTO
 
			w_id,
			w_ordenID,
			w_defExamenID,
			w_fechaInicio,
			w_fechaFin,
			w_horaInicio,
			w_horaFin,
			w_fechaProceso,
			w_horaProceso,
			w_catalogoID,
			w_usuarioElaboroID,
			w_usuarioValidoID,
			w_catalogoID;
		 
			UPDATE   orden_examenes_detalle
			SET  
				fechaInicio=w_fechaInicio,
				fechaFin=w_fechaFin,
				horaInicio=w_horaInicio,
				horaFin=w_horaFin,
				fechaProceso=w_fechaProceso,
				horaProceso=w_horaProceso,
				usuarioElaboroID=w_usuarioElaboroID,
				usuarioValidoID=w_usuarioValidoID,
				catalogoID=w_catalogoID
			WHERE      id = w_id;
		 
				
		SELECT i + 1 INTO i;
        SELECT w_affectedRowsDetail + 1 into w_affectedRowsDetail;
        
	END WHILE;
   
	SELECT w_affectedRowsDetail  as affectedRows;
   
END;

;;
 
 
 
DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_orden_examenes_detalle;
;;
 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
	
		SET time_zone = "-06:00";
		SELECT  
				
				orden_examenes_detalle.id,
				defExamenID, 
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				DATE_FORMAT(fechaInicio, "%d/%m/%Y") as fechaInicio,
				fechaFin,
				horaInicio,
				horaFin,
				fechaProceso,
				horaProceso,
				usuarioElaboroID,
				usuarioValidoID,
				CONCAT( IFNULL(TIMESTAMPDIFF(HOUR, fechaInicioContador,now() ),'00:00:00'),
				':',
				(IFNULL(TIMESTAMPDIFF(MINUTE, fechaInicioContador,now() ) ,'00:00:00')) % 60 ) as tiempoTranscurrido,
				CASE catalogoID WHEN '1' THEN 'Pendiente'
				 WHEN '35' THEN 'En proceso'
				 WHEN '36' THEN 'Pendiente de Impresion'
				END AS Estado,
				catalogoID
		FROM 	orden_examenes_detalle INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   ordenID  = i_id;
END;
 ;;
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_mfr_rol;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_mfr_rol(
	IN 
    i_id	int,
i_rol_perfil	varchar(60),
i_rol_tipo	char(1),
i_rol_acceso_total	tinyint(1),
i_rol_fecha_opr	datetime,
i_rol_usuario_opr	int
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  mfr_rol
    ( 
        
		rol_perfil,
		rol_tipo,
		rol_acceso_total,
		rol_fecha_opr,
		rol_usuario_opr
    )
    VALUES  
    ( 
		 
		i_rol_perfil,
		i_rol_tipo,
		i_rol_acceso_total,
		i_rol_fecha_opr,
		i_rol_usuario_opr
    );
   
   
   SELECT LAST_INSERT_ID() AS lastInserted;
   
END;
;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_ORDER_COLLECTION_parametro;
;;	

DELIMITER ;;
CREATE   PROCEDURE SP_ORDER_COLLECTION_parametro(
	 
    IN i_collection JSON
)
BEGIN 

	/* Collections */
    DECLARE w_document 		VARCHAR(32000);
    DECLARE w_collection 	VARCHAR(32000);
    DECLARE w_model 		VARCHAR(32000);
    DECLARE w_parent_id 	INT(12);
    DECLARE w_action 		CHAR(1);
    
    /*Variables de trabajo del detalle*/
 	DECLARE w_id	int;
 	DECLARE w_orden	int;
	DECLARE w_nombreParametro	varchar(255);
	DECLARE w_codigoParametroDisposivito	varchar(255);
	DECLARE w_defExamenID	int;
	DECLARE w_factor	int;
	DECLARE w_unidadMedidaID	int;
	DECLARE w_elementTypeID	int;
     
	DECLARE w_affectedRowsDetail INT DEFAULT 0;
    
    DECLARE i INT DEFAULT 0;
    
    SELECT JSON_EXTRACT(i_collection, "$.models") 	INTO w_collection; 
 
    
	WHILE i < JSON_LENGTH(w_collection) DO
		SELECT JSON_EXTRACT(w_collection,CONCAT('$[',i,']')) INTO w_model;
		SELECT 	
			JSON_VALUE(w_model,"$.id"),
			JSON_VALUE(w_model,"$.nombreParametro"),
			JSON_VALUE(w_model,"$.codigoParametroDisposivito"),
			JSON_VALUE(w_model,"$.defExamenID"),
			JSON_VALUE(w_model,"$.factor"),
			JSON_VALUE(w_model,"$.unidadMedidaID"),
			JSON_VALUE(w_model,"$.elementTypeID"),
			JSON_VALUE(w_model,"$.orden")
		INTO
			w_id,
			w_nombreParametro,
			w_codigoParametroDisposivito,
			w_defExamenID,
			w_factor,
			w_unidadMedidaID,
			w_elementTypeID,
			w_orden;
	 
			UPDATE   parametro
			SET  orden = w_orden
 			WHERE      id = w_id;
 
				
		SELECT i + 1 INTO i;
        SELECT w_affectedRowsDetail + 1 into w_affectedRowsDetail;
        
	END WHILE;
   
	SELECT w_affectedRowsDetail  as affectedRows;
   
END;
;;	



DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_usuario;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_usuario(
	IN 
    i_id	int,
i_nombres	varchar(255),
i_apellidos	varchar(255),
i_rol	int,
i_clave	int
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  usuario
    ( 
		nombres,
		apellidos,
		rol,
		clave
    )
    VALUES  
    ( 
		 
		i_nombres,
		i_apellidos,
		i_rol,
		i_clave
    );
   
   
   SELECT LAST_INSERT_ID() AS lastInserted;
   
END;
;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_usuario;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_usuario(
	IN 
	 i_id	int,i_nombres	varchar(255),i_apellidos	varchar(255),i_rol	int,i_clave	int
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   usuario
	 SET  
		id=i_id,nombres=i_nombres,apellidos=i_apellidos,rol=i_rol,clave=i_clave
	WHERE      id = i_id;

END;
;; 


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_usuario;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_usuario( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombres,apellidos,rol,clave
		FROM 	usuario
		WHERE   id = i_id;
END;

;;
 
		
		
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_usuario;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_usuario()
	BEGIN 
	SELECT id,nombres,apellidos,rol,clave
	FROM usuario;
END; 
 
;; 		


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_usuario;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_usuario(
	i_filter varchar(256)
)
	BEGIN 
	SELECT id,nombres,apellidos,rol,clave
	FROM usuario
	WHERE nombres LIKE CONCAT('%', i_filter , '%') OR  
apellidos LIKE CONCAT('%', i_filter , '%');
END; 

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_mfr_acceso;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_mfr_acceso(
	IN 
    i_id	int,
i_acc_rol	int,
i_acc_opcion	int,
i_acc_escritura	int
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  mfr_acceso
    ( 
        
		acc_rol,
		acc_opcion,
		acc_escritura
    )
    VALUES  
    ( 
		 
		i_acc_rol,
		i_acc_opcion,
		i_acc_escritura
    );
   
   
   SELECT LAST_INSERT_ID() AS lastInserted;
   
END;
;;
 
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_mfr_acceso;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_mfr_acceso
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM mfr_acceso
WHERE      id = i_id;

 END; 

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_mfr_acceso;
;;
 
DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_mfr_acceso( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,acc_rol,opc_padre,acc_escritura
		FROM 	mfr_acceso
		WHERE   acc_rol = i_id;
END;
;; 



DELIMITER ;;
DROP PROCEDURE IF EXISTS PR_ActualizarPasoUno;
;;


DELIMITER ;; 
CREATE  PROCEDURE `PR_ActualizarPasoUno`(
   i_ordenID INT(12)
)
BEGIN
	DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
	DECLARE w_add_counter DATETIME;
	SET time_zone = "-06:00";
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	SET w_add_counter = NOW(); 

/*
	estado 1 = Facturado
    estado 2 = En proceso
    estado 3 = En Impresion
*/
	UPDATE 		orden_examenes
    SET 		estado = 2
    WHERE 		id = i_ordenID;

	UPDATE orden_examenes_detalle
	SET catalogoID = 35,
		fechaInicio = w_add_date,
		fechaInicioContador = w_add_counter,
		horaInicio = w_add_time
	WHERE ordenID = i_ordenID;

END



DELIMITER ;;
DROP PROCEDURE IF EXISTS PR_MuestrasPorOrdenes;
;;


DELIMITER ;;
CREATE   PROCEDURE `PR_MuestrasPorOrdenes`(
 i_ordenID INT(12)
)
BEGIN

		SELECT  orden_examenes.id,
				nombreMuestra,
                concat(nombresPaciente,' ' , apellidosPaciente) AS nombrePaciente,
                DATE_FORMAT(fecha, "%d/%m/%Y") as fecha,
                hora
		FROM muestra INNER JOIN categoria_muestra 
				ON muestra.id = categoria_muestra.muestraID
				INNER JOIN categoria ON categoria_muestra.categoriaID = categoria.id
				INNER JOIN definicion_examen ON definicion_examen.categoriaID = categoria.id
				INNER JOIN orden_examenes_detalle ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN orden_examenes ON orden_examenes_detalle.ordenID = orden_examenes.id
                INNER JOIN paciente ON orden_examenes.pacienteID = paciente.id
		WHERE orden_examenes.id = i_ordenID;

END;
;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS PR_MuestrasPorOrdenes;
;;


DELIMITER ;;
CREATE   PROCEDURE `PR_MuestrasPorOrdenes`(
 i_ordenID INT(12)
)
BEGIN

		SELECT  DISTINCT nombreMuestra,
				orden_examenes.id,
                concat(nombresPaciente,' ' , apellidosPaciente) AS nombrePaciente,
                DATE_FORMAT(fecha, "%d/%m/%Y") as fecha,
                hora
		FROM muestra INNER JOIN categoria_muestra 
				ON muestra.id = categoria_muestra.muestraID
				INNER JOIN categoria ON categoria_muestra.categoriaID = categoria.id
				INNER JOIN definicion_examen ON definicion_examen.categoriaID = categoria.id
				INNER JOIN orden_examenes_detalle ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN orden_examenes ON orden_examenes_detalle.ordenID = orden_examenes.id
                INNER JOIN paciente ON orden_examenes.pacienteID = paciente.id
		WHERE orden_examenes.id = i_ordenID;

END;
;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS PR_MuestrasPorOrdenesBacter;
;;


DELIMITER ;;
CREATE   PROCEDURE `PR_MuestrasPorOrdenesBacter`(
 i_ordenID INT(12)
)
BEGIN

		SELECT  nombreExamen,
				nombreMuestra,
				orden_examenes.id,
                concat(nombresPaciente,' ' , apellidosPaciente) AS nombrePaciente,
                DATE_FORMAT(fecha, "%d/%m/%Y") as fecha,
                hora
		FROM muestra INNER JOIN categoria_muestra 
				ON muestra.id = categoria_muestra.muestraID
				INNER JOIN categoria ON categoria_muestra.categoriaID = categoria.id
				INNER JOIN definicion_examen ON definicion_examen.categoriaID = categoria.id
				INNER JOIN orden_examenes_detalle ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN orden_examenes ON orden_examenes_detalle.ordenID = orden_examenes.id
                INNER JOIN paciente ON orden_examenes.pacienteID = paciente.id
		WHERE orden_examenes.id = i_ordenID;

END;
;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_orden_examenes_detalle;
;; 
 
DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_ROW_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				orden_examenes_detalle.id,
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				ordenID,
				defExamenID,
				fechaInicio,
				fechaFin,
				horaInicio,
				horaFin,
				fechaProceso,
				horaProceso,
				catalogoID,
				usuarioElaboroID,
				usuarioValidoID,
				observaciones
		FROM 	orden_examenes_detalle 
				INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON  categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   orden_examenes_detalle.id = i_id;
END;
;; 



--27/07/2024
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_definicion_examen;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_definicion_examen(
	IN 
    i_id	int,
	i_nombreExamen	varchar(255),
	i_categoriaID	int
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
	DECLARE w_examenID INT(12);
	DECLARE w_itemID INT(12);
	
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  definicion_examen
    ( 
        
		nombreExamen,
		categoriaID
    )
    VALUES  
    ( 
		
		i_nombreExamen,
		i_categoriaID
    );
   
   
  SET w_examenID = ( SELECT LAST_INSERT_ID() );
   
   
     INSERT INTO  item
    ( 
		descripcion,
		catalogoID,
		cuentaID,
		areaID,
		unidadMedidaID
    )
    VALUES  
    ( 
		i_nombreExamen,
		1,
		1,
		16,
		1
    );
   
   
	SET w_itemID = ( SELECT LAST_INSERT_ID() );
	
	INSERT INTO  factura_laboratorio
    ( 
        
		defExamenID,
		perfilID,
		itemID,
		estado
    )
    VALUES  
    ( 
		 
		w_examenID,
		NULL,
		w_itemID,
		1
    );
   
END;
;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_ADD_item;
;;


DELIMITER ;;
CREATE   PROCEDURE SP_ADD_item(
	IN 
    i_ID	int,
	i_descripcion	varchar(256),
	i_catalogoID	int,
	i_cuentaID	int,
	i_areaID	int,
	i_unidadMedidaID	int
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  item
    ( 
		descripcion,
		catalogoID,
		cuentaID,
		areaID,
		unidadMedidaID
    )
    VALUES  
    ( 
		i_descripcion,
		i_catalogoID,
		i_cuentaID,
		i_areaID,
		i_unidadMedidaID
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
		descripcion,
		catalogoID,
		cuentaID,
		areaID,
		unidadMedidaID
	FROM 	item
	WHERE   id = w_id;
   
END;
;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_perfil;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_perfil(
	IN 
    i_id	int,
	i_nombrePerfil	varchar(255),
	i_precio	decimal(14,4)
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
	DECLARE w_perfilID INT(12);
	DECLARE w_itemID INT(12);
	
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  perfil
    ( 
        
		nombrePerfil,
		precio
    )
    VALUES  
    ( 
			
		i_nombrePerfil,
		i_precio
    );
   
   
    SET w_perfilID = ( SELECT LAST_INSERT_ID() );
   
   
     INSERT INTO  item
    ( 
		descripcion,
		catalogoID,
		cuentaID,
		areaID,
		unidadMedidaID
    )
    VALUES  
    ( 
		i_nombrePerfil,
		1,
		1,
		16,
		1
    );
	SET w_itemID = ( SELECT LAST_INSERT_ID() );
	
	INSERT INTO  factura_laboratorio
    ( 
        
		defExamenID,
		perfilID,
		itemID,
		estado
    )
    VALUES  
    ( 
		 
		NULL,
		w_perfilID,
		w_itemID,
		1
    );
   
END;
;;

 DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_perfil_detalle;
;; 
 
 
DELIMITER ;;  
CREATE   PROCEDURE SP_ADD_perfil_detalle(
	IN 
    i_id	int,
	i_perfilID	int,
	i_defExamenID	int
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  perfil_detalle
    ( 
      
		perfilID,
		defExamenID
    )
    VALUES  
    ( 
	 
		i_perfilID,
		i_defExamenID
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id,
			perfilID,
			defExamenID
	FROM 	perfil_detalle
	WHERE   id = w_id;
   
END;
;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_perfil;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_perfil(
	IN 
    i_id	int,
	i_nombrePerfil	varchar(255),
	i_precio	decimal(14,4)
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
	DECLARE w_perfilID INT(12);
	DECLARE w_itemID INT(12);
	
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  perfil
    ( 
        
		nombrePerfil,
		precio
    )
    VALUES  
    ( 
			
		i_nombrePerfil,
		i_precio
    );
   
   
    SET w_perfilID = ( SELECT LAST_INSERT_ID() );
   
   
     INSERT INTO  item
    ( 
		descripcion,
		catalogoID,
		cuentaID,
		areaID,
		unidadMedidaID
    )
    VALUES  
    ( 
		i_nombrePerfil,
		1,
		1,
		16,
		1
    );
	SET w_itemID = ( SELECT LAST_INSERT_ID() );
	
	INSERT INTO  factura_laboratorio
    ( 
        
		defExamenID,
		perfilID,
		itemID,
		estado
    )
    VALUES  
    ( 
		 
		NULL,
		w_perfilID,
		w_itemID,
		1
    );
   
END;
;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_EDIT_perfil;
;;

 DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_perfil(
	IN 
	 i_id	int,i_nombrePerfil	varchar(255),i_precio	decimal(14,4)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
	DECLARE w_itemID INT(12);
	
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	UPDATE   perfil
	 SET  
		 nombrePerfil=i_nombrePerfil,precio=i_precio
	WHERE      id = i_id;
	
	
	SET w_itemID = (
		SELECT itemID 
		FROM  factura_laboratorio 
		WHERE perfilID = i_id
	);
	
	UPDATE item 
	SET descripcion = i_nombrePerfil
	WHERE id = w_itemID;
	
	SELECT   
			id,nombrePerfil,precio
	FROM 	perfil
	WHERE   id = i_id;

END;
;;




DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_definicion_examen;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_definicion_examen(
	IN 
	 i_id	int,
	 i_nombreExamen	varchar(255),
	 i_categoriaID	int,
	 i_examenEspecial int
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
	DECLARE w_itemID INT(12);
    
	SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   definicion_examen
	 SET  
		nombreExamen=i_nombreExamen,categoriaID=i_categoriaID
	WHERE      id = i_id;
	
	SET w_itemID = (
		SELECT itemID 
		FROM  factura_laboratorio 
		WHERE defExamenID = i_id
	);
	
	UPDATE item 
	SET descripcion = i_nombreExamen
	WHERE id = w_itemID;	

END;
;; 		


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_BY_PARENT_ID_orden_examenes_detalle;
;;
 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_ROWS_BY_PARENT_ID_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
	
		SET time_zone = "-06:00";
		SELECT  
				
				orden_examenes_detalle.id,
				defExamenID, 
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				DATE_FORMAT(fechaInicio, "%d/%m/%Y") as fechaInicio,
				DATE_FORMAT(fechaFin, "%d/%m/%Y") as fechaFin,
				horaInicio,
				horaFin,
				DATE_FORMAT(fechaProceso, "%d/%m/%Y") as fechaProceso,
				horaProceso,
				usuarioElaboroID,
				usuarioValidoID,
				CONCAT( IFNULL(TIMESTAMPDIFF(HOUR, fechaInicioContador,now() ),'00:00:00'),
				':',
				(IFNULL(TIMESTAMPDIFF(MINUTE, fechaInicioContador,now() ) ,'00:00:00')) % 60 ) as tiempoTranscurrido,
				CASE catalogoID WHEN '1' THEN 'Pendiente'
				 WHEN '35' THEN 'En proceso'
				 WHEN '36' THEN 'Pendiente de Impresion'
				END AS Estado,
				catalogoID,
				observaciones,
				examenEspecial
		FROM 	orden_examenes_detalle INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   ordenID  = i_id AND catalogoID = 36;
END;
 ;;
 
 
DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_orden_examenes_detalle;
;;
 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
	
		SET time_zone = "-06:00";
		SELECT  
				
				orden_examenes_detalle.id,
				defExamenID, 
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				DATE_FORMAT(fechaInicio, "%d/%m/%Y") as fechaInicio,
				DATE_FORMAT(fechaFin, "%d/%m/%Y") as fechaFin,
				horaInicio,
				horaFin,
				DATE_FORMAT(fechaProceso, "%d/%m/%Y") as fechaProceso,
				horaProceso,
				usuarioElaboroID,
				usuarioValidoID,
				CONCAT( IFNULL(TIMESTAMPDIFF(HOUR, fechaInicioContador,now() ),'00:00:00'),
				':',
				(IFNULL(TIMESTAMPDIFF(MINUTE, fechaInicioContador,now() ) ,'00:00:00')) % 60 ) as tiempoTranscurrido,
				CASE catalogoID WHEN '1' THEN 'Pendiente'
				 WHEN '35' THEN 'En proceso'
				 WHEN '36' THEN 'Pendiente de Impresion'
				END AS Estado,
				catalogoID
		FROM 	orden_examenes_detalle INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   ordenID  = i_id;
END;
 ;;
 
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_orden_examenes_detalle;
;; 
 
DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_ROW_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				orden_examenes_detalle.id,
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				ordenID,
				defExamenID,
				DATE_FORMAT(fechaInicio, "%d/%m/%Y") as fechaInicio,
				DATE_FORMAT(fechaFin, "%d/%m/%Y") as fechaFin,
				horaInicio,
				horaFin,
				DATE_FORMAT(fechaProceso, "%d/%m/%Y") as fechaProceso,
				horaProceso,
				catalogoID,
				usuarioElaboroID,
				usuarioValidoID,
				observaciones
		FROM 	orden_examenes_detalle 
				INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON  categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   orden_examenes_detalle.id = i_id;
END;
;; 


DELIMITER ;;
DROP PROCEDURE IF EXISTS PR_MuestrasPorOrdenesCategoria;
;;


DELIMITER ;;
CREATE   PROCEDURE `PR_MuestrasPorOrdenesCategoria`(
 i_ordenID INT(12),
 i_categoriaID INT(12)
)
BEGIN

		SELECT  nombreExamen,
				nombreMuestra,
				orden_examenes.id,
                concat(nombresPaciente,' ' , apellidosPaciente) AS nombrePaciente,
                DATE_FORMAT(fecha, "%d/%m/%Y") as fecha,
                hora
		FROM muestra INNER JOIN categoria_muestra 
				ON muestra.id = categoria_muestra.muestraID
				INNER JOIN categoria ON categoria_muestra.categoriaID = categoria.id
				INNER JOIN definicion_examen ON definicion_examen.categoriaID = categoria.id
				INNER JOIN orden_examenes_detalle ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN orden_examenes ON orden_examenes_detalle.ordenID = orden_examenes.id
                INNER JOIN paciente ON orden_examenes.pacienteID = paciente.id
		WHERE orden_examenes.id = i_ordenID AND categoria.id = i_categoriaID;

END;
;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_EDIT_COLLECTION_orden_examenes_parametros;
;; 
 
 
DELIMITER ;; 
CREATE   PROCEDURE SP_EDIT_COLLECTION_orden_examenes_parametros(
	 
    IN i_collection JSON
)
BEGIN 

	/* Collections */
    DECLARE w_document 		TEXT;
    DECLARE w_collection 	TEXT;
    DECLARE w_model 		TEXT;
    DECLARE w_parent_id 	INT(12);
    DECLARE w_action 		CHAR(1);
    
    /*Variables de trabajo del detalle*/
 	DECLARE w_id	int;
	DECLARE w_trans_orden_detalleID	int;
	DECLARE w_parametroID	int;
	DECLARE w_resultado	varchar(255);
	DECLARE w_referenciaID	int;
	DECLARE w_fueraDeRango	int;
	DECLARE w_comentarios	varchar(255);
	
     
	DECLARE w_affectedRowsDetail INT DEFAULT 0;
    
    DECLARE i INT DEFAULT 0;
    
    SELECT JSON_EXTRACT(i_collection, "$.models") 	INTO w_collection; 
	 
    
	WHILE i < JSON_LENGTH(w_collection) DO
		SELECT JSON_EXTRACT(w_collection,CONCAT('$[',i,']')) INTO w_model;
		SELECT 	
		 
			JSON_VALUE(w_model,"$.id"),
			JSON_VALUE(w_model,"$.trans_orden_detalleID"),
			JSON_VALUE(w_model,"$.parametroID"),
			JSON_VALUE(w_model,"$.resultado"),
			JSON_VALUE(w_model,"$.referenciaID"),
			JSON_VALUE(w_model,"$.fueraDeRango"),
			JSON_VALUE(w_model,"$.comentarios")
		INTO
			 
			w_id,
			w_trans_orden_detalleID,
			w_parametroID,
			w_resultado,
			w_referenciaID,
			w_fueraDeRango,
			w_comentarios;
		 
			
			
			UPDATE   orden_examenes_parametros
			SET  
				 
				resultado=w_resultado,
				comentarios=w_comentarios
			WHERE      id = w_id;
		 
				
		SELECT i + 1 INTO i;
        SELECT w_affectedRowsDetail + 1 into w_affectedRowsDetail;
		
	
        
	END WHILE;
   
	UPDATE orden_examenes_detalle
	SET catalogoID = 36
	WHERE id = w_trans_orden_detalleID;	
   
   
	SELECT w_affectedRowsDetail  as affectedRows;
   
END;
;; 


DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_EDIT_COLLECTION_orden_examenes_detalle;
;; 
 
DELIMITER ;; 
CREATE   PROCEDURE SP_EDIT_COLLECTION_orden_examenes_detalle(
	 
    IN i_collection JSON
)
BEGIN 

	/* Collections */
    DECLARE w_document 		LONGTEXT;
    DECLARE w_collection 	LONGTEXT;
    DECLARE w_model 		LONGTEXT;
    DECLARE w_parent_id 	INT(12);
    DECLARE w_action 		CHAR(1);
    
    /*Variables de trabajo del detalle*/
 	DECLARE w_id	int;
	DECLARE w_ordenID	int;
	DECLARE w_defExamenID	int;
	DECLARE w_fechaInicio	date;
	DECLARE w_fechaFin	date;
	DECLARE w_horaInicio	time;
	DECLARE w_horaFin	time;
	DECLARE w_fechaProceso	date;
	DECLARE w_horaProceso	time;
	DECLARE w_catalogoID	int;
	DECLARE w_usuarioElaboroID	int;
	DECLARE w_usuarioValidoID	int;
	DECLARE w_observaciones VARCHAR(256);
     
	DECLARE w_affectedRowsDetail INT DEFAULT 0;
    
    DECLARE i INT DEFAULT 0;
    
    SELECT JSON_EXTRACT(i_collection, "$.models") 	INTO w_collection; 
 
    
	WHILE i < JSON_LENGTH(w_collection) DO
		SELECT JSON_EXTRACT(w_collection,CONCAT('$[',i,']')) INTO w_model;
		SELECT 	
			 
			JSON_VALUE(w_model,"$.id"),
			JSON_VALUE(w_model,"$.ordenID"),
			JSON_VALUE(w_model,"$.defExamenID"),
			JSON_VALUE(w_model,"$.fechaInicio"),
			JSON_VALUE(w_model,"$.fechaFin"),
			JSON_VALUE(w_model,"$.horaInicio"),
			JSON_VALUE(w_model,"$.horaFin"),
			JSON_VALUE(w_model,"$.fechaProceso"),
			JSON_VALUE(w_model,"$.horaProceso"),
			JSON_VALUE(w_model,"$.catalogoID"),
			JSON_VALUE(w_model,"$.usuarioElaboroID"),
			JSON_VALUE(w_model,"$.usuarioValidoID"),
			JSON_VALUE(w_model,"$.observaciones")
		INTO
 
			w_id,
			w_ordenID,
			w_defExamenID,
			w_fechaInicio,
			w_fechaFin,
			w_horaInicio,
			w_horaFin,
			w_fechaProceso,
			w_horaProceso,
			w_catalogoID,
			w_usuarioElaboroID,
			w_usuarioValidoID,
			w_observaciones;
		 
			UPDATE   orden_examenes_detalle
			SET  
				fechaInicio=w_fechaInicio,
				fechaFin=w_fechaFin,
				horaInicio=w_horaInicio,
				horaFin=w_horaFin,
				fechaProceso=w_fechaProceso,
				horaProceso=w_horaProceso,
				usuarioElaboroID=w_usuarioElaboroID,
				usuarioValidoID=w_usuarioValidoID,
				catalogoID=w_catalogoID,
				observaciones = w_observaciones
			WHERE      id = w_id;
		 
				
		SELECT i + 1 INTO i;
        SELECT w_affectedRowsDetail + 1 into w_affectedRowsDetail;
        
	END WHILE;
   
	SELECT w_affectedRowsDetail  as affectedRows;
   
END;

;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_EDIT_COLLECTION_orden_examenes_parametros;
;; 
 
 
DELIMITER ;; 
CREATE   PROCEDURE SP_EDIT_COLLECTION_orden_examenes_parametros(
	 
    IN i_collection JSON
)
BEGIN 

	/* Collections */
    DECLARE w_document 		TEXT;
    DECLARE w_collection 	TEXT;
    DECLARE w_model 		TEXT;
    DECLARE w_parent_id 	INT(12);
    DECLARE w_action 		CHAR(1);
    
    /*Variables de trabajo del detalle*/
 	DECLARE w_id	int;
	DECLARE w_trans_orden_detalleID	int;
	DECLARE w_parametroID	int;
	DECLARE w_resultado	varchar(255);
	DECLARE w_referenciaID	int;
	DECLARE w_fueraDeRango	int;
	DECLARE w_comentarios	varchar(255);
	DECLARE w_operador    varchar(255);
	DECLARE w_minimo   DECIMAL(12,4);
	DECLARE w_maximo   DECIMAL(12,4);
	
     
	DECLARE w_affectedRowsDetail INT DEFAULT 0;
    
    DECLARE i INT DEFAULT 0;
    
    SELECT JSON_EXTRACT(i_collection, "$.models") 	INTO w_collection; 
	 
    
	WHILE i < JSON_LENGTH(w_collection) DO
		SELECT JSON_EXTRACT(w_collection,CONCAT('$[',i,']')) INTO w_model;
		SELECT 	
		 
			JSON_VALUE(w_model,"$.id"),
			JSON_VALUE(w_model,"$.trans_orden_detalleID"),
			JSON_VALUE(w_model,"$.parametroID"),
			JSON_VALUE(w_model,"$.resultado"),
			JSON_VALUE(w_model,"$.referenciaID"),
			JSON_VALUE(w_model,"$.fueraDeRango"),
			JSON_VALUE(w_model,"$.comentarios")
		INTO
			 
			w_id,
			w_trans_orden_detalleID,
			w_parametroID,
			w_resultado,
			w_referenciaID,
			w_fueraDeRango,
			w_comentarios;
		 
			
			
			UPDATE   orden_examenes_parametros
			SET  
				 
				resultado=w_resultado,
				comentarios=w_comentarios
			WHERE      id = w_id;
			
			/*
					31 >=
					32 <>
					33 <=
			*/
			IF w_referenciaID IS NOT NULL THEN
			
			   SELECT operador,minimo,maximo INTO w_operador, w_minimo, w_maximo
			   FROM referencia
			   WHERE id = w_referenciaID;
			   
			   
				IF w_operador = 31 THEN
				   IF w_resultado >= w_minimo THEN 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 0
					  WHERE      id = w_id;
				   ELSE 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 1
					  WHERE      id = w_id;
				   
				   END IF;
				   
				END IF;

				IF w_operador = 33 THEN
				   IF w_resultado <= w_maximo THEN 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 0
					  WHERE      id = w_id;
				   ELSE 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 1
					  WHERE      id = w_id;
				   
				   END IF;
				   
				END IF;
			   
				IF w_operador = 32 THEN
				   IF w_resultado >= w_minimo  AND w_resultado <= w_maximo THEN 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 0
					  WHERE      id = w_id;
				   ELSE 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 1
					  WHERE      id = w_id;
				   
				   END IF;
				   
				END IF;


			END IF;
		 
				
		SELECT i + 1 INTO i;
        SELECT w_affectedRowsDetail + 1 into w_affectedRowsDetail;
		
	
        
	END WHILE;
   
	UPDATE orden_examenes_detalle
	SET catalogoID = 36
	WHERE id = w_trans_orden_detalleID;	
   
   
	SELECT w_affectedRowsDetail  as affectedRows;
   
END;
;; 

/*
	yyyy-MM-dd
	
*/
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_orden_examenes_detalle;
;; 
 
DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_ROW_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				orden_examenes_detalle.id,
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				ordenID,
				defExamenID,
				 fechaInicio,
				 fechaFin,
				horaInicio,
				horaFin,
				 fechaProceso,
				horaProceso,
				catalogoID,
				usuarioElaboroID,
				usuarioValidoID,
				observaciones,
				examenEspecial
		FROM 	orden_examenes_detalle 
				INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON  categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   orden_examenes_detalle.id = i_id;
END;
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_usuario;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_usuario(
	IN 
 i_id	int,   
i_nombres	varchar(255),
i_apellidos	varchar(255),
i_rol	int,
i_clave	int
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  usuario
    ( 
         
		nombres,
		apellidos,
		rol,
		clave
    )
    VALUES  
    ( 
		 
		i_nombres,
		i_apellidos,
		i_rol,
		i_clave
    );
   
   
   SELECT LAST_INSERT_ID() AS lastInserted;
   
END;
;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_usuario;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_usuario(
	IN 
	 i_id	int,
	 i_nombres	varchar(255),
	 i_apellidos	varchar(255),
	 i_rol	int,
	 i_clave	int
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   usuario
	 SET  
		nombres=i_nombres,
		apellidos=i_apellidos,
		rol=i_rol,
		clave=i_clave
	WHERE      id = i_id;

END;
;; 



DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_usuario;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_usuario
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM usuario
WHERE      id = i_id;

 END; 

;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_usuario;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_usuario( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombres,apellidos,rol,clave
		FROM 	usuario
		WHERE   id = i_id;
END;

;;
 
 
 DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_usuario;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_usuario()
	BEGIN 
	SELECT id,nombres,apellidos,rol,clave
	FROM usuario;
END; 
 
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_usuario;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_usuario(
	i_filter varchar(256)
)
	BEGIN 
	SELECT id,nombres,apellidos,rol,clave
	FROM usuario
	WHERE nombres LIKE CONCAT('%', i_filter , '%') OR  
apellidos LIKE CONCAT('%', i_filter , '%');
END; 

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_mfr_rol;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_mfr_rol(
	IN 
    i_id	int,
	i_rol_perfil	varchar(60),
	i_rol_tipo	char(1),
	i_rol_acceso_total	tinyint(1),
	i_rol_fecha_opr	datetime,
	i_rol_usuario_opr	int
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  mfr_rol
    ( 
    
		rol_perfil,
		rol_tipo,
		rol_acceso_total,
		rol_fecha_opr,
		rol_usuario_opr
    )
    VALUES  
    ( 
	 
		i_rol_perfil,
		i_rol_tipo,
		i_rol_acceso_total,
		i_rol_fecha_opr,
		i_rol_usuario_opr
    );
   
   
   SELECT LAST_INSERT_ID() AS lastInserted;
   
END;
;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_mfr_rol;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_mfr_rol(
	IN 
	 i_id	int,i_rol_perfil	varchar(60),i_rol_tipo	char(1),i_rol_acceso_total	tinyint(1),i_rol_fecha_opr	datetime,i_rol_usuario_opr	int
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   mfr_rol
	 SET  
		rol_perfil=i_rol_perfil,rol_tipo=i_rol_tipo,rol_acceso_total=i_rol_acceso_total,rol_fecha_opr=i_rol_fecha_opr,rol_usuario_opr=i_rol_usuario_opr
	WHERE      id = i_id;

END;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_mfr_rol;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_mfr_rol
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM mfr_rol
WHERE      id = i_id;

 END; 

;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_mfr_rol;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_mfr_rol( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,rol_perfil,rol_tipo,rol_acceso_total,rol_fecha_opr,rol_usuario_opr
		FROM 	mfr_rol
		WHERE   id = i_id;
END;

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_mfr_rol;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_mfr_rol(
	i_filter varchar(256)
)
	BEGIN 
	SELECT id,rol_perfil,rol_tipo,rol_acceso_total,rol_fecha_opr,rol_usuario_opr
	FROM mfr_rol
	WHERE rol_perfil LIKE CONCAT('%', i_filter , '%');
END; 

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_mfr_rol;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_mfr_rol()
	BEGIN 
	SELECT id,rol_perfil,rol_tipo,rol_acceso_total,rol_fecha_opr,rol_usuario_opr
	FROM mfr_rol;
END; 
 
;; 



DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_mfr_acceso;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_mfr_acceso(
	IN 
    i_id	int,
i_acc_rol	int,
i_acc_opcion	int,
i_acc_escritura	int
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  mfr_acceso
    ( 
       
		acc_rol,
		acc_opcion,
		acc_escritura
    )
    VALUES  
    ( 
		 
		i_acc_rol,
		i_acc_opcion,
		i_acc_escritura
    );
   
   
   SELECT LAST_INSERT_ID() AS lastInserted;
   
END;
;;
 
 
 DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_mfr_acceso;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_mfr_acceso
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM mfr_acceso
WHERE      id = i_id;

 END; 

;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_mfr_acceso;
;;
 
DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_mfr_acceso( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				mfr_acceso.id,acc_rol,optionName,acc_escritura
		FROM 	mfr_acceso INNER JOIN sys_menu
				ON mfr_acceso.acc_opcion = sys_menu.id
		WHERE   acc_rol = i_id;
END;
;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_sys_menu;
;;

DELIMITER ;;
CREATE   PROCEDURE SP_ADD_sys_menu(
	IN 
    i_id	int,
	i_optionName	varchar(256),
	i_parentID	int,
	i_pathString	varchar(256),
	i_controllerName	varchar(256),
	i_className	varchar(256),
	i_folder	varchar(256),
	i_hasChilds	int,
	i_icon	varchar(256),
	i_relativeOrder	int,
	i_absoluteOrder	int
)
BEGIN 

    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  sys_menu
    ( 
        
		optionName,
		parentID,
		pathString,
		controllerName,
		className,
		folder,
		hasChilds,
		icon,
		relativeOrder,
		absoluteOrder
    )
    VALUES  
    ( 
		 
		i_optionName,
		i_parentID,
		i_pathString,
		i_controllerName,
		i_className,
		i_folder,
		i_hasChilds,
		i_icon,
		i_relativeOrder,
		i_absoluteOrder
    );
   
   
   SELECT LAST_INSERT_ID() AS lastInserted;
   
END;
;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_sys_menu;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_sys_menu(
	IN 
	 i_id	int,i_optionName	varchar(256),i_parentID	int,i_pathString	varchar(256),i_controllerName	varchar(256),i_className	varchar(256),i_folder	varchar(256),i_hasChilds	int,i_icon	varchar(256),i_relativeOrder	int,i_absoluteOrder	int
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   sys_menu
	 SET  
		optionName=i_optionName,parentID=i_parentID,pathString=i_pathString,controllerName=i_controllerName,className=i_className,folder=i_folder,hasChilds=i_hasChilds,icon=i_icon,relativeOrder=i_relativeOrder,absoluteOrder=i_absoluteOrder
	WHERE      id = i_id;

END;
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_sys_menu;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_sys_menu
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM sys_menu
WHERE      id = i_id;

 END; 

;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_sys_menu;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_sys_menu( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,optionName,parentID,pathString,controllerName,className,folder,hasChilds,icon,relativeOrder,absoluteOrder
		FROM 	sys_menu
		WHERE   id = i_id;
END;

;;
 
 
 
 DELIMITER ;;
 DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_sys_menu;
 ;;
 
  DELIMITER ;;
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_sys_menu( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,optionName,parentID,pathString,controllerName,className,folder,hasChilds,icon,relativeOrder,absoluteOrder
		FROM 	sys_menu
		WHERE   parentID = i_id;
END;
;;


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_sys_menu;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_sys_menu( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,optionName,parentID,pathString,controllerName,className,folder,hasChilds,icon,relativeOrder,absoluteOrder
		FROM 	sys_menu
		WHERE   id = i_id;
END;

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_sys_menu;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_sys_menu()
	BEGIN 
	SELECT id,optionName,parentID,pathString,controllerName,className,folder,hasChilds,icon,relativeOrder,absoluteOrder
	FROM sys_menu;
END; 
 
;; 

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_item;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_item()
	BEGIN 
	SELECT ID,descripcion,catalogoID,cuentaID,areaID,unidadMedidaID
	FROM item;
END; 
 
;; 

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_item;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_item(
	i_filter varchar(256)
)
	BEGIN 
	SELECT id,descripcion,catalogoID,cuentaID,areaID,unidadMedidaID,precio
	FROM item
	WHERE descripcion LIKE CONCAT('%', i_filter , '%');
END; 

;;



DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_unidad_medida;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_unidad_medida()
	BEGIN 
	SELECT id,unidadMedida
	FROM unidad_medida;
END; 
 
;; 


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_tecnico;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_tecnico( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombreCompleto,numeroJuntaVigilancia,cargo,rolID,sello,firmaDigital
		FROM 	tecnico
		WHERE   id = i_id;
END;

;;
 
		
		
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_tecnico;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_tecnico()
	BEGIN 
	SELECT id,nombreCompleto,numeroJuntaVigilancia,cargo,rolID,sello,firmaDigital
	FROM tecnico;
END; 
 
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_tecnico;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_tecnico(
	i_filter varchar(256)
)
	BEGIN 
	SELECT ID,nombreCompleto,numeroJuntaVigilancia,cargo,rolID,sello,firmaDigital
	FROM tecnico
	WHERE nombreCompleto LIKE CONCAT('%', i_filter , '%') OR  
numeroJuntaVigilancia LIKE CONCAT('%', i_filter , '%') OR  
cargo LIKE CONCAT('%', i_filter , '%') OR  
sello LIKE CONCAT('%', i_filter , '%') OR  
firmaDigital LIKE CONCAT('%', i_filter , '%');
END; 

;;
		
		
DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_definicion_examen;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_definicion_examen( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,nombreExamen,categoriaID,examenEspecial
		FROM 	definicion_examen
		WHERE   id = i_id;
END;
;;		


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_orden_examenes_parametros;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_orden_examenes_parametros( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				orden_examenes_parametros.id,
				trans_orden_detalleID,
				orden_examenes_parametros.parametroID,
				nombreParametro,
				IFNULL(resultado,'') AS resultado,
				IFNULL(minimo,'') AS minimo,
				IFNULL(maximo,'') AS maximo,
				IFNULL(referenciaID,0) AS referenciaID,
				IFNULL(fueraDeRango,'0') AS fueraDeRango,
				IFNULL(comentarios,'') AS comentarios,
				IFNULL(unidadMedida,'') AS unidadMedida,
				IFNULL(elementTypeID,1) AS elementType,
				definicion_examen.id AS examenID,
				nombreParametro as 'columnFilter',
				'resultado' as 'columnName',
				1 as dynamicDataGrid,
				subGrupoID,
				operador
		FROM 	orden_examenes_parametros INNER JOIN parametro   ON 
				orden_examenes_parametros.parametroID = parametro.id
				LEFT JOIN referencia ON orden_examenes_parametros.referenciaID = referencia.id
				LEFT JOIN unidad_medida ON unidad_medida.id = parametro.unidadMedidaID
				INNER JOIN definicion_examen ON parametro.defExamenID = definicion_examen.id
		WHERE   trans_orden_detalleID = i_id
		ORDER BY parametro.orden, subGrupoID;
END;
;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_orden_examenes;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_orden_examenes( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				orden_examenes.id as ordenID,
				fecha,
				hora,
				presuntoDiagnostico,
				diagnostico,
				pacienteID,
				medicoTratanteID,
				medicoReferenteID,
				areaReferenciaHospitalID,
				frecuenciaExamenes,
				medicamentoPermanente,
				edadActual,
				IFNULL(descripcion,'NO DEFINIDO') AS unidadTiempo,
				nombreArea
		FROM 	orden_examenes LEFT JOIN catalogo_general
				ON orden_examenes.unidadTiempo = catalogo_general.id
		        INNER JOIN area_referencia_examen ON orden_examenes.areaReferenciaHospitalID = area_referencia_examen.id
					
		WHERE   orden_examenes.id = i_id;
END;
;;



DELIMITER ;;  
DROP PROCEDURE IF EXISTS  SP_ADD_COLLECTION_tmp_resultado_detalle;
;;  
 
DELIMITER ;;   
CREATE   PROCEDURE SP_ADD_COLLECTION_tmp_resultado_detalle(
	 
    IN i_collection JSON
)
BEGIN 

 	/* Collections */
    DECLARE w_document 		VARCHAR(32000);
    DECLARE w_collection 	VARCHAR(32000);
    DECLARE w_model 		VARCHAR(32000);
    
    
	 
    
    /*Variables de trabajo del detalle*/
 	DECLARE w_id	int;
	DECLARE w_resultadoID	int;
	DECLARE w_parametro	varchar(256);
	DECLARE w_valor	varchar(256);
	DECLARE w_ordenID VARCHAR(256);
    
   
     
	DECLARE w_affectedRowsDetail INT DEFAULT 0;
    
    DECLARE i INT DEFAULT 0;
    SELECT JSON_EXTRACT(i_collection,"$.models") 	INTO w_collection; 
	 
    
 
    
	WHILE i < JSON_LENGTH(w_collection) DO
		SELECT JSON_EXTRACT(w_collection,CONCAT('$[',i,']')) INTO w_model;
		SELECT 	
			JSON_VALUE(w_model,"$.id"),
			JSON_VALUE(w_model,"$.resultadoID"),
			JSON_VALUE(w_model,"$.parametro"),
			JSON_VALUE(w_model,"$.valor")
		INTO
			w_id,
			w_resultadoID,
			w_parametro,
			w_valor;
		
		 
			INSERT INTO  tmp_resultado_detalle
			( 
				resultadoID,
				parametro,
				valor
			)
			VALUES  
			( 
				w_resultadoID,
				w_parametro,
				w_valor
			);
	 
	 
		SELECT i + 1 INTO i;
        SELECT w_affectedRowsDetail + 1 into w_affectedRowsDetail;
        
	END WHILE;
	
	SET w_ordenID = (
		SELECT pid 
		FROM temp_resultado
		WHERE id = w_resultadoID
	);
   
	call PR_ProcesarParametros(w_ordenID);
   
	SELECT w_affectedRowsDetail  as affectedRows;
   
END;
;; 


DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_EDIT_COLLECTION_orden_examenes_parametros;
;; 
 
 
DELIMITER ;; 
CREATE   PROCEDURE SP_EDIT_COLLECTION_orden_examenes_parametros(
	 
    IN i_collection JSON
)
BEGIN 

	/* Collections */
    DECLARE w_document 		TEXT;
    DECLARE w_collection 	TEXT;
    DECLARE w_model 		TEXT;
    DECLARE w_parent_id 	INT(12);
    DECLARE w_action 		CHAR(1);
    
    /*Variables de trabajo del detalle*/
 	DECLARE w_id	int;
	DECLARE w_trans_orden_detalleID	int;
	DECLARE w_parametroID	int;
	DECLARE w_resultado	varchar(255);
	DECLARE w_referenciaID	int;
	DECLARE w_fueraDeRango	int;
	DECLARE w_comentarios	varchar(255);
	DECLARE w_operador    varchar(255);
	DECLARE w_minimo   DECIMAL(12,4);
	DECLARE w_maximo   DECIMAL(12,4);
	
     
	DECLARE w_affectedRowsDetail INT DEFAULT 0;
    
    DECLARE i INT DEFAULT 0;
    
    SELECT JSON_EXTRACT(i_collection, "$.models") 	INTO w_collection; 
	 
    
	WHILE i < JSON_LENGTH(w_collection) DO
		SELECT JSON_EXTRACT(w_collection,CONCAT('$[',i,']')) INTO w_model;
		SELECT 	
		 
			JSON_VALUE(w_model,"$.id"),
			JSON_VALUE(w_model,"$.trans_orden_detalleID"),
			JSON_VALUE(w_model,"$.parametroID"),
			JSON_VALUE(w_model,"$.resultado"),
			JSON_VALUE(w_model,"$.referenciaID"),
			JSON_VALUE(w_model,"$.fueraDeRango"),
			JSON_VALUE(w_model,"$.comentarios")
		INTO
			 
			w_id,
			w_trans_orden_detalleID,
			w_parametroID,
			w_resultado,
			w_referenciaID,
			w_fueraDeRango,
			w_comentarios;
		 
			
			
			UPDATE   orden_examenes_parametros
			SET  
				 
				resultado=w_resultado,
				comentarios=w_comentarios
			WHERE      id = w_id;
			
			/*
					31 >=
					32 <>
					33 <=
			*/
			IF w_referenciaID IS NOT NULL THEN
			
			   SELECT operador,minimo,maximo INTO w_operador, w_minimo, w_maximo
			   FROM referencia
			   WHERE id = w_referenciaID;
			   
			   
				IF w_operador = 31 THEN
				   IF w_resultado >= w_minimo THEN 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 0
					  WHERE      id = w_id;
				   ELSE 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 1
					  WHERE      id = w_id;
				   
				   END IF;
				   
				END IF;

				IF w_operador = 33 THEN
				   IF w_resultado <= w_maximo THEN 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 0
					  WHERE      id = w_id;
				   ELSE 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 1
					  WHERE      id = w_id;
				   
				   END IF;
				   
				END IF;
			   
				IF w_operador = 32 THEN
				   IF w_resultado >= w_minimo  AND w_resultado <= w_maximo THEN 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 0
					  WHERE      id = w_id;
				   ELSE 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 1
					  WHERE      id = w_id;
				   
				   END IF;
				   
				END IF;


			END IF;
		 
				
		SELECT i + 1 INTO i;
        SELECT w_affectedRowsDetail + 1 into w_affectedRowsDetail;
		
	
        
	END WHILE;
   
	UPDATE orden_examenes_detalle
	SET catalogoID = 36
	WHERE id = w_trans_orden_detalleID;	
   
   
	SELECT w_affectedRowsDetail  as affectedRows;
   
END;
;; 


DELIMITER ;;  
DROP PROCEDURE IF EXISTS  PR_ProcesarParametros;
;;  

DELIMITER ;;  
CREATE  PROCEDURE PR_ProcesarParametros(

	i_ordenID VARCHAR(256)
)
BEGIN
	 UPDATE orden_examenes_parametros
			INNER JOIN orden_examenes_detalle ON orden_examenes_parametros.trans_orden_detalleID = orden_examenes_detalle.id
			INNER JOIN orden_examenes ON orden_examenes_detalle.ordenID = orden_examenes.id
			INNER JOIN  temp_resultado ON temp_resultado.pid = orden_examenes.id AND temp_resultado.pid = i_ordenID
			INNER JOIN tmp_resultado_detalle ON tmp_resultado_detalle.resultadoID = temp_resultado.id
			INNER JOIN parametro ON  tmp_resultado_detalle.parametro = parametro.codigoParametroDisposivito
				AND orden_examenes_parametros.parametroID = parametro.id 
	 SET    orden_examenes_parametros.resultado =  tmp_resultado_detalle.valor;
END
;;  


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_orden_examenes_detalle;
;; 
 
DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_ROW_orden_examenes_detalle( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				orden_examenes_detalle.id,
				nombreExamen,
				nombreCategoria,
				nombreMuestra,
				ordenID,
				defExamenID,
				 fechaInicio,
				 fechaFin,
				horaInicio,
				horaFin,
				 fechaProceso,
				horaProceso,
				catalogoID,
				usuarioElaboroID,
				usuarioValidoID,
				observaciones,
				examenEspecial
		FROM 	orden_examenes_detalle 
				INNER JOIN definicion_examen ON orden_examenes_detalle.defExamenID = definicion_examen.id
				INNER JOIN categoria ON definicion_examen.categoriaID = categoria.id
				INNER JOIN categoria_muestra ON  categoria.id = categoria_muestra.categoriaID
				INNER JOIN muestra ON muestra.id = categoria_muestra.muestraID
		WHERE   orden_examenes_detalle.id = i_id;
END;
;; 



DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_ADD_parametro;
 ;;
 
DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_parametro(
	IN 
    i_id	int,
	i_nombreParametro	varchar(255),
	i_codigoParametroDisposivito	varchar(255),
	i_defExamenID	int,
	i_factor	int,
	i_unidadMedidaID	int,
	i_elementTypeID	int,
	i_orden	int,
	i_dependeGenero	int,
	i_dependeEdad	int,
	i_subGrupo int
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
	DECLARE w_lastSort INT(12);
	DECLARE w_sort INT(12);
	
	SET w_lastSort = (
			SELECT MAX(orden)
			FROM parametro
			WHERE defExamenID = i_defExamenID
	);
	
	IF w_lastSort IS NULL THEN
	    SET w_sort = 1;
		
	ELSE 
		SET w_sort = w_lastSort + 1;
	
	END IF;
	
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
	
    INSERT INTO  parametro
    ( 
  
		nombreParametro,
		codigoParametroDisposivito,
		defExamenID,
		factor,
		unidadMedidaID,
		elementTypeID,
		orden,
		dependeGenero,
		dependeEdad,
		subGrupoID
    )
    VALUES  
    ( 
		 
		UPPER(i_nombreParametro),
		i_codigoParametroDisposivito,
		i_defExamenID,
		i_factor,
		i_unidadMedidaID,
		1,
		w_sort,
		i_dependeGenero,
		i_dependeEdad,
		i_subGrupo
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
		id,
		nombreParametro,
		codigoParametroDisposivito,
		defExamenID,
		factor,
		unidadMedidaID,
		elementTypeID,
		orden,
		dependeGenero,
		dependeEdad,
		subGrupoID
	FROM 	parametro
	WHERE   id = w_id;
   
END;

DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_ADD_venta;
;;  
 
DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_venta(
	IN 
    i_id	int,
	i_fechaVenta	datetime,
	i_clienteID	int,
	i_documentoID	int,
	i_numeroDocumento	varchar(256),
	i_serieDocumento	varchar(256),
	i_formaPagoID	int,
	i_codDescuento	varchar(256),
	i_montoDescuento	decimal(14,2),
	i_honorariosMedicos	int,
	i_cargoTarjeta	decimal(14,2),
	i_subtotal	decimal(14,2),
	i_total	decimal(14,2),
	i_efectivo	decimal(14,2),
	i_cambio	decimal(14,2),
	i_estado	int,
	i_presuntoDiagnostico 	INT,	
	i_diagnostico 			varchar(256),	
	i_medicoTratanteID 		INT,	
	i_medicoReferenteID		INT,		
	i_frecuenciaExamenes 	INT,		
	i_medicamentoPermanente varchar(256),
	i_cajaID INT,
	i_corteID INT 
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATETIME;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  venta
    ( 
        id,
		fechaVenta,
		clienteID,
		documentoID,
		numeroDocumento,
		serieDocumento,
		formaPagoID,
		codDescuento,
		montoDescuento,
		honorariosMedicos,
		cargoTarjeta,
		subtotal,
		total,
		efectivo,
		cambio,
		estado
    )
    VALUES  
    ( 
		i_id,
		w_add_date,
		i_clienteID,
		i_documentoID,
		i_numeroDocumento,
		i_serieDocumento,
		i_formaPagoID,
		i_codDescuento,
		i_montoDescuento,
		i_honorariosMedicos,
		i_cargoTarjeta,
		i_subtotal,
		i_total,
		i_efectivo,
		i_cambio,
		i_estado
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id,
			fechaVenta,
			clienteID,
			documentoID,
			numeroDocumento,
			serieDocumento,
			formaPagoID,
			codDescuento,
			montoDescuento,
			honorariosMedicos,
			cargoTarjeta,
			subtotal,
			total,
			efectivo,
			cambio,
			estado
	FROM 	venta
	WHERE   id = w_id;
   
END;
;; 


 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_COLLECTION_venta_detalle;
;;

 
DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_COLLECTION_venta_detalle(
	 
    IN i_collection JSON
)
BEGIN 

 	/* Collections */
    DECLARE w_document 		VARCHAR(32000);
    DECLARE w_collection 	VARCHAR(32000);
    DECLARE w_model 		VARCHAR(32000);
    
    
	 
    
    /*Variables de trabajo del detalle*/
 		DECLARE w_id	int;
	DECLARE w_ventaID	int;
	DECLARE w_itemID	int;
	DECLARE w_cantidad	decimal(14,4);
	DECLARE w_precio	decimal(14,4);
	DECLARE w_descuento	decimal(14,4);
	DECLARE w_subtotal	decimal(14,2);
    
   
     
	DECLARE w_affectedRowsDetail INT DEFAULT 0;
    
    DECLARE i INT DEFAULT 0;
    SELECT JSON_EXTRACT(i_collection,"$.models") 	INTO w_collection; 
	 
    
 
    
	WHILE i < JSON_LENGTH(w_collection) DO
		SELECT JSON_EXTRACT(w_collection,CONCAT('$[',i,']')) INTO w_model;
		SELECT 	
						JSON_VALUE(w_model,"$.id"),
			JSON_VALUE(w_model,"$.ventaID"),
			JSON_VALUE(w_model,"$.itemID"),
			JSON_VALUE(w_model,"$.cantidad"),
			JSON_VALUE(w_model,"$.precio"),
			JSON_VALUE(w_model,"$.descuento"),
			JSON_VALUE(w_model,"$.subtotal")
		INTO
			w_id,
			w_ventaID,
			w_itemID,
			w_cantidad,
			w_precio,
			w_descuento,
			w_subtotal;
		
		 
			INSERT INTO  venta_detalle
			( 
							ventaID,
			itemID,
			cantidad,
			precio,
			descuento,
			subtotal
			)
			VALUES  
			( 
							w_ventaID,
			w_itemID,
			w_cantidad,
			w_precio,
			w_descuento,
			w_subtotal
			);
		 
	 
		SELECT i + 1 INTO i;
        SELECT w_affectedRowsDetail + 1 into w_affectedRowsDetail;
        
	END WHILE;
   
	SELECT w_affectedRowsDetail  as affectedRows;
   
END;
;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_SELECT_COLLECTION_BY_FLAG_sys_menu;
;;

DELIMITER ;;
CREATE   PROCEDURE `SP_SELECT_COLLECTION_BY_FLAG_sys_menu`(`i_id` INT(12), `i_projectID` INT(12))
BEGIN 
		SELECT   
				id,optionName,parentID,pathString,controllerName,className,folder,hasChilds
		FROM 	sys_menu
		WHERE   hasChilds = i_id and projectId = i_projectID;
END;;
 
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_SELECT_COLLECTION_BY_SELF_ID_sys_menu;
;; 
 
DELIMITER ;; 
CREATE   PROCEDURE `SP_SELECT_COLLECTION_BY_SELF_ID_sys_menu`(`i_id` INT(12))
BEGIN 
		SELECT   
				id,
				optionName,
				parentID,
				pathString,
				controllerName,
				className,
				folder,
				hasChilds
		FROM 	sys_menu
		WHERE   parentID = i_id
        ORDER BY relativeOrder;
END
;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_sys_menu;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_sys_menu(
 IN i_object JSON
)
BEGIN 
 	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  sys_menu
    ( 
			optionName
			,parentID
			,pathString
			,controllerName
			,className
			,projectID
			,folder
			,hasChilds
			,icon
			,relativeOrder
			,absoluteOrder
			
    ) VALUES(
			JSON_VALUE(i_object,"$.optionName"),
			JSON_VALUE(i_object,"$.parentID"),
			JSON_VALUE(i_object,"$.pathString"),
			JSON_VALUE(i_object,"$.controllerName"),
			JSON_VALUE(i_object,"$.className"),
			1,
			JSON_VALUE(i_object,"$.folder"),
			JSON_VALUE(i_object,"$.hasChilds"),
			JSON_VALUE(i_object,"$.icon"),
			JSON_VALUE(i_object,"$.relativeOrder"),
			JSON_VALUE(i_object,"$.absoluteOrder")
		  
	);
	

   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id
			,optionName
			,parentID
			,pathString
			,controllerName
			,className
			,projectID
			,folder
			,hasChilds
			,icon
			,relativeOrder
			,absoluteOrder
			
	FROM 	sys_menu
	WHERE   id = w_id;
   
END;

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_sys_menu;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_sys_menu(
	IN 
	 i_id	int(11),
	 i_optionName	varchar(256),
	 i_parentID	int(11),
	 i_pathString	varchar(256),
	 i_controllerName	varchar(256),
	 i_actionName	varchar(256),
	 i_className	varchar(256),
	 i_projectID	int(11),
	 i_folder	varchar(256),
	 i_hasChilds	int(11),
	 i_icon	varchar(256),
	 i_relativeOrder	int(11),
	 i_absoluteOrder	int(11),
	 i_display	int(11)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   sys_menu
	 SET  
		optionName=i_optionName,
		parentID=i_parentID,
		pathString=i_pathString,
		controllerName=i_controllerName,
		actionName=i_actionName,
		className=i_className,
		projectID=i_projectID,
		folder=i_folder,
		hasChilds=i_hasChilds,
		icon=i_icon,
		relativeOrder=i_relativeOrder,
		absoluteOrder=i_absoluteOrder,
		display=i_display
	WHERE      id = i_id;

END;
;; 


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ATTRIB_proveedor;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ATTRIB_proveedor( 
  IN  i_attrib varchar(256)
) 
BEGIN 
		SELECT   
				id
				,nombreProveedor
				,nombreComercial
				,nit
				,dui
				,nrc
				,direccion
				,numeroCasa
				,numeroApto
				,telefono
				,email
				,giroID
				,pais
				,departamento
				,municipio
				,distrito
				,tipoProveedor
				,tipoPersona
				,sujetoExcluido
				,representanteLegal
				
		FROM 	proveedor
		WHERE   nrc = i_attrib OR dui = i_attrib;
END;

;;
 
		
		
/*
	SEGURIDAD INTEGRADA
	
	18/01/2025
*/		

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_SELECT_COLLECTION_BY_FLAG_sys_menu;
;;

DELIMITER ;;
CREATE   PROCEDURE `SP_SELECT_COLLECTION_BY_FLAG_sys_menu`(
	`i_id` INT(12),
	`i_projectID` INT(12),
	`i_perfilID` INT(12)
 )
BEGIN 
		SELECT   
				sys_menu.id,
				optionName,
				parentID,
				pathString,
				controllerName,
				className,
				folder,
				hasChilds,
				IFNULL(acc_opcion,0) AS estado,
				icon,
				display
		FROM 	sys_menu LEFT JOIN mfr_acceso ON sys_menu.id = mfr_acceso.acc_opcion
		WHERE   hasChilds = i_id 
				AND projectId = i_projectID
				AND acc_rol = i_perfilID;
END;;
 
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_SELECT_COLLECTION_BY_SELF_ID_sys_menu;
;; 
 
DELIMITER ;; 
CREATE   PROCEDURE `SP_SELECT_COLLECTION_BY_SELF_ID_sys_menu`(
	`i_id` INT(12),
	`i_perfilID` INT(12)
)
BEGIN 
		SELECT   
				sys_menu.id,
				optionName,
				parentID,
				pathString,
				controllerName,
				className,
				folder,
				hasChilds
		FROM 	sys_menu LEFT JOIN mfr_acceso ON sys_menu.id = mfr_acceso.acc_opcion
		WHERE   parentID = i_id
				AND acc_rol = i_perfilID
        ORDER BY relativeOrder;
END
;; 


 
DELIMITER ;;  
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_mfr_acceso;
;;


DELIMITER ;;   
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_mfr_acceso( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				mfr_acceso.id
				,acc_rol
				,acc_opcion
				,acc_escritura
				,optionName
				,parentID
				,pathString
				,controllerName
				,className
				,folder
				hasChilds				
		FROM 	sys_menu LEFT JOIN mfr_acceso ON sys_menu.id = mfr_acceso.acc_opcion
		WHERE   acc_rol = i_id;
END;
;;
 


DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_ADD_TABLE_COLLECTION_mfr_acceso;
;;

DELIMITER ;;
 
CREATE   PROCEDURE SP_ADD_TABLE_COLLECTION_mfr_acceso(
	 
    IN i_collection JSON
)
BEGIN 
 
	INSERT INTO  mfr_acceso
	( 
			acc_rol,
			acc_opcion,
			acc_escritura
	 )
			 
	SELECT 
			acc_rol,
			acc_opcion,
			acc_escritura
	FROM json_table(i_collection, '$.collection[*]' 
		  columns(
			id int(11) path '$.id',
			acc_rol int(11) path '$.acc_rol',
			acc_opcion int(11) path '$.acc_opcion',
			acc_escritura int(11) path '$.acc_escritura'
		   ) 
		) AS jt;	 
    
 
    
	 
	SELECT ROW_COUNT();
   
END;

;;		

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_SELECT_COLLECTION_BY_SELF_ID_sys_menu;
;; 
 
DELIMITER ;; 
CREATE   PROCEDURE `SP_SELECT_COLLECTION_BY_SELF_ID_sys_menu`(
	`i_id` INT(12),
	`i_perfilID` INT(12)
)
BEGIN 
	SELECT   
				sys_menu.id,
				optionName,
				parentID,
				pathString,
				controllerName,
				className,
				folder,
				hasChilds,
				1 as status
		FROM 	sys_menu LEFT JOIN mfr_acceso ON sys_menu.id = mfr_acceso.acc_opcion
		WHERE   parentID = i_id
				AND acc_rol = i_perfilID
        UNION 
		SELECT   
				sys_menu.id,
				optionName,
				parentID,
				pathString,
				controllerName,
				className,
				folder,
				hasChilds,
				0 as status
		FROM 	sys_menu  
		WHERE   parentID = i_id AND id NOT IN (
			SELECT   
					sys_menu.id
			FROM 	sys_menu LEFT JOIN mfr_acceso ON sys_menu.id = mfr_acceso.acc_opcion
			WHERE   parentID = i_id
					AND acc_rol = i_perfilID		
		);	
END
;; 

/*
	demo
*/
	SELECT   
				sys_menu.id,
				optionName,
				parentID,
				pathString,
				controllerName,
				className,
				folder,
				hasChilds,
				1 as status
		FROM 	sys_menu LEFT JOIN mfr_acceso ON sys_menu.id = mfr_acceso.acc_opcion
		WHERE   parentID = i_id
				AND acc_rol = i_perfilID
        UNION 
		SELECT   
				sys_menu.id,
				optionName,
				parentID,
				pathString,
				controllerName,
				className,
				folder,
				hasChilds,
				0 as status
		FROM 	sys_menu  
		WHERE   parentID = i_id AND id NOT IN (
			SELECT   
					sys_menu.id
			FROM 	sys_menu LEFT JOIN mfr_acceso ON sys_menu.id = mfr_acceso.acc_opcion
			WHERE   parentID = i_id
					AND acc_rol = i_perfilID		
		)	
		
		
		
DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_ADD_TABLE_COLLECTION_mfr_acceso;
;;
 
DELIMITER ;;
 
CREATE   PROCEDURE SP_ADD_TABLE_COLLECTION_mfr_acceso(
	 
    IN i_collection JSON
)
BEGIN 
 
	INSERT INTO  mfr_acceso
	( 
			acc_rol,
			acc_opcion,
			acc_escritura
	 )
			 
	SELECT 
			 
			acc_rol,
			acc_opcion,
			acc_escritura
	FROM json_table(i_collection, '$.collection[*]' 
		  columns(
			id int(11) path '$.id',
			acc_rol int(11) path '$.acc_rol',
			acc_opcion int(11) path '$.acc_opcion',
			acc_escritura int(11) path '$.acc_escritura'
		   ) 
		) AS jt WHERE id = 0  AND acc_escritura = 1;	 
    

	
	DELETE FROM mfr_acceso
	WHERE id IN(
		SELECT 
				id 
		FROM json_table(i_collection, '$.collection[*]' 
			  columns(
				id int(11) path '$.id',
				acc_rol int(11) path '$.acc_rol',
				acc_opcion int(11) path '$.acc_opcion',
				acc_escritura int(11) path '$.acc_escritura'
			   ) 
			) AS jt WHERE id > 0 AND acc_escritura = 0
    );
	 
	SELECT ROW_COUNT();
   
END;

;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_SELECT_COLLECTION_BY_SELF_ID_sys_menu;
;; 
 
DELIMITER ;; 
CREATE   PROCEDURE `SP_SELECT_COLLECTION_BY_SELF_ID_sys_menu`(
	`i_id` INT(12),
	`i_perfilID` INT(12)
)
BEGIN 

	SELECT   
					id,
					optionName,
					parentID,
					pathString,
					controllerName,
					className,
					folder,
					hasChilds,
					accesoID,
					status,
					icon,
					relativeOrder
	FROM (
		SELECT   
					sys_menu.id,
					optionName,
					parentID,
					pathString,
					controllerName,
					className,
					folder,
					hasChilds,
					mfr_acceso.id AS accesoID,
					1 as status,
					icon,
					relativeOrder
			FROM 	sys_menu LEFT JOIN mfr_acceso ON sys_menu.id = mfr_acceso.acc_opcion
			WHERE   parentID = i_id
					AND acc_rol = i_perfilID
			UNION 
			SELECT   
					sys_menu.id,
					optionName,
					parentID,
					pathString,
					controllerName,
					className,
					folder,
					hasChilds,
					0 AS accesoID,
					0 as status,
					icon,
					relativeOrder
			FROM 	sys_menu  
			WHERE   parentID = i_id AND id NOT IN (
				SELECT   
						sys_menu.id
				FROM 	sys_menu LEFT JOIN mfr_acceso ON sys_menu.id = mfr_acceso.acc_opcion
				WHERE   parentID = i_id
						AND acc_rol = i_perfilID		
			)
	) resultado		
	ORDER BY  resultado.relativeOrder;	
END
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_PARENTS_sys_menu;
;;

DELIMITER ;;
CREATE   PROCEDURE `SP_PARENTS_sys_menu`(`i_id` INT(12), `i_projectID` INT(12))
BEGIN 
		SELECT   
				id,optionName,parentID,pathString,controllerName,className,folder,hasChilds
		FROM 	sys_menu
		WHERE   hasChilds = i_id and projectId = i_projectID
		ORDER BY relativeOrder;
END;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_GRANTED_sys_menu;
;; 
 
DELIMITER ;; 
CREATE   PROCEDURE `SP_GRANTED_sys_menu`(
	`i_id` INT(12),
	`i_perfilID` INT(12)
)
BEGIN 
	SELECT   
				sys_menu.id,
				optionName,
				parentID,
				pathString,
				controllerName,
				className,
				folder,
				hasChilds,
				mfr_acceso.id AS accesoID,
				1 as status,
				icon,
				display
		FROM 	sys_menu LEFT JOIN mfr_acceso ON sys_menu.id = mfr_acceso.acc_opcion
		WHERE   parentID = i_id
				AND acc_rol = i_perfilID
		ORDER BY relativeOrder;
   
END
;; 

 
DELIMITER ;;  
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_vale;
;;  
 
 
DELIMITER ;;   
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_vale( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id
				,tipo
				,concepto
				,motivo
				,empleado
				,monto
				,fechaHora
				,estado
				
		FROM 	vale
		WHERE   tipo = i_id;
END;
 
;;  
		
		
		
		
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_SELECT_COLLECTION_BY_SELF_ID_OPEN_sys_menu;
;; 
 
DELIMITER ;; 
CREATE   PROCEDURE `SP_SELECT_COLLECTION_BY_SELF_ID_OPEN_sys_menu`(
	`i_id` INT(12) 
)
BEGIN 
	SELECT   
				sys_menu.id,
				optionName,
				parentID,
				pathString,
				controllerName,
				className,
				folder,
				hasChilds,
				1 as status,
				icon
		FROM 	sys_menu  
		WHERE   parentID = i_id
 
		ORDER BY relativeOrder;	
END
;; 		


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_COLLECTION_venta_detalle;
;;

 
DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_COLLECTION_venta_detalle(
	 
    IN i_collection JSON
)
BEGIN 

 	/* Collections */
    DECLARE w_document 		VARCHAR(32000);
    DECLARE w_collection 	VARCHAR(32000);
    DECLARE w_model 		VARCHAR(32000);
    
    
	 
    
    /*Variables de trabajo del detalle*/
 		DECLARE w_id	int;
	DECLARE w_ventaID	int;
	DECLARE w_itemID	int;
	DECLARE w_cantidad	decimal(14,4);
	DECLARE w_precio	decimal(14,4);
	DECLARE w_descuento	decimal(14,4);
	DECLARE w_subtotal	decimal(14,2);
    
   
     
	DECLARE w_affectedRowsDetail INT DEFAULT 0;
    
    DECLARE i INT DEFAULT 0;
    SELECT JSON_EXTRACT(i_collection,"$.collection") 	INTO w_collection; 
	 
    
 
    
	WHILE i < JSON_LENGTH(w_collection) DO
		SELECT JSON_EXTRACT(w_collection,CONCAT('$[',i,']')) INTO w_model;
		SELECT 	
			JSON_VALUE(w_model,"$.id"),
			JSON_VALUE(w_model,"$.ventaID"),
			JSON_VALUE(w_model,"$.itemID"),
			JSON_VALUE(w_model,"$.cantidad"),
			JSON_VALUE(w_model,"$.precio"),
			JSON_VALUE(w_model,"$.descuento"),
			JSON_VALUE(w_model,"$.subtotal")
		INTO
			w_id,
			w_ventaID,
			w_itemID,
			w_cantidad,
			w_precio,
			w_descuento,
			w_subtotal;
		
		 
			INSERT INTO  venta_detalle
			( 
				ventaID,
				itemID,
				cantidad,
				precio,
				descuento,
				subtotal
			)
			VALUES  
			( 
				w_ventaID,
				w_itemID,
				w_cantidad,
				w_precio,
				w_descuento,
				w_subtotal
			);
		 
	 
		SELECT i + 1 INTO i;
        SELECT w_affectedRowsDetail + 1 into w_affectedRowsDetail;
        
	END WHILE;
   
	SELECT w_affectedRowsDetail  as affectedRows;
   
END;
;;


/* 03/02/2025 */


DELIMITER ;;
DROP PROCEDURE IF EXISTS  SP_EDIT_COLLECTION_orden_examenes_parametros;
;; 
 
 
DELIMITER ;; 
CREATE   PROCEDURE SP_EDIT_COLLECTION_orden_examenes_parametros(
	 
    IN i_collection JSON
)
BEGIN 

	/* Collections */
    DECLARE w_document 		TEXT;
    DECLARE w_collection 	TEXT;
    DECLARE w_model 		TEXT;
    DECLARE w_parent_id 	INT(12);
    DECLARE w_action 		CHAR(1);
    
    /*Variables de trabajo del detalle*/
 	DECLARE w_id	int;
	DECLARE w_trans_orden_detalleID	int;
	DECLARE w_parametroID	int;
	DECLARE w_resultado	varchar(255);
	DECLARE w_referenciaID	int;
	DECLARE w_fueraDeRango	int;
	DECLARE w_comentarios	varchar(255);
	DECLARE w_operador    varchar(255);
	DECLARE w_minimo   DECIMAL(12,4);
	DECLARE w_maximo   DECIMAL(12,4);
	
     
	DECLARE w_affectedRowsDetail INT DEFAULT 0;
    
    DECLARE i INT DEFAULT 0;
    
    SELECT JSON_EXTRACT(i_collection, "$.collection") 	INTO w_collection; 
	 
    
	WHILE i < JSON_LENGTH(w_collection) DO
		SELECT JSON_EXTRACT(w_collection,CONCAT('$[',i,']')) INTO w_model;
		SELECT 	
		 
			JSON_VALUE(w_model,"$.id"),
			JSON_VALUE(w_model,"$.trans_orden_detalleID"),
			JSON_VALUE(w_model,"$.parametroID"),
			JSON_VALUE(w_model,"$.resultado"),
			JSON_VALUE(w_model,"$.referenciaID"),
			JSON_VALUE(w_model,"$.fueraDeRango"),
			JSON_VALUE(w_model,"$.comentarios")
		INTO
			 
			w_id,
			w_trans_orden_detalleID,
			w_parametroID,
			w_resultado,
			w_referenciaID,
			w_fueraDeRango,
			w_comentarios;
		 
			
			
			UPDATE   orden_examenes_parametros
			SET  
				 
				resultado=w_resultado,
				comentarios=w_comentarios
			WHERE      id = w_id;
			
			/*
					31 >=
					32 <>
					33 <=
			*/
			IF w_referenciaID IS NOT NULL THEN
			
			   SELECT operador,minimo,maximo INTO w_operador, w_minimo, w_maximo
			   FROM referencia
			   WHERE id = w_referenciaID;
			   
			   
				IF w_operador = 31 THEN
				   IF w_resultado >= w_minimo THEN 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 0
					  WHERE      id = w_id;
				   ELSE 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 1
					  WHERE      id = w_id;
				   
				   END IF;
				   
				END IF;

				IF w_operador = 33 THEN
				   IF w_resultado <= w_maximo THEN 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 0
					  WHERE      id = w_id;
				   ELSE 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 1
					  WHERE      id = w_id;
				   
				   END IF;
				   
				END IF;
			   
				IF w_operador = 32 THEN
				   IF w_resultado >= w_minimo  AND w_resultado <= w_maximo THEN 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 0
					  WHERE      id = w_id;
				   ELSE 
					  UPDATE orden_examenes_parametros 
					  SET fueraDeRango = 1
					  WHERE      id = w_id;
				   
				   END IF;
				   
				END IF;


			END IF;
		 
				
		SELECT i + 1 INTO i;
        SELECT w_affectedRowsDetail + 1 into w_affectedRowsDetail;
		
	
        
	END WHILE;
   
	UPDATE orden_examenes_detalle
	SET catalogoID = 36
	WHERE id = w_trans_orden_detalleID;	
   
   
	SELECT w_affectedRowsDetail  as affectedRows;
   
END;
;; 



DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_ventaCafeteria;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_ventaCafeteria(
 IN i_object JSON
)
BEGIN 
 	DECLARE w_id INT(12);
    DECLARE w_add_date DATETIME;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  venta
    ( 
             fechaVenta
			,cajeroID
			,clienteID
			,documentoID
			,numeroDocumento
			,serieDocumento
			,formaPagoID
			,codDescuento
			,montoDescuento
			,honorariosMedicos
			,cargoTarjeta
			,subtotal
			,total
			,efectivo
			,cambio
			,tarjeta
			,transferencia
			,estado
			,estadoImpresion
			,tipoOperacion
			,clasificacion
			,sector
			,tipoCosto
			,manoDeObra
			,bodegaID
			,nombreCliente
			,montoLetras
			,cajaID
			,corteID
			,tipoCorte
			
    ) VALUES(
			w_add_date,
			JSON_VALUE(i_object,"$.cajeroID"),
			JSON_VALUE(i_object,"$.clienteID"),
			JSON_VALUE(i_object,"$.documentoID"),
			JSON_VALUE(i_object,"$.numeroDocumento"),
			JSON_VALUE(i_object,"$.serieDocumento"),
			JSON_VALUE(i_object,"$.formaPagoID"),
			JSON_VALUE(i_object,"$.codDescuento"),
			JSON_VALUE(i_object,"$.montoDescuento"),
			JSON_VALUE(i_object,"$.honorariosMedicos"),
			JSON_VALUE(i_object,"$.cargoTarjeta"),
			JSON_VALUE(i_object,"$.subtotal"),
			JSON_VALUE(i_object,"$.total"),
			JSON_VALUE(i_object,"$.efectivo"),
			JSON_VALUE(i_object,"$.cambio"),
			JSON_VALUE(i_object,"$.tarjeta"),
			JSON_VALUE(i_object,"$.transferencia"),
			JSON_VALUE(i_object,"$.estado"),
			JSON_VALUE(i_object,"$.estadoImpresion"),
			JSON_VALUE(i_object,"$.tipoOperacion"),
			JSON_VALUE(i_object,"$.clasificacion"),
			JSON_VALUE(i_object,"$.sector"),
			JSON_VALUE(i_object,"$.tipoCosto"),
			JSON_VALUE(i_object,"$.manoDeObra"),
			JSON_VALUE(i_object,"$.bodegaID"),
			JSON_VALUE(i_object,"$.nombreCliente"),
			JSON_VALUE(i_object,"$.montoLetras"),
			JSON_VALUE(i_object,"$.cajaID"),
			JSON_VALUE(i_object,"$.corteID"),
			JSON_VALUE(i_object,"$.tipoCorte")
		  
	);
	

   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id
			,fechaVenta
			,cajeroID
			,clienteID
			,documentoID
			,numeroDocumento
			,serieDocumento
			,formaPagoID
			,codDescuento
			,montoDescuento
			,honorariosMedicos
			,cargoTarjeta
			,subtotal
			,total
			,efectivo
			,cambio
			,tarjeta
			,transferencia
			,estado
			,estadoImpresion
			,tipoOperacion
			,clasificacion
			,sector
			,tipoCosto
			,manoDeObra
			,bodegaID
			,nombreCliente
			,montoLetras
			,cajaID
			,corteID
			,tipoCorte
			
	FROM 	venta
	WHERE   id = w_id;
   
END;

;;

DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_venta;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_venta( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id
				,fechaVenta
				,cajeroID
				,clienteID
				,documentoID
				,numeroDocumento
				,serieDocumento
				,formaPagoID
				,codDescuento
				,montoDescuento
				,honorariosMedicos
				,cargoTarjeta
				,subtotal
				,total
				,efectivo
				,cambio
				,tarjeta
				,transferencia
				,estado
				,estadoImpresion
				,tipoOperacion
				,clasificacion
				,sector
				,tipoCosto
				,manoDeObra
				,bodegaID
				,nombreCliente
				,montoLetras
				,cajaID
				,corteID
				,tipoCorte
				
		FROM 	venta
		WHERE   id = i_id;
END;

;;
 
		 

DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_corte;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_corte( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id
				,tipoCorte
				,cortePadre
				,fechaInicio
				,fechaCorte
				,montoApertura
				,tiqueteInicial
				,tiqueteFinal
				,ventasGravadasTKT
				,totalTiquete
				,facturaInicial
				,facturaFinal
				,ventasGravadasFCT
				,totalFCT
				,CCFInicial
				,CCFFinal
				,ventasGravadasCCF
				,totalCCF
				,montoValesIngreso
				,montoValesEgreso
				,efectivoCaja
				,horaInicio
				,horaCierre
				,estado
				,cajeroID
				,cajaID
				,areaID
				,totalCredito
				,totalContado
				,totalIngresos
				,totalAnulado
				,totalTarjeta
				,totalTransferencia
				,totalMixto
				,haberCaja
				,subtotal
				,totalGeneral
				,sobrante
				,faltante
		FROM 	corte
		WHERE   id = i_id;
END;

;;
 
				 