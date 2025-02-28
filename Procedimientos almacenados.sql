DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTERS_item;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTERS_item(
	IN i_object JSON
)
	BEGIN 
	SELECT 	id,
			descripcion,
			catalogoID,
			cuentaID,
			areaID,
			unidadMedidaID,
			precio
	FROM item
	WHERE  areaID = JSON_VALUE(i_object,"$.areaID");
			 
END; 

;;

/*
{ "areaID":"16"}

CALL SP_SELECT_ROWS_FILTERS_item('{ "areaID":"16"}');

*/

DELIMITER ;; 
 
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_item;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_item( 
    i_id int(12)
) 
BEGIN 
 
		SELECT 	id,
			descripcion,
			catalogoID,
			cuentaID,
			areaID,
			unidadMedidaID,
			precio
		FROM 	item
		WHERE   categoriaID = i_id;
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
				precio
		FROM 	item
		WHERE   id = i_id;
END;

;;		

 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS JSON_PENDING_PRINTING_TIKKET;
;;


DELIMITER ;;
CREATE PROCEDURE JSON_PENDING_PRINTING_TIKKET()
	BEGIN 
	SELECT 	id,
			fechaVenta,
			cajeroID,
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
			estado,
			tipoOperacion,
			clasificacion,
			sector,
			tipoCosto,
			manoDeObra,
			bodegaID
	FROM venta 
	WHERE estadoImpresion = 1;
END; 
 
;; 

  
DELIMITER ;;  
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_venta_detalle;
;;

