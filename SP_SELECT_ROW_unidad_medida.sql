DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_unidad_medida;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_unidad_medida( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id
				,unidadMedida
				
		FROM 	unidad_medida
		WHERE   id = i_id;
END;

;;
 
		