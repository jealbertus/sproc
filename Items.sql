DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_CAFETERIA_FILTER_item;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_CAFETERIA_FILTER_item(
	i_filter varchar(256)
)
	BEGIN 
		SELECT   
				id,
				descripcion,
				catalogoID,
				cuentaID,
				areaID,
				unidadMedidaID,
				costo,
				precio,
				productoTerminado,
				materiaPrima,
				peso,
				categoriaID,
				IFNULL(CONCAT('../HospitalAPI/Upload/Cafeteria/',imagen),'../HospitalAPI/Upload/Cafeteria/12.jpg') AS imgPath,					
				imagen						
				
		FROM 	item			
	WHERE descripcion LIKE CONCAT('%', i_filter , '%') AND areaID = 17;
END; 

;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTERS_item;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTERS_item(
	IN i_object JSON
)
	BEGIN 
	 
		SELECT   
				id,
				descripcion,
				catalogoID,
				cuentaID,
				areaID,
				unidadMedidaID,
				costo,
				precio,
				productoTerminado,
				materiaPrima,
				peso,
				categoriaID,
				IFNULL(CONCAT('../HospitalAPI/Upload/Cafeteria/',imagen),'../HospitalAPI/Upload/Cafeteria/12.jpg') AS imgPath,					
				imagen						
				
		FROM 	item			
	WHERE  areaID = JSON_VALUE(i_object,"$.areaID");
			 
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
		SELECT   
				id,
				descripcion,
				catalogoID,
				cuentaID,
				areaID,
				unidadMedidaID,
				costo,
				precio,
				productoTerminado,
				materiaPrima,
				peso,
				categoriaID,
				IFNULL(CONCAT('../HospitalAPI/Upload/Cafeteria/',imagen),'../HospitalAPI/Upload/Cafeteria/12.jpg') AS imgPath,					
				imagen						
				
		FROM 	item			
	WHERE descripcion LIKE CONCAT('%', i_filter , '%');
END; 

;;

		
 
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_item;
;;  
 
DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_item( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,
				descripcion,
				catalogoID,
				cuentaID,
				areaID,
				unidadMedidaID,
				costo,
				precio,
				productoTerminado,
				materiaPrima,
				peso,
				categoriaID,
				IFNULL(CONCAT('../HospitalAPI/Upload/Cafeteria/',imagen),'../HospitalAPI/Upload/Cafeteria/12.jpg') AS imgPath,					
				imagen						
				
		FROM 	item
		WHERE   categoriaID = i_id;
END;
 ;; 
		
		
DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_item;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_item( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id,
				descripcion,
				catalogoID,
				cuentaID,
				areaID,
				unidadMedidaID,
				costo,
				precio,
				productoTerminado,
				materiaPrima,
				peso,
				categoriaID,
				IFNULL(CONCAT('../HospitalAPI/Upload/Cafeteria/',imagen),'../HospitalAPI/Upload/Cafeteria/12.jpg') AS imgPath,					
				imagen			
				
		FROM 	item
		WHERE   id = i_id;
END;

;;
 
				