DELIMITER ;;   
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_venta_detalle( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id
				,ventaID
				,descripcion
				,cantidad
				,precio
				,descuento
				,subtotal
				
		FROM 	venta_detalle
		WHERE   ventaID = i_id;
END;
;; 
		
		DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_venta_detalle;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_venta_detalle(
 IN i_object JSON
)
BEGIN 
 	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  venta_detalle
    ( 
        ventaID
			,itemID
			,cantidad
			,precio
			,descuento
			,subtotal
			
    ) VALUES(
					JSON_VALUE(i_object,"$.ventaID"),
			JSON_VALUE(i_object,"$.itemID"),
			JSON_VALUE(i_object,"$.cantidad"),
			JSON_VALUE(i_object,"$.precio"),
			JSON_VALUE(i_object,"$.descuento"),
			JSON_VALUE(i_object,"$.subtotal")
		  
	);
	

   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id
			,ventaID
			,itemID
			,cantidad
			,precio
			,descuento
			,subtotal
			
	FROM 	venta_detalle
	WHERE   id = w_id;
   
END;

;;

DELIMITER ;; 		
DROP PROCEDURE IF EXISTS  SP_ADD_venta_detalle;
;;
 
 
 DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_venta_detalle(
	IN 
    i_id	int,
	i_ventaID	int,
	i_itemID	int,
	i_descripcion varchar(256),
	i_cantidad	decimal(14,4),
	i_precio	decimal(14,4),
	i_descuento	decimal(14,4),
	i_subtotal	decimal(14,4)
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
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
		 
		i_ventaID,
		i_itemID,
		i_cantidad,
		i_precio,
		i_descuento,
		i_subtotal
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
		id,
		ventaID,
		itemID,
		cantidad,
		precio,
		descuento,
		subtotal
	FROM 	venta_detalle
	WHERE   id = w_id;
   
END;

;; 		

DELIMITER ;; 	
DROP PROCEDURE IF EXISTS  SP_ADD_POS_venta;
;;
 
 
DELIMITER ;; 	 
CREATE   PROCEDURE SP_ADD_POS_venta(
	IN 
    i_id	int,
	i_fechaVenta	datetime,
	i_cajeroID	int,
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
	i_tipoOperacion	int,
	i_clasificacion	int,
	i_sector	int,
	i_tipoCosto	int,
	i_manoDeObra	int,
	i_bodegaID	int,
	i_nombreCliente varchar(256),
	i_cajaID int,
	i_corteID	int 
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date datetime;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
	
    INSERT INTO  venta
    ( 
      
		fechaVenta,
		cajeroID,
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
		estado,
		tipoOperacion,
		clasificacion,
		sector,
		tipoCosto,
		manoDeObra,
		bodegaID,
		cajaID,
		corteID
    )
    VALUES  
    ( 
 
		w_add_date,
		i_cajeroID,
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
		i_estado,
		i_tipoOperacion,
		i_clasificacion,
		i_sector,
		i_tipoCosto,
		i_manoDeObra,
		i_bodegaID,
		i_cajaID,
		i_corteID
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id,
			fechaVenta,
			cajeroID,
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
			estado,
			tipoOperacion,
			clasificacion,
			sector,
			tipoCosto,
			manoDeObra,
			bodegaID,
			cajaID,
			corteID
	FROM 	venta
	WHERE   id = w_id;
   
END;
;;
 
 
DELIMITER ;; 	 
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_venta_detalle;
;; 
 
 
DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_venta_detalle( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				venta_detalle.id,
				ventaID,
				itemID,
				descripcion,
				FORMAT(cantidad,2) as cantidad,
				FORMAT(venta_detalle.precio,2) as precio,
				descuento,
				FORMAT(subtotal,2) AS subtotal
		FROM 	venta_detalle INNER JOIN item ON
		         venta_detalle.itemID = item.id
		WHERE   ventaID = i_id;
END; 
;; 

DELIMITER ;; 	
DROP PROCEDURE IF EXISTS SP_GET_POS_LIST;
;;


DELIMITER ;; 	
CREATE PROCEDURE SP_GET_POS_LIST(
	 
)
	BEGIN 
	
	
	DECLARE w_id INT(12);
    DECLARE w_add_date datetime;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = CURDATE(); 
    SET w_add_time  = CURTIME();
	
	SELECT id,
		DATE_FORMAT(fechaVenta,"%d/%m/%Y") AS fechaVenta,
		cajeroID,
		clienteID,
		IFNULL(nombreCliente,'') AS nombreCliente,
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
		estado,
		tipoOperacion,
		clasificacion,
		sector,
		tipoCosto,
		manoDeObra,
		bodegaID
	FROM venta
	WHERE  DATE_FORMAT(fechaVenta,"%d/%m/%Y") = DATE_FORMAT(w_add_date,"%d/%m/%Y")
	ORDER BY id DESC;
	
END; 

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_venta_detalle;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_venta_detalle(
	IN 
	 i_id	int,i_ventaID	int,i_itemID	int,i_descripcion varchar(256),i_cantidad	decimal(14,4),i_precio	decimal(14,4),i_descuento	decimal(14,4),i_subtotal	decimal(14,4)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   venta_detalle
	 SET  
		id=i_id,ventaID=i_ventaID,itemID=i_itemID,cantidad=i_cantidad,precio=i_precio,descuento=i_descuento,subtotal=i_subtotal
	WHERE      id = i_id;

END;
;; 


DELIMITER ;; 		
DROP PROCEDURE IF EXISTS  SP_ADD_venta_detalle;
;;
 
 
 DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_venta_detalle(
	IN 
    i_id	int,
	i_ventaID	int,
	i_itemID	int,
	i_descripcion varchar(256),
	i_cantidad	decimal(14,4),
	i_precio	decimal(14,4),
	i_descuento	decimal(14,4),
	i_subtotal	decimal(14,4)
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
	DECLARE w_totalRows INT;
	
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
	SET w_totalRows = (
		SELECT COUNT(1)
		FROM venta_detalle
		WHERE itemID = i_itemID AND ventaID = i_ventaID
	);
	
	
	IF w_totalRows = 0 THEN 
	
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
			 
			i_ventaID,
			i_itemID,
			i_cantidad,
			i_precio,
			i_descuento,
			i_subtotal
		);
	   
	   
		SET w_id = ( SELECT LAST_INSERT_ID() );
   ELSE 
   
	 UPDATE venta_detalle 
	 SET cantidad = cantidad + 1 ,
	     subtotal = cantidad * precio
	 WHERE itemID = i_itemID AND ventaID = i_ventaID;
   
   
   END IF;
   
	SELECT   
			id,
		ventaID,
		itemID,
		cantidad,
		precio,
		descuento,
		subtotal
	FROM 	venta_detalle
	WHERE   id = w_id;
   
END;

;; 		


DELIMITER ;; 	
DROP PROCEDURE IF EXISTS  SP_ADD_POS_venta;
;;
 
 
DELIMITER ;; 	 
CREATE   PROCEDURE SP_ADD_POS_venta(
	IN 
    i_id	int,
	i_fechaVenta	datetime,
	i_cajeroID	int,
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
	i_estadoImpresion	int,
	i_tipoOperacion	int,
	i_clasificacion	int,
	i_sector	int,
	i_tipoCosto	int,
	i_manoDeObra	int,
	i_bodegaID	int,
	i_nombreCliente	varchar(256)
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date datetime;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
	
    INSERT INTO  venta
    ( 
      
		fechaVenta,
		cajeroID,
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
		estado,
		tipoOperacion,
		clasificacion,
		sector,
		tipoCosto,
		manoDeObra,
		bodegaID,
		nombreCliente
    )
    VALUES  
    ( 
 
		w_add_date,
		i_cajeroID,
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
		i_estado,
		i_tipoOperacion,
		i_clasificacion,
		i_sector,
		i_tipoCosto,
		i_manoDeObra,
		i_bodegaID,
		i_nombreCliente
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id,
			fechaVenta,
			cajeroID,
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
			estado,
			tipoOperacion,
			clasificacion,
			sector,
			tipoCosto,
			manoDeObra,
			bodegaID
	FROM 	venta
	WHERE   id = w_id;
   
END;
;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_venta;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_venta(
	IN 
	 i_id	int,
	 i_fechaVenta	datetime,
	 i_cajeroID	int,
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
	 i_estadoImpresion	int,
	 i_tipoOperacion	int,
	 i_clasificacion	int,
	 i_sector	int,
	 i_tipoCosto	int,
	 i_manoDeObra	int,
	 i_bodegaID	int,
	 i_nombreCliente varchar(256)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   venta
	 SET  
		  documentoID=i_documentoID,
		  numeroDocumento=i_numeroDocumento,
		  serieDocumento=i_serieDocumento,
		  formaPagoID=i_formaPagoID,
		  codDescuento=i_codDescuento,
		  montoDescuento=i_montoDescuento,
		  honorariosMedicos=i_honorariosMedicos,
		  cargoTarjeta=i_cargoTarjeta,
		  subtotal=i_subtotal,
		  total=i_total,
		  efectivo=i_efectivo,
		  cambio=i_cambio,
		  estado=i_estado,
		  estadoImpresion=i_estadoImpresion,
		  tipoOperacion=i_tipoOperacion,
		  clasificacion=i_clasificacion,
		  sector=i_sector,
		  tipoCosto=i_tipoCosto,
		  manoDeObra=i_manoDeObra,
		  bodegaID=i_bodegaID
	WHERE      id = i_id;

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
				,estado
				,estadoImpresion
				,tipoOperacion
				,clasificacion
				,sector
				,tipoCosto
				,manoDeObra
				,bodegaID
				,nombreCliente
				
		FROM 	venta
		WHERE   id = i_id;
END;

;;
 

DELIMITER ;; 	
DROP PROCEDURE IF EXISTS SP_GET_POS_LIST;
;;


DELIMITER ;; 	
CREATE PROCEDURE SP_GET_POS_LIST(
	 
)
	BEGIN 
	
	
	DECLARE w_id INT(12);
    DECLARE w_add_date datetime;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = CURDATE(); 
    SET w_add_time  = CURTIME();
	
	SELECT id,
		DATE_FORMAT(fechaVenta,"%d/%m/%Y") AS fechaVenta,
		cajeroID,
		clienteID,
		IFNULL(nombreCliente,'') AS nombreCliente,
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
		estado,
		tipoOperacion,
		clasificacion,
		sector,
		tipoCosto,
		manoDeObra,
		bodegaID
	FROM venta
	WHERE  DATE_FORMAT(fechaVenta,"%d/%m/%Y") = DATE_FORMAT(w_add_date,"%d/%m/%Y")
	       AND estado = 1
	ORDER BY id DESC;
	
END; 

;;


DELIMITER ;; 	
DROP PROCEDURE IF EXISTS SP_GET_COMPLETE_POS_LIST;
;;


DELIMITER ;; 	
CREATE PROCEDURE SP_GET_COMPLETE_POS_LIST(
	 
)
	BEGIN 
	
	
	DECLARE w_id INT(12);
    DECLARE w_add_date datetime;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = CURDATE(); 
    SET w_add_time  = CURTIME();
	
	SELECT id,
		DATE_FORMAT(fechaVenta,"%d/%m/%Y") AS fechaVenta,
		cajeroID,
		clienteID,
		IFNULL(nombreCliente,'') AS nombreCliente,
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
		estado,
		tipoOperacion,
		clasificacion,
		sector,
		tipoCosto,
		manoDeObra,
		bodegaID
	FROM venta
	WHERE  DATE_FORMAT(fechaVenta,"%d/%m/%Y") = DATE_FORMAT(w_add_date,"%d/%m/%Y")
	       AND estado = 2
	ORDER BY id DESC;
	
END; 

;;



DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_addRow_corte;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_addRow_corte(
 IN i_object JSON
)
BEGIN 
 	DECLARE w_id INT(12);
    DECLARE w_add_date DATETIME;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  corte
    ( 
			tipoCorte
			,cortePadre
			,fechaInicio
			,fechaCorte
			,montoApertura
			,montoVenta
			,montoValesIngreso
			,montoValesEgreso
			,efectivoCaja
			,horaInicio
			,horaCierre
			,estado
			,cajeroID
			,cajaID
			,areaID
			
    ) VALUES(
			JSON_VALUE(i_object,"$.tipoCorte"),
			JSON_VALUE(i_object,"$.cortePadre"),
			w_add_date,
			JSON_VALUE(i_object,"$.fechaCorte"),
			JSON_VALUE(i_object,"$.montoApertura"),
			JSON_VALUE(i_object,"$.montoVenta"),
			JSON_VALUE(i_object,"$.montoValesIngreso"),
			JSON_VALUE(i_object,"$.montoValesEgreso"),
			JSON_VALUE(i_object,"$.efectivoCaja"),
			w_add_time,
			JSON_VALUE(i_object,"$.horaCierre"),
			JSON_VALUE(i_object,"$.estado"),
			JSON_VALUE(i_object,"$.cajeroID"),
			JSON_VALUE(i_object,"$.cajaID"),
			JSON_VALUE(i_object,"$.areaID")
		  
	);
	

   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id
			,tipoCorte
			,cortePadre
			,fechaInicio
			,fechaCorte
			,montoApertura
			,montoVenta
			,montoValesIngreso
			,montoValesEgreso
			,efectivoCaja
			,horaInicio
			,horaCierre
			,estado
			,cajeroID
			,cajaID
			,areaID
			
	FROM 	corte
	WHERE   id = w_id;
   
END;

;;

 

DELIMITER ;;  
DROP PROCEDURE IF EXISTS  SP_editRow_corte;
;;

DELIMITER ;; 
CREATE  PROCEDURE SP_editRow_corte(
    IN i_object JSON
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   corte
	 SET  
					 
			tipoCorte=JSON_VALUE(i_object,"$.tipoCorte"),
			cortePadre=JSON_VALUE(i_object,"$.cortePadre"),
			fechaInicio=JSON_VALUE(i_object,"$.fechaInicio"),
			fechaCorte=JSON_VALUE(i_object,"$.fechaCorte"),
			montoApertura=JSON_VALUE(i_object,"$.montoApertura"),
			montoVenta=JSON_VALUE(i_object,"$.montoVenta"),
			montoValesIngreso=JSON_VALUE(i_object,"$.montoValesIngreso"),
			montoValesEgreso=JSON_VALUE(i_object,"$.montoValesEgreso"),
			efectivoCaja=JSON_VALUE(i_object,"$.efectivoCaja"),
			horaInicio=JSON_VALUE(i_object,"$.horaInicio"),
			horaCierre=JSON_VALUE(i_object,"$.horaCierre"),
			estado=JSON_VALUE(i_object,"$.estado"),
			cajeroID=JSON_VALUE(i_object,"$.cajeroID"),
			cajaID=JSON_VALUE(i_object,"$.cajaID"),
			areaID=JSON_VALUE(i_object,"$.areaID")
	WHERE      id = i_id;
	
	SELECT   
			id,tipoCorte,cortePadre,fechaInicio,fechaCorte,montoApertura,montoVenta,montoValesIngreso,montoValesEgreso,efectivoCaja,horaInicio,horaCierre,estado,cajeroID,cajaID,areaID
	FROM 	corte
	WHERE   id = i_id;

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
	SELECT 	id,
			descripcion,
			catalogoID,
			cuentaID,
			areaID,
			unidadMedidaID,
			precio,
			IFNULL(imagen,'assets/img/bg/12.jpg') AS imagen
	FROM item
	WHERE  areaID = JSON_VALUE(i_object,"$.areaID");
			 
END; 

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_item;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_item(
	IN 
	 i_id	int(11),
	 i_descripcion	varchar(256),
	 i_catalogoID	int(11),
	 i_cuentaID	int(11),
	 i_areaID	int(11),
	 i_unidadMedidaID	int(11),
	 i_precio	decimal(14,2),
	 i_costo	decimal(14,4),
	 i_categoriaID	int(12),
	 i_presentacionID	int(12),
	 i_imagen	varchar(256),
	 i_imgPath  varchar(256),
	 i_productoTerminado	int(11),
	 i_materiaPrima	int(11),
	 i_peso	decimal(14,4)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   item
	 SET  
		descripcion=i_descripcion,
		catalogoID=i_catalogoID,
		cuentaID=i_cuentaID,
		areaID=i_areaID,
		unidadMedidaID=i_unidadMedidaID,
		precio=i_precio,
		costo=i_costo,
		categoriaID=i_categoriaID,
		presentacionID=i_presentacionID,
		imagen=i_imagen,
		productoTerminado=i_productoTerminado,
		materiaPrima=i_materiaPrima,
		peso=i_peso
	WHERE      id = i_id;

END;
;; 


		$command 			= 	"call SP_EDIT_item(
		:id,
		:descripcion,
		:catalogoID,
		:cuentaID,
		:areaID,
		:unidadMedidaID,
		:precio,
		:costo,
		:categoriaID,
		:presentacionID,
		:imagen,
		:productoTerminado,
		:materiaPrima,
		:peso);"; 
		
		
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_item;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_item(
 	IN 
	 i_id	int(11),
	 i_descripcion	varchar(256),
	 i_catalogoID	int(11),
	 i_cuentaID	int(11),
	 i_areaID	int(11),
	 i_unidadMedidaID	int(11),
	 i_precio	decimal(14,2),
	 i_costo	decimal(14,4),
	 i_categoriaID	int(12),
	 i_presentacionID	int(12),
	 i_imagen	varchar(256),
	 i_imgPath  varchar(256),
	 i_productoTerminado	int(11),
	 i_materiaPrima	int(11),
	 i_peso	decimal(14,4)
)
BEGIN 
 	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  item
    ( 
             descripcion
			,catalogoID
			,cuentaID
			,areaID
			,unidadMedidaID
			,precio
			,costo
			,categoriaID
			,presentacionID
			,imagen
			,productoTerminado
			,materiaPrima
			,peso
			
    ) VALUES(
			i_descripcion,
			i_catalogoID,
			i_cuentaID,
			i_areaID,
			i_unidadMedidaID,
			i_precio,
			i_costo,
			i_categoriaID,
			i_presentacionID,
			i_imagen,
			i_productoTerminado,
			i_materiaPrima,
			i_peso
		  
	);
	

   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id
			,descripcion
			,catalogoID
			,cuentaID
			,areaID
			,unidadMedidaID
			,precio
			,costo
			,categoriaID
			,presentacionID
			,imagen
			,productoTerminado
			,materiaPrima
			,peso
			
	FROM 	item
	WHERE   id = w_id;
   
END;

;;

 		
		
		
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_cafeteria_settings;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_cafeteria_settings(
	IN 
	 i_id	int(11),i_ultimoTKT	varchar(256),i_giro	varchar(256),i_ultimoCCF	varchar(256),i_ultimoFCT	varchar(256)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   cafeteria_settings
	 SET  
		 ultimoTKT=i_ultimoTKT,giro=i_giro,ultimoCCF=i_ultimoCCF,ultimoFCT=i_ultimoFCT
	WHERE      id = i_id;

END;
;; 		


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_caja;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_caja()
	BEGIN 
	SELECT id,nombreCaja,estado
	FROM caja;
END; 
 
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_cajero;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_cajero()
	BEGIN 
	SELECT id,nombreCajero
	FROM cajero;
END; 
 
;; 


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_cafeteria_settings;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_cafeteria_settings( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id
				,CAST(ultimoTKT AS int) + 1 AS ultimoTKT
				,giro
				,ultimoCCF
				,ultimoFCT
				
		FROM 	cafeteria_settings
		WHERE   id = i_id;
END;

;;
 
		
		
		
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_venta;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_venta(
	IN 
	 i_id	int,
	 i_fechaVenta	datetime,
	 i_cajeroID	int,
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
	 i_estadoImpresion	int,
	 i_tipoOperacion	int,
	 i_clasificacion	int,
	 i_sector	int,
	 i_tipoCosto	int,
	 i_manoDeObra	int,
	 i_bodegaID	int,
	 i_nombreCliente varchar(256)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   venta
	 SET  
		  documentoID=i_documentoID,
		  numeroDocumento=i_numeroDocumento,
		  serieDocumento=i_serieDocumento,
		  formaPagoID=i_formaPagoID,
		  codDescuento=i_codDescuento,
		  montoDescuento=i_montoDescuento,
		  honorariosMedicos=i_honorariosMedicos,
		  cargoTarjeta=i_cargoTarjeta,
		  subtotal=i_subtotal,
		  total=i_total,
		  efectivo=i_efectivo,
		  cambio=i_cambio,
		  estado=i_estado,
		  estadoImpresion=i_estadoImpresion,
		  tipoOperacion=i_tipoOperacion,
		  clasificacion=i_clasificacion,
		  sector=i_sector,
		  tipoCosto=i_tipoCosto,
		  manoDeObra=i_manoDeObra,
		  bodegaID=i_bodegaID
	WHERE      id = i_id;
	
	
	UPDATE cafeteria_settings
	SET ultimoTKT = i_numeroDocumento
	WHERE id = 1;
	

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
				,estado
				,estadoImpresion
				,tipoOperacion
				,clasificacion
				,sector
				,tipoCosto
				,manoDeObra
				,bodegaID
				,nombreCliente
				
		FROM 	venta
		WHERE   id = i_id;
END;

;;		



DELIMITER ;; 
DROP PROCEDURE IF EXISTS  Login;
;;

DELIMITER ;;
CREATE  PROCEDURE Login(
	IN 
	 i_id	int(11),
	 i_login	varchar(255),
	 i_nombres	varchar(255),
	 i_apellidos	varchar(255),
	 i_rol	int(11),
	 i_clave	varbinary(256),
	 i_activo	int(11)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 
		SELECT   
				id
				,nombres
				,apellidos
				,rol
			 
				
		FROM 	usuario
		WHERE   login = i_login AND clave = i_clave;

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
				id
				,nombres
				,apellidos
				,rol
				,clave
				
		FROM 	usuario
		WHERE   id = i_id;
END;

;;
 
		
		
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_usuario;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_usuario(
 IN i_model JSON
)
BEGIN 
 	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  usuario
    ( 
			login
			,nombres
			,apellidos
			,rol
			,clave
			,activo
			
    ) VALUES(
			JSON_VALUE(i_model,"$.login"),
			JSON_VALUE(i_model,"$.nombres"),
			JSON_VALUE(i_model,"$.apellidos"),
			JSON_VALUE(i_model,"$.rol"),
			JSON_VALUE(i_model,"$.clave"),
			JSON_VALUE(i_model,"$.activo")
		  
	);
	

   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id
			,login
			,nombres
			,apellidos
			,rol
 			,activo
			
	FROM 	usuario
	WHERE   id = w_id;
   
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
				id
				,login
				,nombres
				,apellidos
				,rol
				,clave
				,activo
				
		FROM 	usuario
		WHERE   id = i_id;
END;

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_usuario;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_usuario(
	IN 
	 i_id	int(11),
	 i_login	varchar(256),
	 i_nombres	varchar(255),
	 i_apellidos	varchar(255),
	 i_rol	int(11),
	 i_clave	varbinary(256),
	 i_activo	int(1)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   usuario
	 SET  
		 
		login=i_login,
		nombres=i_nombres,
		apellidos=i_apellidos,
		rol=i_rol,
		clave=i_clave,
		activo=i_activo
	WHERE      id = i_id;

END;
;; 
 
				
				
				
call Login(
	0,
	 'jealbertus',
	 '',
	 '',
	 '',
	 '123',
	 1
);				


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_venta;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_venta(
	IN 
	 i_id	int,
	 i_fechaVenta	datetime,
	 i_cajeroID	int,
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
	 i_estadoImpresion	int,
	 i_tipoOperacion	int,
	 i_clasificacion	int,
	 i_sector	int,
	 i_tipoCosto	int,
	 i_manoDeObra	int,
	 i_bodegaID	int,
	 i_nombreCliente varchar(256),
	 i_cajaID int,
	 i_corteID int 
 
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   venta
	 SET  
		  documentoID=i_documentoID,
		  numeroDocumento=i_numeroDocumento,
		  serieDocumento=i_serieDocumento,
		  formaPagoID=i_formaPagoID,
		  codDescuento=i_codDescuento,
		  montoDescuento=i_montoDescuento,
		  honorariosMedicos=i_honorariosMedicos,
		  cargoTarjeta=i_cargoTarjeta,
		  subtotal=i_subtotal,
		  total=i_total,
		  efectivo=i_efectivo,
		  cambio=i_cambio,
		  estado=i_estado,
		  estadoImpresion=i_estadoImpresion,
		  tipoOperacion=i_tipoOperacion,
		  clasificacion=i_clasificacion,
		  sector=i_sector,
		  tipoCosto=i_tipoCosto,
		  manoDeObra=i_manoDeObra,
		  bodegaID=i_bodegaID,
		  nombreCliente = i_nombreCliente
	WHERE      id = i_id;
	
	
	UPDATE cafeteria_settings
	SET ultimoTKT = i_numeroDocumento
	WHERE id = 1;


	SELECT   
			id,
			fechaVenta,
			cajeroID,
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
			estado,
			tipoOperacion,
			clasificacion,
			sector,
			tipoCosto,
			manoDeObra,
			bodegaID
	FROM 	venta
	WHERE   id = i_id;	

END;
;; 

DELIMITER ;; 	
DROP PROCEDURE IF EXISTS  SP_ADD_POS_venta;
;;
 
 
DELIMITER ;; 	 
CREATE   PROCEDURE SP_ADD_POS_venta(
	IN 
    i_id	int,
	i_fechaVenta	datetime,
	i_cajeroID	int,
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
	i_estadoImpresion	int,
	i_tipoOperacion	int,
	i_clasificacion	int,
	i_sector	int,
	i_tipoCosto	int,
	i_manoDeObra	int,
	i_bodegaID	int,
	i_nombreCliente	varchar(256),
	i_cajaID int,
	i_corteID int
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date datetime;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
	
    INSERT INTO  venta
    ( 
      
		fechaVenta,
		cajeroID,
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
		estado,
		tipoOperacion,
		clasificacion,
		sector,
		tipoCosto,
		manoDeObra,
		bodegaID,
		nombreCliente,
		cajaID,
		corteID
    )
    VALUES  
    ( 
 
		w_add_date,
		i_cajeroID,
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
		i_estado,
		i_tipoOperacion,
		i_clasificacion,
		i_sector,
		i_tipoCosto,
		i_manoDeObra,
		i_bodegaID,
		i_nombreCliente,
		i_cajaID,
		i_corteID
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id,
			fechaVenta,
			cajeroID,
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
			estado,
			tipoOperacion,
			clasificacion,
			sector,
			tipoCosto,
			manoDeObra,
			bodegaID
	FROM 	venta
	WHERE   id = w_id;
   
END;
;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_proveedor;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_proveedor(
 IN i_object JSON
)
BEGIN 
 	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  proveedor
    ( 
        nombreProveedor
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
			
    ) VALUES(
			JSON_VALUE(i_object,"$.nombreProveedor"),
			JSON_VALUE(i_object,"$.nit"),
			JSON_VALUE(i_object,"$.dui"),
			JSON_VALUE(i_object,"$.nrc"),
			JSON_VALUE(i_object,"$.direccion"),
			JSON_VALUE(i_object,"$.numeroCasa"),
			JSON_VALUE(i_object,"$.numeroApto"),
			JSON_VALUE(i_object,"$.telefono"),
			JSON_VALUE(i_object,"$.email"),
			JSON_VALUE(i_object,"$.giroID"),
			JSON_VALUE(i_object,"$.pais"),
			JSON_VALUE(i_object,"$.departamento"),
			JSON_VALUE(i_object,"$.municipio"),
			JSON_VALUE(i_object,"$.distrito"),
			JSON_VALUE(i_object,"$.tipoProveedor"),
			JSON_VALUE(i_object,"$.tipoPersona"),
			JSON_VALUE(i_object,"$.sujetoExcluido"),
			JSON_VALUE(i_object,"$.representanteLegal")
		  
	);
	

   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id
			,nombreProveedor
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
	WHERE   id = w_id;
   
END;

;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_proveedor;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_proveedor(
	 
	 IN i_object JSON
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   proveedor
	 SET  
		 
			 nombreProveedor=JSON_VALUE(i_object,"$.nombreProveedor")
			,nit=JSON_VALUE(i_object,"$.nit")
			,dui=JSON_VALUE(i_object,"$.dui")
			,nrc=JSON_VALUE(i_object,"$.nrc")
			,direccion=JSON_VALUE(i_object,"$.direccion")
			,numeroCasa=JSON_VALUE(i_object,"$.numeroCasa")
			,numeroApto=JSON_VALUE(i_object,"$.numeroApto")
			,telefono=JSON_VALUE(i_object,"$.telefono")
			,email=JSON_VALUE(i_object,"$.email")
			,giroID=JSON_VALUE(i_object,"$.giroID")
			,pais=JSON_VALUE(i_object,"$.pais")
			,departamento=JSON_VALUE(i_object,"$.departamento")
			,municipio=JSON_VALUE(i_object,"$.municipio")
			,distrito=JSON_VALUE(i_object,"$.distrito")
			,tipoProveedor=JSON_VALUE(i_object,"$.tipoProveedor")
			,tipoPersona=JSON_VALUE(i_object,"$.tipoPersona")
			,sujetoExcluido=JSON_VALUE(i_object,"$.sujetoExcluido")
			,representanteLegal=JSON_VALUE(i_object,"$.representanteLegal")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");

END;
;; 


DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_proveedor;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_proveedor( 
    i_id int(12)
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
		WHERE   id = i_id;
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
	SELECT id,descripcion,clave,namespace,id_virtual
	FROM catalogo_general
	WHERE  		clave = i_filter;  
		 
END; 

;;


 
DELIMITER ;;  
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_compradetalle;
;;

DELIMITER ;; 
 CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_compradetalle( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				compradetalle.id
				,compraID
				,itemID
				,descripcion
				,cantidad
				,costoGravado
				,costoExento
				,costoNoSujeto
				,descuento
				,subtotal
				,tipoOperacion
				,clasificacion
				,sector
				,tipoCostoGasto
				
		FROM 	compradetalle INNER JOIN item ON compradetalle.itemID = item.id
		WHERE   compraID = i_id;
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
				id
				,descripcion
				,catalogoID
				,cuentaID
				,areaID
				,unidadMedidaID
				,precio
				,costo
				,categoriaID
				,presentacionID
				,imagen
				,imgPath
				,productoTerminado
				,materiaPrima
				,peso
				
		FROM 	item
		WHERE   id = i_id;
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
	SELECT 	id,
			descripcion,
			catalogoID,
			cuentaID,
			areaID,
			unidadMedidaID,
			precio,
		    imagen,
 
			CONCAT('assets/img/bg/',imagen) AS imgPath
	FROM item
	WHERE  areaID = JSON_VALUE(i_object,"$.areaID");
			 
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
				id
				,descripcion
				,catalogoID
				,cuentaID
				,areaID
				,unidadMedidaID
				,precio
				,costo
				,categoriaID
				,presentacionID
				,imagen
				,CONCAT('assets/img/bg/',imagen) AS imgPath
				,productoTerminado
				,materiaPrima
				,peso
				
		FROM 	item
		WHERE   id = i_id;
END;

;;
 


 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_BY_PARENT_ID_item;
;;

DELIMITER ;; 
CREATE PROCEDURE SP_SELECT_ROWS_BY_PARENT_ID_item( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id
				,descripcion
				,catalogoID
				,cuentaID
				,areaID
				,unidadMedidaID
				,precio
				,costo
				,categoriaID
				,presentacionID
				,imagen
				,CONCAT('assets/img/bg/',imagen) AS imgPath
				,productoTerminado
				,materiaPrima
				,peso
		FROM 	( item INNER JOIN catalogo_general ON item.catalogoID=catalogo_general.id)
				  INNER JOIN unidad_medida ON item.unidadMedidaID=unidad_medida.id
		WHERE   catalogoID = i_id;
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
	id
				,descripcion
				,catalogoID
				,cuentaID
				,areaID
				,unidadMedidaID
				,precio
				,costo
				,categoriaID
				,presentacionID
				,imagen
				,CONCAT('assets/img/bg/',imagen) AS imgPath
				,productoTerminado
				,materiaPrima
				,peso
				
		FROM 	item
		WHERE   categoriaID = i_id AND areaID = 17;
END;
;;
 
		
		
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_proveedor;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_proveedor()
	BEGIN 
	SELECT id,nombreProveedor,nombreComercial,nit,dui,nrc,direccion,numeroCasa,numeroApto,telefono,email,giroID,pais,departamento,municipio,distrito,tipoProveedor,tipoPersona,sujetoExcluido,representanteLegal
	FROM proveedor;
END; 
 
;; 		


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_FILTER_proveedor;
;;

DELIMITER ;;
 
CREATE PROCEDURE SP_SELECT_ROWS_FILTER_proveedor(
	i_filter varchar(256)
)
	BEGIN 
	SELECT id,nombreProveedor,nombreComercial,nit,dui,nrc,direccion,numeroCasa,numeroApto,telefono,email,giroID,pais,departamento,municipio,distrito,tipoProveedor,tipoPersona,sujetoExcluido,representanteLegal
	FROM proveedor
	WHERE nombreProveedor LIKE CONCAT('%', i_filter , '%') OR  
nombreComercial LIKE CONCAT('%', i_filter , '%') OR  
nit LIKE CONCAT('%', i_filter , '%') OR  
dui LIKE CONCAT('%', i_filter , '%') OR  
nrc LIKE CONCAT('%', i_filter , '%') OR  
direccion LIKE CONCAT('%', i_filter , '%') OR  
numeroCasa LIKE CONCAT('%', i_filter , '%') OR  
numeroApto LIKE CONCAT('%', i_filter , '%') OR  
telefono LIKE CONCAT('%', i_filter , '%') OR  
email LIKE CONCAT('%', i_filter , '%') OR  
pais LIKE CONCAT('%', i_filter , '%') OR  
representanteLegal LIKE CONCAT('%', i_filter , '%');
END; 

;;

 
DELIMITER ;;  
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_contable;
;;
 
DELIMITER ;;   
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_contable( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id
				,codigo
				,nombre
				,tipoID
				,cuentaPadre
				,resumen
				,estado
				
		FROM 	contable
		WHERE   cuentaPadre = i_id;
END;
;; 
		
DELIMITER ;;  		
DROP PROCEDURE IF EXISTS SP_SELECT_ROWS_BY_PARENT_ID_contable;
;;

DELIMITER ;;   
CREATE PROCEDURE SP_SELECT_ROWS_BY_PARENT_ID_contable( 
    i_id int(12)
) 
BEGIN 
		SELECT   
				id
				,codigo
				,nombre
				,tipoID
				,cuentaPadre
				,resumen
				,estado
				
		FROM 	contable
		WHERE   tipoID = i_id;
END;
 ;;		
 
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_proveedor;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_proveedor(
 IN i_object JSON
)
BEGIN 
 	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  proveedor
    ( 
        nombreProveedor
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
			,plazo
			,cuentaContableID
			
    ) VALUES(
			JSON_VALUE(i_object,"$.nombreProveedor"),
			JSON_VALUE(i_object,"$.nombreComercial"),
			JSON_VALUE(i_object,"$.nit"),
			JSON_VALUE(i_object,"$.dui"),
			JSON_VALUE(i_object,"$.nrc"),
			JSON_VALUE(i_object,"$.direccion"),
			JSON_VALUE(i_object,"$.numeroCasa"),
			JSON_VALUE(i_object,"$.numeroApto"),
			JSON_VALUE(i_object,"$.telefono"),
			JSON_VALUE(i_object,"$.email"),
			JSON_VALUE(i_object,"$.giroID"),
			JSON_VALUE(i_object,"$.pais"),
			JSON_VALUE(i_object,"$.departamento"),
			JSON_VALUE(i_object,"$.municipio"),
			JSON_VALUE(i_object,"$.distrito"),
			JSON_VALUE(i_object,"$.tipoProveedor"),
			JSON_VALUE(i_object,"$.tipoPersona"),
			JSON_VALUE(i_object,"$.sujetoExcluido"),
			JSON_VALUE(i_object,"$.representanteLegal"),
			JSON_VALUE(i_object,"$.plazo"),
			JSON_VALUE(i_object,"$.cuentaContableID")
		  
	);
	

   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
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
			,plazo
			,cuentaContableID
			
	FROM 	proveedor
	WHERE   id = w_id;
   
END;

;;



DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_proveedor;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_proveedor(
	 
	 IN i_object JSON
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   proveedor
	 SET  
			id=JSON_VALUE(i_object,"$.id")
			,nombreProveedor=JSON_VALUE(i_object,"$.nombreProveedor")
			,nombreComercial=JSON_VALUE(i_object,"$.nombreComercial")
			,nit=JSON_VALUE(i_object,"$.nit")
			,dui=JSON_VALUE(i_object,"$.dui")
			,nrc=JSON_VALUE(i_object,"$.nrc")
			,direccion=JSON_VALUE(i_object,"$.direccion")
			,numeroCasa=JSON_VALUE(i_object,"$.numeroCasa")
			,numeroApto=JSON_VALUE(i_object,"$.numeroApto")
			,telefono=JSON_VALUE(i_object,"$.telefono")
			,email=JSON_VALUE(i_object,"$.email")
			,giroID=JSON_VALUE(i_object,"$.giroID")
			,pais=JSON_VALUE(i_object,"$.pais")
			,departamento=JSON_VALUE(i_object,"$.departamento")
			,municipio=JSON_VALUE(i_object,"$.municipio")
			,distrito=JSON_VALUE(i_object,"$.distrito")
			,tipoProveedor=JSON_VALUE(i_object,"$.tipoProveedor")
			,tipoPersona=JSON_VALUE(i_object,"$.tipoPersona")
			,sujetoExcluido=JSON_VALUE(i_object,"$.sujetoExcluido")
			,representanteLegal=JSON_VALUE(i_object,"$.representanteLegal")
			,plazo=JSON_VALUE(i_object,"$.plazo")
			,cuentaContableID=JSON_VALUE(i_object,"$.cuentaContableID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");

END;
;; 

 
 DELIMITER ;;
DROP PROCEDURE IF EXISTS SP_SELECT_ROW_proveedor;
;;

DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ROW_proveedor( 
    i_id int(12)
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
				,plazo
				,cuentaContableID
				
		FROM 	proveedor
		WHERE   id = i_id;
END;

;;
 
		
DELIMITER ;; 	
DROP PROCEDURE IF EXISTS  SP_ANULACION_PARCIAL_venta;
;;
 
 
DELIMITER ;; 	 
CREATE   PROCEDURE SP_ANULACION_PARCIAL_venta(
	IN 
    i_id	int
	 
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date datetime;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
	
    INSERT INTO  venta
    ( 
        
		fechaVenta,
		cajeroID,
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
		estado,
		tipoOperacion,
		clasificacion,
		sector,
		tipoCosto,
		manoDeObra,
		bodegaID,
		cajaID,
		corteID,
		nombreCliente
    )
     	SELECT   
			w_add_date,
			cajeroID,
			clienteID,
			documentoID,
			0,
			0,
			formaPagoID,
			codDescuento,
			montoDescuento,
			honorariosMedicos,
			cargoTarjeta,
			subtotal,
			total,
			efectivo,
			cambio,
			1,
			tipoOperacion,
			clasificacion,
			sector,
			tipoCosto,
			manoDeObra,
			bodegaID,
			cajaID,
			corteID,
			nombreCliente
	FROM 	venta
	WHERE   id = i_id;
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
	
	
	INSERT INTO  venta_detalle
		( 
	   
			ventaID,
			itemID,
			cantidad,
			precio,
			descuento,
			subtotal
		)
		SELECT 
			w_id,
			itemID,
			cantidad,
			precio,
			descuento,
			subtotal	 
	   	FROM venta_detalle
		WHERE ventaID = i_id;
	
   
	SELECT   
			id,
			fechaVenta,
			cajeroID,
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
			estado,
			tipoOperacion,
			clasificacion,
			sector,
			tipoCosto,
			manoDeObra,
			bodegaID,
			cajaID,
			corteID
	FROM 	venta
	WHERE   id = w_id;
   
END;
;;
 
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_ADD_vale;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_vale(
 IN i_object JSON
)
BEGIN 
 	DECLARE w_id INT(12);
    DECLARE w_add_date DATETIME;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";	
	
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  vale
    ( 
			cajeroID
			,tipo
			,concepto
			,motivo
			,empleado
			,monto
			,fechaHora
			,estado
			,corteID
    ) VALUES(
			JSON_VALUE(i_object,"$.cajeroID"),
			JSON_VALUE(i_object,"$.tipo"),
			JSON_VALUE(i_object,"$.concepto"),
			JSON_VALUE(i_object,"$.motivo"),
			JSON_VALUE(i_object,"$.empleado"),
			JSON_VALUE(i_object,"$.monto"),
			w_add_date,
			JSON_VALUE(i_object,"$.estado"),
			JSON_VALUE(i_object,"$.corteID")
	);
	

   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id
			,cajeroID
			,tipo
			,concepto
			,motivo
			,empleado
			,monto
			,fechaHora
			,estado
			
	FROM 	vale
	WHERE   id = w_id;
   
END;

;;

  
  
 
DELIMITER ;;  
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_vale;
;;

DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_vale( 
    i_id int(12),
	i_corteID INT(12)
) 
BEGIN 
	
    DECLARE w_add_date DATETIME;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();	
	
	
	
		SELECT   
				id
				,CASE concepto WHEN 1 THEN 'Compras varias' WHEN 2 THEN 'Pasaje' WHEN 3 THEN 'Alimentacion' WHEN 4 THEN 'Copias' WHEN 5 THEN 'Adelanto' END AS concepto 
				,tipo
				,motivo
				,'Mostrador' AS empleado
				,FORMAT(monto,2) AS monto
				,DATE_FORMAT(fechaHora,'%d/%m/%Y %H: %i: %s') AS fechaHora
				,estado
				
		FROM 	vale
		WHERE   corteID = i_corteID 
				AND cajeroID = i_id 
				AND DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_add_date,'%d/%m/%Y')
		ORDER BY  fechaHora DESC;
END;
;; 


DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_SELECT_ALL_vale;
;;


DELIMITER ;;
CREATE PROCEDURE SP_SELECT_ALL_vale()
BEGIN 


	DECLARE w_add_date DATETIME;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";	
	
	SELECT 	id,
			cajeroID,
			tipo,
			concepto,
			motivo,
			empleado,
			monto,
			fechaHora,
			estado
	FROM vale;
END; 
 
;; 		  


 
DELIMITER ;;  
DROP PROCEDURE IF EXISTS SP_SELECT_COLLECTION_BY_PARENT_ID_corte;
;; 

DELIMITER ;;  
CREATE PROCEDURE SP_SELECT_COLLECTION_BY_PARENT_ID_corte( 
    i_id int(12)
) 
BEGIN 

    DECLARE w_add_date DATETIME;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	SELECT   
		id
		,CASE tipoCorte WHEN '1' THEN 'CORTE X' WHEN '2' THEN 'CORTE Z' END AS tipoCorte
		,cortePadre
		,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
		,fechaCorte
		,montoApertura
		,tiqueteInicial
		,tiqueteFinal
		,ventasGravadasTKT
		,FORMAT(totalTiquete,2) AS totalTiquete
		,facturaInicial
		,facturaFinal
		,ventasGravadasFCT
		,FORMAT(totalFCT,2) AS totalFCT
		,CCFInicial
		,CCFFinal
		,ventasGravadasCCF
		,totalCCF
		,montoValesIngreso
		,montoValesEgreso
		,efectivoCaja
		,horaInicio
		,horaCierre
		,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
		,cajeroID
		,cajaID
		,areaID
		
FROM 	corte
WHERE   cajeroID = i_id AND DATE_FORMAT(fechaInicio,'%d/%m/%Y') = DATE_FORMAT(w_add_date,'%d/%m/%Y')
ORDER BY fechaInicio DESC;
END;
;;  
		
		
DELIMITER ;; 
DROP PROCEDURE IF EXISTS SP_getCollection_corte;
;;


DELIMITER ;;
CREATE PROCEDURE SP_getCollection_corte()
BEGIN 
    DECLARE w_add_date DATETIME;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();

	SELECT 
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,montoApertura
				,tiqueteInicial
				,tiqueteFinal
				,ventasGravadasTKT
				,FORMAT(totalTiquete,2) AS totalTiquete
				,facturaInicial
				,facturaFinal
				,ventasGravadasFCT
				,FORMAT(totalFCT,2) AS totalFCT
				,CCFInicial
				,CCFFinal
				,ventasGravadasCCF
				,totalCCF
				,montoValesIngreso
				,montoValesEgreso
				,efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
	FROM corte
	WHERE     DATE_FORMAT(fechaInicio,'%d/%m/%Y') = DATE_FORMAT(w_add_date,'%d/%m/%Y')
	ORDER BY fechaInicio DESC
	;
END; 
 
;; 		





DELIMITER ;; 	
DROP PROCEDURE IF EXISTS SP_GET_COMPLETE_POS_LIST;
;;


DELIMITER ;; 	
CREATE PROCEDURE SP_GET_COMPLETE_POS_LIST(
	IN
	i_cajeroID INT(12)
)
	BEGIN 
	
	
	DECLARE w_id INT(12);
    DECLARE w_add_date datetime;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = CURDATE(); 
    SET w_add_time  = CURTIME();
	
	SELECT id,
		DATE_FORMAT(fechaVenta,"%d/%m/%Y") AS fechaVenta,
		cajeroID,
		clienteID,
		IFNULL(nombreCliente,'') AS nombreCliente,
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
		estado,
		tipoOperacion,
		clasificacion,
		sector,
		tipoCosto,
		manoDeObra,
		bodegaID
	FROM venta
	WHERE  cajeroID = i_cajeroID 
		   AND DATE_FORMAT(fechaVenta,"%d/%m/%Y") = DATE_FORMAT(w_add_date,"%d/%m/%Y")
	       AND estado = 2
	ORDER BY id DESC;
	
END; 

;;


DELIMITER ;; 	
DROP PROCEDURE IF EXISTS SP_GET_POS_LIST;
;;

DELIMITER ;; 	
CREATE PROCEDURE SP_GET_POS_LIST(
	IN
	i_cajeroID INT(12)
)
	BEGIN 
	
	
	DECLARE w_id INT(12);
    DECLARE w_add_date datetime;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = CURDATE(); 
    SET w_add_time  = CURTIME();
	
	SELECT id,
		DATE_FORMAT(fechaVenta,"%d/%m/%Y") AS fechaVenta,
		cajeroID,
		clienteID,
		IFNULL(nombreCliente,'') AS nombreCliente,
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
		estado,
		tipoOperacion,
		clasificacion,
		sector,
		tipoCosto,
		manoDeObra,
		bodegaID
	FROM venta
	WHERE  cajeroID = i_cajeroID 
		   AND DATE_FORMAT(fechaVenta,"%d/%m/%Y") = DATE_FORMAT(w_add_date,"%d/%m/%Y")
	       AND estado = 1
	ORDER BY id DESC;
	
END; 

;;


DELIMITER ;; 	
DROP PROCEDURE IF EXISTS SP_GET_COMPLETE_POS_LIST;
;;



DELIMITER ;; 	
CREATE PROCEDURE SP_GET_COMPLETE_POS_LIST(
	IN
	i_cajeroID INT(12),
	i_corteID INT(12)
)
	BEGIN 
	
	
	DECLARE w_id INT(12);
    DECLARE w_add_date datetime;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = CURDATE(); 
    SET w_add_time  = CURTIME();
	
	SELECT id,
		DATE_FORMAT(fechaVenta,"%d/%m/%Y") AS fechaVenta,
		cajeroID,
		clienteID,
		IFNULL(nombreCliente,'') AS nombreCliente,
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
		estado,
		tipoOperacion,
		clasificacion,
		sector,
		tipoCosto,
		manoDeObra,
		bodegaID
	FROM venta
	WHERE  cajeroID = i_cajeroID 
		   AND corteID = i_corteID
		   AND DATE_FORMAT(fechaVenta,"%d/%m/%Y") = DATE_FORMAT(w_add_date,"%d/%m/%Y")
	       AND estado = 2
	ORDER BY id DESC;
	
END; 

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_venta;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_venta(
	IN 
	 i_id	int,
	 i_fechaVenta	datetime,
	 i_cajeroID	int,
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
	 i_estadoImpresion	int,
	 i_tipoOperacion	int,
	 i_clasificacion	int,
	 i_sector	int,
	 i_tipoCosto	int,
	 i_manoDeObra	int,
	 i_bodegaID	int,
	 i_nombreCliente varchar(256),
	 i_cajaID int,
	 i_corteID int,
	 i_tarjeta decimal(14,2),
	 i_transferencia decimal(14,2)
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
	DECLARE w_documento varchar(256);
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   venta
	 SET  
		  clienteID = i_clienteID,
		  documentoID=i_documentoID,
		  numeroDocumento=i_numeroDocumento,
		  serieDocumento=i_serieDocumento,
		  formaPagoID=i_formaPagoID,
		  codDescuento=i_codDescuento,
		  montoDescuento=i_montoDescuento,
		  honorariosMedicos=i_honorariosMedicos,
		  cargoTarjeta=i_cargoTarjeta,
		  subtotal=i_subtotal,
		  total=i_total,
		  efectivo=i_efectivo,
		  cambio=i_cambio,
		  estado=i_estado,
		  estadoImpresion=i_estadoImpresion,
		  tipoOperacion=i_tipoOperacion,
		  clasificacion=i_clasificacion,
		  sector=i_sector,
		  tipoCosto=i_tipoCosto,
		  manoDeObra=i_manoDeObra,
		  bodegaID=i_bodegaID,
		  nombreCliente = i_nombreCliente,
		  tarjeta = i_tarjeta,
		  transferencia = i_transferencia
	WHERE      id = i_id;
	
	
   IF i_documentoID = 	1 THEN 
		UPDATE cafeteria_settings
		SET ultimoTKT = i_numeroDocumento
		WHERE id = 1;  
   END IF;
	
	
   IF i_documentoID = 	2 THEN 
		UPDATE cafeteria_settings
		SET ultimoCCF = i_numeroDocumento
		WHERE id = 1;  
   END IF;
   
   
    IF i_documentoID = 	3 THEN 
		UPDATE cafeteria_settings
		SET ultimoFCT = i_numeroDocumento
		WHERE id = 1;  
   END IF;  


	SELECT   
			id,
			fechaVenta,
			cajeroID,
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
			estado,
			tipoOperacion,
			clasificacion,
			sector,
			tipoCosto,
			manoDeObra,
			bodegaID
	FROM 	venta
	WHERE   id = i_id;	

END;
;; 


/* 10/02/2025 */

DELIMITER ;; 	
DROP PROCEDURE IF EXISTS  SP_ADD_POS_venta;
;;
 
 
DELIMITER ;; 	 
CREATE   PROCEDURE SP_ADD_POS_venta(
	IN 
    i_id	int,
	i_fechaVenta	datetime,
	i_cajeroID	int,
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
	i_estadoImpresion	int,
	i_tipoOperacion	int,
	i_clasificacion	int,
	i_sector	int,
	i_tipoCosto	int,
	i_manoDeObra	int,
	i_bodegaID	int,
	i_nombreCliente	varchar(256),
	i_cajaID int,
	i_corteID int,
	i_tarjeta decimal(14,2),
	i_transferencia decimal(14,2)
)
BEGIN 
	DECLARE w_id INT(12);
    DECLARE w_add_date datetime;
    DECLARE w_add_time  TIME; 
	SET time_zone = "-06:00";
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
	
    INSERT INTO  venta
    ( 
      
		fechaVenta,
		cajeroID,
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
		estado,
		tipoOperacion,
		clasificacion,
		sector,
		tipoCosto,
		manoDeObra,
		bodegaID,
		nombreCliente,
		cajaID,
		corteID
    )
    VALUES  
    ( 
 
		w_add_date,
		i_cajeroID,
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
		i_estado,
		i_tipoOperacion,
		i_clasificacion,
		i_sector,
		i_tipoCosto,
		i_manoDeObra,
		i_bodegaID,
		i_nombreCliente,
		i_cajaID,
		i_corteID
    );
   
   
	SET w_id = ( SELECT LAST_INSERT_ID() );
   
	SELECT   
			id,
			fechaVenta,
			cajeroID,
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
			estado,
			tipoOperacion,
			clasificacion,
			sector,
			tipoCosto,
			manoDeObra,
			bodegaID
	FROM 	venta
	WHERE   id = w_id;
   
END;
;;