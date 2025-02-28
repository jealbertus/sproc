DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_DELETE_unidad_medida;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_DELETE_unidad_medida
( 
    i_id int(12)
) 
 BEGIN 
 DELETE  FROM unidad_medida
WHERE      id = i_id;

 END; 

;;