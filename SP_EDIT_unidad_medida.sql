DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_unidad_medida;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_unidad_medida(
	 
	 IN i_object JSON
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   unidad_medida
	 SET  
		 
			,unidadMedida=JSON_VALUE(i_object,"$.unidadMedida")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");

END;
;; 