
SELECT MIN(numeroDocumento) tktInicial,
       MAX(numeroDocumento) tktFinal,
	   SUM(total) as VentasGravadas
FROM   venta 	   
WHERE  fechaVenta = i




DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_corte_X_Apertura;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_corte_X_Apertura(
 IN i_object JSON
)
BEGIN 
 	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
	
	SELECT MIN(numeroDocumento) tktInicial,
		   MAX(numeroDocumento) tktFinal,
		   SUM(total) as VentasGravadas
	FROM   venta 	   
	WHERE  fechaVenta = i	
	
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
			1,
			JSON_VALUE(i_object,"$.cortePadre"),
			JSON_VALUE(i_object,"$.fechaInicio"),
			JSON_VALUE(i_object,"$.fechaCorte"),
			JSON_VALUE(i_object,"$.montoApertura"),
			JSON_VALUE(i_object,"$.montoVenta"),
			JSON_VALUE(i_object,"$.montoValesIngreso"),
			JSON_VALUE(i_object,"$.montoValesEgreso"),
			JSON_VALUE(i_object,"$.efectivoCaja"),
			JSON_VALUE(i_object,"$.horaInicio"),
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
DROP PROCEDURE IF EXISTS  SP_ADD_corte;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_ADD_corte(
 IN i_object JSON
)
BEGIN 
 	DECLARE w_id INT(12);
    DECLARE w_add_date DATE;
    DECLARE w_add_time  TIME; 
    SET w_add_date = NOW(); 
    SET w_add_time  = CURTIME();
	
    INSERT INTO  corte
    ( 
        tipoCorte
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
			
    ) VALUES(
			JSON_VALUE(i_object,"$.tipoCorte"),
			JSON_VALUE(i_object,"$.cortePadre"),
			JSON_VALUE(i_object,"$.fechaInicio"),
			JSON_VALUE(i_object,"$.fechaCorte"),
			JSON_VALUE(i_object,"$.montoApertura"),
			JSON_VALUE(i_object,"$.tiqueteInicial"),
			JSON_VALUE(i_object,"$.tiqueteFinal"),
			JSON_VALUE(i_object,"$.ventasGravadasTKT"),
			JSON_VALUE(i_object,"$.totalTiquete"),
			JSON_VALUE(i_object,"$.facturaInicial"),
			JSON_VALUE(i_object,"$.facturaFinal"),
			JSON_VALUE(i_object,"$.ventasGravadasFCT"),
			JSON_VALUE(i_object,"$.totalFCT"),
			JSON_VALUE(i_object,"$.CCFInicial"),
			JSON_VALUE(i_object,"$.CCFFinal"),
			JSON_VALUE(i_object,"$.ventasGravadasCCF"),
			JSON_VALUE(i_object,"$.totalCCF"),
			JSON_VALUE(i_object,"$.montoValesIngreso"),
			JSON_VALUE(i_object,"$.montoValesEgreso"),
			JSON_VALUE(i_object,"$.efectivoCaja"),
			JSON_VALUE(i_object,"$.horaInicio"),
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
			
	FROM 	corte
	WHERE   id = w_id;
   
END;

;;

 
 
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EDIT_corte;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_EDIT_corte(
	 
	 IN i_object JSON
)	 
BEGIN 
    DECLARE w_edit_date DATE;
    DECLARE w_edit_time  TIME; 
    SET w_edit_date = CURDATE(); 
    SET w_edit_time  = CURTIME();
	 UPDATE   corte
	 SET  
		id=JSON_VALUE(i_object,"$.id")
			,tipoCorte=JSON_VALUE(i_object,"$.tipoCorte")
			,cortePadre=JSON_VALUE(i_object,"$.cortePadre")
			,fechaInicio=JSON_VALUE(i_object,"$.fechaInicio")
			,fechaCorte=JSON_VALUE(i_object,"$.fechaCorte")
			,montoApertura=JSON_VALUE(i_object,"$.montoApertura")
			,tiqueteInicial=JSON_VALUE(i_object,"$.tiqueteInicial")
			,tiqueteFinal=JSON_VALUE(i_object,"$.tiqueteFinal")
			,ventasGravadasTKT=JSON_VALUE(i_object,"$.ventasGravadasTKT")
			,totalTiquete=JSON_VALUE(i_object,"$.totalTiquete")
			,facturaInicial=JSON_VALUE(i_object,"$.facturaInicial")
			,facturaFinal=JSON_VALUE(i_object,"$.facturaFinal")
			,ventasGravadasFCT=JSON_VALUE(i_object,"$.ventasGravadasFCT")
			,totalFCT=JSON_VALUE(i_object,"$.totalFCT")
			,CCFInicial=JSON_VALUE(i_object,"$.CCFInicial")
			,CCFFinal=JSON_VALUE(i_object,"$.CCFFinal")
			,ventasGravadasCCF=JSON_VALUE(i_object,"$.ventasGravadasCCF")
			,totalCCF=JSON_VALUE(i_object,"$.totalCCF")
			,montoValesIngreso=JSON_VALUE(i_object,"$.montoValesIngreso")
			,montoValesEgreso=JSON_VALUE(i_object,"$.montoValesEgreso")
			,efectivoCaja=JSON_VALUE(i_object,"$.efectivoCaja")
			,horaInicio=JSON_VALUE(i_object,"$.horaInicio")
			,horaCierre=JSON_VALUE(i_object,"$.horaCierre")
			,estado=JSON_VALUE(i_object,"$.estado")
			,cajeroID=JSON_VALUE(i_object,"$.cajeroID")
			,cajaID=JSON_VALUE(i_object,"$.cajaID")
			,areaID=JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");

END;
;;  



DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_start;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_CorteX_start(
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
			,estado
			,cajeroID
			,cajaID
			,areaID
			
    ) VALUES(
			1,
			0,
			w_add_date,
			NULL,
			JSON_VALUE(i_object,"$.montoApertura"),
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			w_add_time,
			1,
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
			
	FROM 	corte
	WHERE   id = w_id;
   
END;

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CAJA_INICIALIZADA
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_CAJA_INICIALIZADA(
 IN i_object JSON
)
BEGIN 
    
	DECLARE w_id INT(12);
	DECLARE w_count INT(12);

	SET w_count = (
		SELECT COUNT(1) 
		FROM corte 
		WHERE 	estado = 1
				AND	 cajeroID 	= 	JSON_VALUE(i_object,"$.cajeroID")
				AND cajaID 	= 	JSON_VALUE(i_object,"$.cajaID")
				AND areaID  = 	JSON_VALUE(i_object,"$.areaID")
				AND tipoCorte = 1
	);
	
	
	SET w_id = (
		SELECT id 
		FROM corte 
		WHERE 	estado = 1
				AND	 cajeroID 	= 	JSON_VALUE(i_object,"$.cajeroID")
				AND cajaID 		= 	JSON_VALUE(i_object,"$.cajaID")
				AND areaID  	= 	JSON_VALUE(i_object,"$.areaID")
				AND tipoCorte = 1
		LIMIT 1
	);	
			
	SELECT   w_id AS id,
			 'Resultado' AS resultado,
			  JSON_VALUE(i_object,"$.cajeroID") AS cajeroID,
			  JSON_VALUE(i_object,"$.cajaID") AS cajaID,
	          w_count    AS total;


END;

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Finish;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Finish(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
	);
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	); 	
	
	
	SET w_montoValesIngreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 1
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0.00
		,facturaFinal		=	0.00
		,ventasGravadasFCT	=	0.00
		,totalFCT			=	0.00
		,CCFInicial			=	0.00
		,CCFFinal			=	0.00
		,ventasGravadasCCF	=	0.00
		,totalCCF			=	0.00
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	2
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
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
			
	FROM 	corte
	WHERE      id = JSON_VALUE(i_object,"$.id");

END;
;;  


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_Corte_Z;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_Corte_Z(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);
	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE   DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
	);
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE   DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE  DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
	); 	
	
	
	
	SET w_montoValesIngreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 1
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
	);	
	
	UPDATE   corte
	SET  
		 tipoCorte		=	2
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0.00
		,facturaFinal		=	0.00
		,ventasGravadasFCT	=	0.00
		,totalFCT			=	0.00
		,CCFInicial			=	0.00
		,CCFFinal			=	0.00
		,ventasGravadasCCF	=	0.00
		,totalCCF			=	0.00
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,efectivoCaja		=	0.00
		,horaCierre			=	w_edit_time
		,estado				=	2
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
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
			
	FROM 	corte
	WHERE      id = JSON_VALUE(i_object,"$.id");	
	

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
				
		FROM 	corte
		WHERE   id = i_id;
END;

;;
 
		
 
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Partial;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Partial(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 1
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	); 	
	
	
	SET w_montoValesIngreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 1
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	2
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
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
			
	FROM 	corte
	WHERE      id = JSON_VALUE(i_object,"$.id");

END;
;;  
		
		
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Finish;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Finish(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 3
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 1
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	); 	
	
	
	SET w_montoValesIngreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 1
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	0.00
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	2
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
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
			
	FROM 	corte
	WHERE      id = JSON_VALUE(i_object,"$.id");

END;
;;  		



DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Partial;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Partial(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 3
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 1
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	); 	
	
	
	SET w_montoValesIngreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 1
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	0.00
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	1
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
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
				,totalFacturado
				,totalAnulado
				,haberCaja
		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  		


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Finish;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Finish(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 1
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	); 	
	
	
	SET w_montoValesIngreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 1
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	0.00
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	2
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
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
				,totalFacturado
				,totalAnulado
				,haberCaja
		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Partial;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Partial(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND ( estado = 1 OR estado = 2)
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND ( estado = 1 OR estado = 2)
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND ( estado = 1 OR estado = 2)
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 1
			   AND ( estado = 1 OR estado = 2)
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND ( estado = 1 OR estado = 2)
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND ( estado = 1 OR estado = 2)
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND ( estado = 1 OR estado = 2)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			   AND corteID  = JSON_VALUE(i_object,"$.id")

	); 	
	
	
	SET w_montoValesIngreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 1
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	0.00
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	1
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
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
				,montoValesEgresok
				,efectivoCaja
				,horaInicio
				,horaCierre
				,estado
				,cajeroID
				,cajaID
				,areaID
				,totalCredito
				,totalContado
				,totalFacturado
				,totalAnulado
				,haberCaja
		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	

/*
	29/01/2029
	se añadio estado
*/
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Partial;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Partial(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND ( estado = 1 OR estado = 2)
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND ( estado = 1 OR estado = 2)
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND ( estado = 1 OR estado = 2)
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 1
			   AND ( estado = 1 OR estado = 2)
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND ( estado = 1 OR estado = 2)
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND ( estado = 1 OR estado = 2)
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND ( estado = 1 OR estado = 2)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			   AND corteID  = JSON_VALUE(i_object,"$.id")

	); 	
	
	
	SET w_montoValesIngreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 1
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	0.00
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	1
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	


/*
	29/01/2029
	se añadio estado
*/
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Finish;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Finish(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND estado = 2
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 1
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	0.00
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	2
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
					id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
		
		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	





DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Partial;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Partial(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND estado = 2
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 1
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	0.00
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	1
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
		
		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	









DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Finish;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Finish(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND estado = 2
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	0.00
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	2
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
		
		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Partial;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Partial(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	DECLARE w_haberCaja   DECIMAL(14,4);
	DECLARE w_montoApertura   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	
	/*
		Ventas al credito
	*/
	SET w_montoApertura = (
	
		SELECT IFNULL(montoApertura,0) 
		FROM corte
		WHERE  id  = JSON_VALUE(i_object,"$.id")
 
	);		
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND estado = 2
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT IFNULL(SUM(monto),0) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	
	SET w_haberCaja = ( w_montoApertura +  w_totalVenta )  -  ( w_montoValesEgreso +  w_montoValesIngreso ) - w_totalCredito;
	
	UPDATE   corte
	SET  
		 tipoCorte		=	1
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	w_haberCaja
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	1
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
		
		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	



DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_start;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_CorteX_start(
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
			,estado
			,cajeroID
			,cajaID
			,areaID
			
    ) VALUES(
			1,
			0,
			w_add_date,
			NULL,
			JSON_VALUE(i_object,"$.montoApertura"),
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			w_add_time,
			1,
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
			
	FROM 	corte
	WHERE   id = w_id;
   
END;

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Finish;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Finish(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND estado = 2
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	( montoApertura +  w_totalVenta ) - ( w_totalCredito + w_montoValesIngreso + w_montoValesEgreso )
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	2
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
		
		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_Corte_Z;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_Corte_Z(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE 
			  DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND formaPagoID = 2
			  AND estado = 2
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE   DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE  DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	( montoApertura +  w_totalVenta ) - ( w_totalCredito + w_montoValesIngreso + w_montoValesEgreso )
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	2
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
		
		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");
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
				
		FROM 	corte
		WHERE   id = i_id;
END;

;;


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Finish;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Finish(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	DECLARE w_haberCaja   DECIMAL(14,4);
	DECLARE w_montoApertura   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	
	/*
		Ventas al credito
	*/
	SET w_montoApertura = (
	
		SELECT IFNULL(montoApertura,0) 
		FROM corte
		WHERE  id  = JSON_VALUE(i_object,"$.id")
 
	);		
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND estado = 2
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND estado = 2 
			  AND documentoID <> 4
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT IFNULL(SUM(monto),0) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	
	SET w_haberCaja = ( w_montoApertura +  w_totalVenta )  -  ( w_montoValesEgreso +  w_montoValesIngreso ) - w_totalCredito;
	
	UPDATE   corte
	SET  
		 tipoCorte		=	1
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	w_haberCaja
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	2
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
		
		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	


/* 08/02/2025 */
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Partial;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Partial(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT 				DECIMAL(14,4);
	DECLARE w_totalFCT 				DECIMAL(14,4);
	DECLARE w_totalCCF 				DECIMAL(14,4);
	DECLARE w_TKT_INICIAL 			INT(12);
	DECLARE w_totalCredito   		DECIMAL(14,4);
	DECLARE w_totalContado   		DECIMAL(14,4);
	DECLARE w_totalTransferencia   	DECIMAL(14,4);
	DECLARE w_totalTarjeta   		DECIMAL(14,4);
	DECLARE w_totalMixto   			DECIMAL(14,4);	
	DECLARE w_totalVenta   			DECIMAL(14,4);
	DECLARE w_totalAnulado   		DECIMAL(14,4);
	DECLARE w_haberCaja   			DECIMAL(14,4);
	DECLARE w_montoApertura   		DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   			INT(12);
	
	DECLARE w_montoValesIngreso 	DECIMAL(14,4);
	DECLARE w_montoValesEgreso 		DECIMAL(14,4);	
	
    DECLARE w_edit_date 			DATETIME;
    DECLARE w_edit_time  			TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	
	/*
		Ventas al credito
	*/
	SET w_montoApertura = (
	
		SELECT IFNULL(montoApertura,0) 
		FROM corte
		WHERE  id  = JSON_VALUE(i_object,"$.id")
 
	);		
	
	
	/*
		Ventas Transferencia
	*/
	SET w_totalTransferencia = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND estado = 2
			  AND documentoID <> 4
	);	
	


	/*
		Ventas Tarjeta Credito / Debito
	*/
	SET w_totalTarjeta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 3
			  AND estado = 2
			  AND documentoID <> 4
	);


	/*
		Ventas Mixto
	*/
	SET w_totalMixto = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT IFNULL(SUM(monto),0) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	
	SET w_haberCaja = ( w_montoApertura +  w_totalVenta )  -  ( w_montoValesEgreso +  w_montoValesIngreso ) - w_totalCredito;
	
	UPDATE   corte
	SET  
		 tipoCorte				=	1
		,cortePadre				=	0 
		,fechaCorte				=	w_edit_date
		,tiqueteInicial			=	w_TKT_INICIAL
		,tiqueteFinal			=	w_TKT_FINAL
		,ventasGravadasTKT		=	w_totalTKT
		,totalTiquete			=	w_totalTKT
		,totalTarjeta			=	w_totalTarjeta
		,totalTransferencia		=	w_totalTransferencia
		,facturaInicial			=	0
		,facturaFinal			=	0
		,ventasGravadasFCT		=	w_totalFCT
		,totalFCT				=	w_totalFCT
		,CCFInicial				=	0
		,CCFFinal				=	0
		,ventasGravadasCCF		=	w_totalCCF
		,totalCCF				=	w_totalCCF
		,montoValesIngreso		=	w_montoValesIngreso
		,montoValesEgreso		=	w_montoValesEgreso
		,totalCredito			=	w_totalCredito
		,totalContado			=	w_totalContado
		,totalFacturado			=	w_totalVenta
		,totalAnulado			=	w_totalAnulado
		,haberCaja				=	w_haberCaja
		,efectivoCaja			=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre				=	w_edit_time
		,estado					=	1
		,cajeroID				=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID					=	JSON_VALUE(i_object,"$.cajaID")
		,areaID					=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
				,FORMAT(totalTarjeta,2) AS totalTarjeta
				,FORMAT(totalTransferencia,2) AS totalTransferencia

		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	


/* 10/02/2025 */
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Finish;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Finish(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT 				DECIMAL(14,4);
	DECLARE w_totalFCT 				DECIMAL(14,4);
	DECLARE w_totalCCF 				DECIMAL(14,4);
	DECLARE w_TKT_INICIAL 			INT(12);
	DECLARE w_totalCredito   		DECIMAL(14,4);
	DECLARE w_totalContado   		DECIMAL(14,4);
	DECLARE w_totalTransferencia   	DECIMAL(14,4);
	DECLARE w_totalTarjeta   		DECIMAL(14,4);
	DECLARE w_totalMixto   			DECIMAL(14,4);	
	DECLARE w_totalVenta   			DECIMAL(14,4);
	DECLARE w_totalAnulado   		DECIMAL(14,4);
	DECLARE w_haberCaja   			DECIMAL(14,4);
	DECLARE w_montoApertura   		DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   			INT(12);
	
	DECLARE w_montoValesIngreso 	DECIMAL(14,4);
	DECLARE w_montoValesEgreso 		DECIMAL(14,4);	
	
    DECLARE w_edit_date 			DATETIME;
    DECLARE w_edit_time  			TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	
	/*
		Ventas al credito
	*/
	SET w_montoApertura = (
	
		SELECT IFNULL(montoApertura,0) 
		FROM corte
		WHERE  id  = JSON_VALUE(i_object,"$.id")
 
	);		
	
	
	/*
		Ventas Transferencia
	*/
	SET w_totalTransferencia = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND estado = 2
			  AND documentoID <> 4
	);	
	


	/*
		Ventas Tarjeta Credito / Debito
	*/
	SET w_totalTarjeta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 3
			  AND estado = 2
			  AND documentoID <> 4
	);


	/*
		Ventas Mixto
	*/
	SET w_totalMixto = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT IFNULL(SUM(monto),0) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	
	SET w_haberCaja = ( w_montoApertura +  w_totalContado )  -  ( w_montoValesEgreso +  w_montoValesIngreso ) ;
	
	UPDATE   corte
	SET  
		 tipoCorte				=	1
		,cortePadre				=	0 
		,fechaCorte				=	w_edit_date
		,tiqueteInicial			=	w_TKT_INICIAL
		,tiqueteFinal			=	w_TKT_FINAL
		,ventasGravadasTKT		=	w_totalTKT
		,totalTiquete			=	w_totalTKT
		,totalTarjeta			=	w_totalTarjeta
		,totalTransferencia		=	w_totalTransferencia
		,facturaInicial			=	0
		,facturaFinal			=	0
		,ventasGravadasFCT		=	w_totalFCT
		,totalFCT				=	w_totalFCT
		,CCFInicial				=	0
		,CCFFinal				=	0
		,ventasGravadasCCF		=	w_totalCCF
		,totalCCF				=	w_totalCCF
		,montoValesIngreso		=	w_montoValesIngreso
		,montoValesEgreso		=	w_montoValesEgreso
		,totalCredito			=	w_totalCredito
		,totalContado			=	w_totalContado
		,totalFacturado			=	w_totalVenta
		,totalAnulado			=	w_totalAnulado
		,haberCaja				=	w_haberCaja
		,efectivoCaja			=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre				=	w_edit_time
		,estado					=	2
		,cajeroID				=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID					=	JSON_VALUE(i_object,"$.cajaID")
		,areaID					=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
				,FORMAT(totalTarjeta,2) AS totalTarjeta
				,FORMAT(totalTransferencia,2) AS totalTransferencia

		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	



/*  10/02/2025 */
/* 12/02/2025 */
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Partial;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Partial(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT 				DECIMAL(14,4);
	DECLARE w_totalFCT 				DECIMAL(14,4);
	DECLARE w_totalCCF 				DECIMAL(14,4);
	DECLARE w_TKT_INICIAL 			INT(12);
	DECLARE w_totalCredito   		DECIMAL(14,4);
	DECLARE w_totalContado   		DECIMAL(14,4);
	DECLARE w_parcialContado   		DECIMAL(14,4);
	DECLARE w_totalIngresos   		DECIMAL(14,4);
	DECLARE w_totalGeneral   		DECIMAL(14,4);
	DECLARE w_subtotal   			DECIMAL(14,4);
	DECLARE w_efectivoCaja   		DECIMAL(14,4);
	DECLARE w_diferencia   			DECIMAL(14,4);
	DECLARE w_sobrante   			DECIMAL(14,4);
	DECLARE w_faltante   			DECIMAL(14,4);
	
	
	DECLARE w_totalTransferencia   	DECIMAL(14,4);
	DECLARE w_parcialTransferencia   	DECIMAL(14,4);
	
	
	DECLARE w_totalTarjeta   		DECIMAL(14,4);
	DECLARE w_parcialTarjeta   		DECIMAL(14,4);
	
	
	DECLARE w_totalMixto   			DECIMAL(14,4);	
	DECLARE w_totalVenta   			DECIMAL(14,4);
	DECLARE w_totalAnulado   		DECIMAL(14,4);
	DECLARE w_haberCaja   			DECIMAL(14,4);
	DECLARE w_montoApertura   		DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   			INT(12);
	
	DECLARE w_montoValesIngreso 	DECIMAL(14,4);
	DECLARE w_montoValesEgreso 		DECIMAL(14,4);	
	
    DECLARE w_edit_date 			DATETIME;
    DECLARE w_edit_time  			TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	
	/*
		Ventas al credito
	*/
	SET w_montoApertura = (
	
		SELECT IFNULL(montoApertura,0) 
		FROM corte
		WHERE  id  = JSON_VALUE(i_object,"$.id")
 
	);		
	
	
	/*
		Ventas Transferencia
	*/
	SET w_totalTransferencia = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND estado = 2
			  AND documentoID <> 4
	);	
	


	/*
		Ventas Tarjeta Credito / Debito
	*/
	SET w_totalTarjeta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 3
			  AND estado = 2
			  AND documentoID <> 4
	);


	/*
		Ventas Mixto
	*/
	SET w_totalMixto = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);
	
	
	SET w_parcialTransferencia = (
	
		SELECT IFNULL(SUM(transferencia),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialTarjeta = (
	
		SELECT IFNULL(SUM(tarjeta),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialContado = (
	
		SELECT IFNULL(SUM(efectivo),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
		
	
	
	/*
		w_parcialContado
	*/

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	

	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT IFNULL(SUM(monto),0) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	
	SET w_totalIngresos = w_totalTKT + w_totalFCT + w_totalCCF;
	
	SET w_totalGeneral = w_totalIngresos - 	w_montoValesEgreso;
	
	
	
	SET w_subtotal	= w_totalGeneral - (w_totalTarjeta + w_parcialTarjeta) -  (w_totalTransferencia + w_parcialTransferencia);
	
	
	SET w_haberCaja = w_montoApertura + w_subtotal;
	
	SET w_efectivoCaja = JSON_VALUE(i_object,"$.efectivoCaja");
	
	SET w_diferencia = w_efectivoCaja - w_haberCaja;
	
	SET w_diferencia = 0;
	SET w_faltante = 0;
	
	IF w_diferencia < 0 THEN 
		SET w_faltante = w_diferencia;
	END IF;
	
	IF w_diferencia >= 0 THEN 
		SET w_sobrante = w_diferencia;
	END IF;	
	
	UPDATE   corte
	SET  
		 tipoCorte				=	1
		,cortePadre				=	0 
		,fechaCorte				=	w_edit_date
		,tiqueteInicial			=	w_TKT_INICIAL
		,tiqueteFinal			=	w_TKT_FINAL
		,ventasGravadasTKT		=	w_totalTKT
		,totalTiquete			=	w_totalTKT
		,totalTarjeta			=	w_totalTarjeta + w_parcialTarjeta
		,totalTransferencia		=	w_totalTransferencia + w_parcialTransferencia
		,facturaInicial			=	0
		,facturaFinal			=	0
		,ventasGravadasFCT		=	w_totalFCT
		,totalFCT				=	w_totalFCT
		,CCFInicial				=	0
		,CCFFinal				=	0
		,ventasGravadasCCF		=	w_totalCCF
		,totalCCF				=	w_totalCCF
		,montoValesIngreso		=	w_montoValesIngreso
		,montoValesEgreso		=	w_montoValesEgreso
		,totalCredito			=	w_totalCredito
		,totalContado			=	w_totalContado + w_parcialContado
		,totalIngresos			=	w_totalIngresos
		,totalGeneral			=	w_totalGeneral
		,subtotal				=	w_subtotal
		,sobrante				=	w_sobrante
		,faltante				=	w_faltante
		,totalAnulado			=	w_totalAnulado
		,haberCaja				=	w_haberCaja
		,efectivoCaja			=	w_efectivoCaja
		,horaCierre				=	w_edit_time
		,estado					=	1
		,cajeroID				=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID					=	JSON_VALUE(i_object,"$.cajaID")
		,areaID					=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(totalCCF,2) AS totalCCF
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalIngresos,2) AS totalIngresos
				,FORMAT(subtotal,2) AS subtotal
				,FORMAT(totalGeneral,2) AS totalGeneral
				,FORMAT(faltante,2) AS faltante
				,FORMAT(sobrante,2) AS sobrante
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
				,FORMAT(totalTarjeta,2) AS totalTarjeta
				,FORMAT(totalTransferencia,2) AS totalTransferencia

		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	
/* 12/02/2025 10;59 am*/


/*
	10/02/2025
*/
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_Corte_Z;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_Corte_Z(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE 
			  DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND formaPagoID = 2
			  AND estado = 2
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE   DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE  DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	( montoApertura +  w_totalVenta ) - ( w_totalCredito + w_montoValesIngreso + w_montoValesEgreso )
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	2
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
		
		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");
END;
;;  


/*  10/02/2025 */
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Finish;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Finish(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT 				DECIMAL(14,4);
	DECLARE w_totalFCT 				DECIMAL(14,4);
	DECLARE w_totalCCF 				DECIMAL(14,4);
	DECLARE w_TKT_INICIAL 			INT(12);
	DECLARE w_totalCredito   		DECIMAL(14,4);
	DECLARE w_totalContado   		DECIMAL(14,4);
	DECLARE w_parcialContado   		DECIMAL(14,4);
	
	
	DECLARE w_totalTransferencia   	DECIMAL(14,4);
	DECLARE w_parcialTransferencia  DECIMAL(14,4);
	
	
	DECLARE w_totalTarjeta   		DECIMAL(14,4);
	DECLARE w_parcialTarjeta   		DECIMAL(14,4);
	
	
	DECLARE w_totalMixto   			DECIMAL(14,4);	
	DECLARE w_totalVenta   			DECIMAL(14,4);
	DECLARE w_totalAnulado   		DECIMAL(14,4);
	DECLARE w_haberCaja   			DECIMAL(14,4);
	DECLARE w_montoApertura   		DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   			INT(12);
	
	DECLARE w_montoValesIngreso 	DECIMAL(14,4);
	DECLARE w_montoValesEgreso 		DECIMAL(14,4);	
	
    DECLARE w_edit_date 			DATETIME;
    DECLARE w_edit_time  			TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	
	/*
		Ventas al credito
	*/
	SET w_montoApertura = (
	
		SELECT IFNULL(montoApertura,0) 
		FROM corte
		WHERE  id  = JSON_VALUE(i_object,"$.id")
 
	);		
	
	
	/*
		Ventas Transferencia
	*/
	SET w_totalTransferencia = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND estado = 2
			  AND documentoID <> 4
	);	
	


	/*
		Ventas Tarjeta Credito / Debito
	*/
	SET w_totalTarjeta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 3
			  AND estado = 2
			  AND documentoID <> 4
	);


	/*
		Ventas Mixto
	*/
	SET w_totalMixto = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);
	
	
	SET w_parcialTransferencia = (
	
		SELECT IFNULL(SUM(transferencia),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialTarjeta = (
	
		SELECT IFNULL(SUM(tarjeta),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialContado = (
	
		SELECT IFNULL(SUM(efectivo),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
		
	
	
	/*
		w_parcialContado
	*/

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT IFNULL(SUM(monto),0) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	
	SET w_haberCaja = ( w_montoApertura +  w_totalContado )  -  ( w_montoValesEgreso +  w_montoValesIngreso );
	
	UPDATE   corte
	SET  
		 tipoCorte				=	1
		,cortePadre				=	0 
		,fechaCorte				=	w_edit_date
		,tiqueteInicial			=	w_TKT_INICIAL
		,tiqueteFinal			=	w_TKT_FINAL
		,ventasGravadasTKT		=	w_totalTKT
		,totalTiquete			=	w_totalTKT
		,totalTarjeta			=	w_totalTarjeta + w_parcialTarjeta
		,totalTransferencia		=	w_totalTransferencia + w_parcialTransferencia
		,facturaInicial			=	0
		,facturaFinal			=	0
		,ventasGravadasFCT		=	w_totalFCT
		,totalFCT				=	w_totalFCT
		,CCFInicial				=	0
		,CCFFinal				=	0
		,ventasGravadasCCF		=	w_totalCCF
		,totalCCF				=	w_totalCCF
		,montoValesIngreso		=	w_montoValesIngreso
		,montoValesEgreso		=	w_montoValesEgreso
		,totalCredito			=	w_totalCredito
		,totalContado			=	w_totalContado + w_parcialContado
		,totalFacturado			=	w_totalVenta
		,totalAnulado			=	w_totalAnulado
		,haberCaja				=	w_haberCaja
		,efectivoCaja			=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre				=	w_edit_time
		,estado					=	2
		,cajeroID				=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID					=	JSON_VALUE(i_object,"$.cajaID")
		,areaID					=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
				,FORMAT(totalTarjeta,2) AS totalTarjeta
				,FORMAT(totalTransferencia,2) AS totalTransferencia

		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EXISTE_CORTE_Z
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_EXISTE_CORTE_Z(
  IN i_cajaID INT(12)
)
BEGIN 
    
	DECLARE w_id INT(12);
	DECLARE w_count INT(12);

    DECLARE w_edit_date 			DATETIME;
    DECLARE w_edit_time  			TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();

	SET w_count = (
		SELECT IFNULL(COUNT(1),0) 
		FROM corte 
		WHERE 	estado = 1
				AND tipoCorte = 2
				AND DATE_FORMAT(fechaInicio,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')  
				AND cajaID = i_cajaID
	);
	
	
	SET w_id = (
		SELECT IFNULL(id,0) 
		FROM corte 
		WHERE 	estado = 1
				AND tipoCorte = 2
				AND DATE_FORMAT(fechaInicio,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')  
				AND cajaID = i_cajaID
		LIMIT 1
	);	
	
	IF w_id IS NULL THEN
		SET w_id = 0;
	END IF;
			
	SELECT   w_id AS id,
			 w_count    AS total;


END;

;;

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteZ_start;
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_CorteZ_start(
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
			,estado
			,cajeroID
			,cajaID
			,areaID
			
    ) VALUES(
			2,
			0,
			w_add_date,
			NULL,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			w_add_time,
			1,
			0,
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
			
	FROM 	corte
	WHERE   id = w_id;
   
END;

;;



/*
	11/02/2025
*/
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteZ_Finish;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteZ_Finish(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT DECIMAL(14,4);
	DECLARE w_totalFCT DECIMAL(14,4);
	DECLARE w_totalCCF DECIMAL(14,4);
	DECLARE w_TKT_INICIAL INT(12);
	DECLARE w_totalCredito   DECIMAL(14,4);
	DECLARE w_totalContado   DECIMAL(14,4);
	DECLARE w_totalVenta   DECIMAL(14,4);
	DECLARE w_totalAnulado   DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   INT(12);
	
	DECLARE w_montoValesIngreso DECIMAL(14,4);
	DECLARE w_montoValesEgreso DECIMAL(14,4);	
	
    DECLARE w_edit_date DATETIME;
    DECLARE w_edit_time  TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	/*
		Ventas al credito
	*/
	SET w_totalCredito = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE 
			  DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND formaPagoID = 2
			  AND estado = 2
	);	
	

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE   DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE  DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT SUM(monto) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
	);		
	
	UPDATE   corte
	SET  
		 tipoCorte		=	JSON_VALUE(i_object,"$.tipoCorte")
		,cortePadre		=	0 
 
		,fechaCorte		=	w_edit_date
 
		,tiqueteInicial		=	w_TKT_INICIAL
		,tiqueteFinal		=	w_TKT_FINAL
		,ventasGravadasTKT	=	w_totalTKT
		,totalTiquete		=	w_totalTKT
		,facturaInicial		=	0
		,facturaFinal		=	0
		,ventasGravadasFCT	=	w_totalFCT
		,totalFCT			=	w_totalFCT
		,CCFInicial			=	0
		,CCFFinal			=	0
		,ventasGravadasCCF	=	w_totalCCF
		,totalCCF			=	w_totalCCF
		,montoValesIngreso	=	w_montoValesIngreso
		,montoValesEgreso	=	w_montoValesEgreso
		,totalCredito		=	w_totalCredito
		,totalContado		=	w_totalContado
		,totalFacturado		=	w_totalVenta
		,totalAnulado		=	w_totalAnulado
		,haberCaja			=	( montoApertura +  w_totalVenta ) - ( w_totalCredito + w_montoValesIngreso + w_montoValesEgreso )
		,efectivoCaja		=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre			=	w_edit_time
		,estado				=	2
		,cajeroID			=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID				=	JSON_VALUE(i_object,"$.cajaID")
		,areaID				=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
		
		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");
END;
;;  


/*
	11/02/2025
*/
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteZ_Partial;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteZ_Partial(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT 				DECIMAL(14,4);
	DECLARE w_totalFCT 				DECIMAL(14,4);
	DECLARE w_totalCCF 				DECIMAL(14,4);
	DECLARE w_TKT_INICIAL 			INT(12);
	DECLARE w_totalCredito   		DECIMAL(14,4);
	DECLARE w_totalContado   		DECIMAL(14,4);
	DECLARE w_parcialContado   		DECIMAL(14,4);
	
	
	DECLARE w_totalTransferencia   	DECIMAL(14,4);
	DECLARE w_parcialTransferencia  DECIMAL(14,4);
	
	
	DECLARE w_totalTarjeta   		DECIMAL(14,4);
	DECLARE w_parcialTarjeta   		DECIMAL(14,4);
	
	
	DECLARE w_totalMixto   			DECIMAL(14,4);	
	DECLARE w_totalVenta   			DECIMAL(14,4);
	DECLARE w_totalAnulado   		DECIMAL(14,4);
	DECLARE w_haberCaja   			DECIMAL(14,4);
	DECLARE w_montoApertura   		DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   			INT(12);
	
	DECLARE w_montoValesIngreso 	DECIMAL(14,4);
	DECLARE w_montoValesEgreso 		DECIMAL(14,4);	
	
    DECLARE w_edit_date 			DATETIME;
    DECLARE w_edit_time  			TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	
	/*
		Ventas al credito
	*/
	SET w_montoApertura = (
	
		SELECT IFNULL(montoApertura,0) 
		FROM corte
		WHERE  id  = JSON_VALUE(i_object,"$.id")
 
	);		
	
	
	/*
		Ventas Transferencia
	*/
	SET w_totalTransferencia = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND formaPagoID = 2
			  AND estado = 2
			  AND documentoID <> 4
	);	
	


	/*
		Ventas Tarjeta Credito / Debito
	*/
	SET w_totalTarjeta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND formaPagoID = 3
			  AND estado = 2
			  AND documentoID <> 4
	);


	/*
		Ventas Mixto
	*/
	SET w_totalMixto = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);
	
	
	SET w_parcialTransferencia = (
	
		SELECT IFNULL(SUM(transferencia),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialTarjeta = (
	
		SELECT IFNULL(SUM(tarjeta),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialContado = (
	
		SELECT IFNULL(SUM(efectivo),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
		
	
	
	/*
		w_parcialContado
	*/

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
				DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE  
		    DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE  
				DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT IFNULL(SUM(monto),0) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
 
	);		
	
	
	SET w_haberCaja = ( w_montoApertura +  w_totalContado )  -  ( w_montoValesEgreso +  w_montoValesIngreso );
	
	UPDATE   corte
	SET  
		 tipoCorte				=	2
		,cortePadre				=	0 
		,fechaCorte				=	w_edit_date
		,tiqueteInicial			=	w_TKT_INICIAL
		,tiqueteFinal			=	w_TKT_FINAL
		,ventasGravadasTKT		=	w_totalTKT
		,totalTiquete			=	w_totalTKT
		,totalTarjeta			=	w_totalTarjeta + w_parcialTarjeta
		,totalTransferencia		=	w_totalTransferencia + w_parcialTransferencia
		,facturaInicial			=	0
		,facturaFinal			=	0
		,ventasGravadasFCT		=	w_totalFCT
		,totalFCT				=	w_totalFCT
		,CCFInicial				=	0
		,CCFFinal				=	0
		,ventasGravadasCCF		=	w_totalCCF
		,totalCCF				=	w_totalCCF
		,montoValesIngreso		=	w_montoValesIngreso
		,montoValesEgreso		=	w_montoValesEgreso
		,totalCredito			=	w_totalCredito
		,totalContado			=	w_totalContado + w_parcialContado
		,totalIngresos			=	w_totalVenta
		,totalAnulado			=	w_totalAnulado
		,haberCaja				=	w_haberCaja
		,efectivoCaja			=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre				=	w_edit_time
		,estado					=	1
 
		,cajaID					=	JSON_VALUE(i_object,"$.cajaID")
		,areaID					=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
				,FORMAT(totalTarjeta,2) AS totalTarjeta
				,FORMAT(totalTransferencia,2) AS totalTransferencia

		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");
END;
;;  



/*
	11/02/2025
*/
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteZ_Finish;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteZ_Finish(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT 				DECIMAL(14,4);
	DECLARE w_totalFCT 				DECIMAL(14,4);
	DECLARE w_totalCCF 				DECIMAL(14,4);
	DECLARE w_TKT_INICIAL 			INT(12);
	DECLARE w_totalCredito   		DECIMAL(14,4);
	DECLARE w_totalContado   		DECIMAL(14,4);
	DECLARE w_parcialContado   		DECIMAL(14,4);
	
	
	DECLARE w_totalTransferencia   	DECIMAL(14,4);
	DECLARE w_parcialTransferencia  DECIMAL(14,4);
	
	
	DECLARE w_totalTarjeta   		DECIMAL(14,4);
	DECLARE w_parcialTarjeta   		DECIMAL(14,4);
	
	
	DECLARE w_totalMixto   			DECIMAL(14,4);	
	DECLARE w_totalVenta   			DECIMAL(14,4);
	DECLARE w_totalAnulado   		DECIMAL(14,4);
	DECLARE w_haberCaja   			DECIMAL(14,4);
	DECLARE w_montoApertura   		DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   			INT(12);
	
	DECLARE w_montoValesIngreso 	DECIMAL(14,4);
	DECLARE w_montoValesEgreso 		DECIMAL(14,4);	
	
    DECLARE w_edit_date 			DATETIME;
    DECLARE w_edit_time  			TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	
	/*
		Ventas al credito
	*/
	SET w_montoApertura = (
	
		SELECT IFNULL(montoApertura,0) 
		FROM corte
		WHERE  id  = JSON_VALUE(i_object,"$.id")
 
	);		
	
	
	/*
		Ventas Transferencia
	*/
	SET w_totalTransferencia = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND formaPagoID = 2
			  AND estado = 2
			  AND documentoID <> 4
	);	
	


	/*
		Ventas Tarjeta Credito / Debito
	*/
	SET w_totalTarjeta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND formaPagoID = 3
			  AND estado = 2
			  AND documentoID <> 4
	);


	/*
		Ventas Mixto
	*/
	SET w_totalMixto = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);
	
	
	SET w_parcialTransferencia = (
	
		SELECT IFNULL(SUM(transferencia),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialTarjeta = (
	
		SELECT IFNULL(SUM(tarjeta),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialContado = (
	
		SELECT IFNULL(SUM(efectivo),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
		
	
	
	/*
		w_parcialContado
	*/

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
				DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND documentoID = 2
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND documentoID = 3
			  AND estado = 2
	);		
	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE  
		    DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE  
				DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE  
		      DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
 
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT IFNULL(SUM(monto),0) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
 
	);		
	
	
	SET w_haberCaja = ( w_montoApertura +  w_totalContado )  -  ( w_montoValesEgreso +  w_montoValesIngreso );
	
	UPDATE   corte
	SET  
		 tipoCorte				=	2
		,cortePadre				=	0 
		,fechaCorte				=	w_edit_date
		,tiqueteInicial			=	w_TKT_INICIAL
		,tiqueteFinal			=	w_TKT_FINAL
		,ventasGravadasTKT		=	w_totalTKT
		,totalTiquete			=	w_totalTKT
		,totalTarjeta			=	w_totalTarjeta + w_parcialTarjeta
		,totalTransferencia		=	w_totalTransferencia + w_parcialTransferencia
		,facturaInicial			=	0
		,facturaFinal			=	0
		,ventasGravadasFCT		=	w_totalFCT
		,totalFCT				=	w_totalFCT
		,CCFInicial				=	0
		,CCFFinal				=	0
		,ventasGravadasCCF		=	w_totalCCF
		,totalCCF				=	w_totalCCF
		,montoValesIngreso		=	w_montoValesIngreso
		,montoValesEgreso		=	w_montoValesEgreso
		,totalCredito			=	w_totalCredito
		,totalContado			=	w_totalContado + w_parcialContado
		,totalFacturado			=	w_totalVenta
		,totalAnulado			=	w_totalAnulado
		,haberCaja				=	w_haberCaja
		,efectivoCaja			=	JSON_VALUE(i_object,"$.efectivoCaja")
		,horaCierre				=	w_edit_time
		,estado					=	2
		,cajeroID				=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID					=	JSON_VALUE(i_object,"$.cajaID")
		,areaID					=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalFacturado,2) AS totalFacturado
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
				,FORMAT(totalTarjeta,2) AS totalTarjeta
				,FORMAT(totalTransferencia,2) AS totalTransferencia

		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");
END;
;;  


DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Finish;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Finish(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT 				DECIMAL(14,4);
	DECLARE w_totalFCT 				DECIMAL(14,4);
	DECLARE w_totalCCF 				DECIMAL(14,4);
	DECLARE w_TKT_INICIAL 			INT(12);
	DECLARE w_totalCredito   		DECIMAL(14,4);
	DECLARE w_totalContado   		DECIMAL(14,4);
	DECLARE w_parcialContado   		DECIMAL(14,4);
	DECLARE w_totalIngresos   		DECIMAL(14,4);
	DECLARE w_totalGeneral   		DECIMAL(14,4);
	DECLARE w_subtotal   			DECIMAL(14,4);
	DECLARE w_efectivoCaja   		DECIMAL(14,4);
	DECLARE w_diferencia   			DECIMAL(14,4);
	DECLARE w_sobrante   			DECIMAL(14,4);
	DECLARE w_faltante   			DECIMAL(14,4);
	
	
	DECLARE w_totalTransferencia   	DECIMAL(14,4);
	DECLARE w_parcialTransferencia   	DECIMAL(14,4);
	
	
	DECLARE w_totalTarjeta   		DECIMAL(14,4);
	DECLARE w_parcialTarjeta   		DECIMAL(14,4);
	
	
	DECLARE w_totalMixto   			DECIMAL(14,4);	
	DECLARE w_totalVenta   			DECIMAL(14,4);
	DECLARE w_totalAnulado   		DECIMAL(14,4);
	DECLARE w_haberCaja   			DECIMAL(14,4);
	DECLARE w_montoApertura   		DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   			INT(12);
	
	DECLARE w_montoValesIngreso 	DECIMAL(14,4);
	DECLARE w_montoValesEgreso 		DECIMAL(14,4);	
	
    DECLARE w_edit_date 			DATETIME;
    DECLARE w_edit_time  			TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	
	/*
		Ventas al credito
	*/
	SET w_montoApertura = (
	
		SELECT IFNULL(montoApertura,0) 
		FROM corte
		WHERE  id  = JSON_VALUE(i_object,"$.id")
 
	);		
	
	
	/*
		Ventas Transferencia
	*/
	SET w_totalTransferencia = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND estado = 2
			  AND documentoID <> 4
	);	
	


	/*
		Ventas Tarjeta Credito / Debito
	*/
	SET w_totalTarjeta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 3
			  AND estado = 2
			  AND documentoID <> 4
	);


	/*
		Ventas Mixto
	*/
	SET w_totalMixto = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);
	
	
	SET w_parcialTransferencia = (
	
		SELECT IFNULL(SUM(transferencia),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialTarjeta = (
	
		SELECT IFNULL(SUM(tarjeta),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialContado = (
	
		SELECT IFNULL(SUM(efectivo),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
		
	
	
	/*
		w_parcialContado
	*/

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND estado = 2
	);		
	
	

	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 4
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT IFNULL(SUM(monto),0) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	
	SET w_totalIngresos = w_totalTKT + w_totalFCT + w_totalCCF;
	
	SET w_totalGeneral = w_totalIngresos - 	w_montoValesEgreso;
	
	
	
	SET w_subtotal	= w_totalGeneral - (w_totalTarjeta + w_parcialTarjeta) -  (w_totalTransferencia + w_parcialTransferencia);
	
	
	SET w_haberCaja = w_montoApertura + w_subtotal;
	
	SET w_efectivoCaja = JSON_VALUE(i_object,"$.efectivoCaja");
	
	SET w_diferencia = w_efectivoCaja - w_haberCaja;
	
	SET w_sobrante = 0;
	SET w_faltante = 0;
	
	IF w_diferencia < 0 THEN 
		SET w_faltante = w_diferencia;
	END IF;
	
	IF w_diferencia >= 0 THEN 
		SET w_sobrante = w_diferencia;
	END IF;	
	
	UPDATE   corte
	SET  
		 tipoCorte				=	1
		,cortePadre				=	0 
		,fechaCorte				=	w_edit_date
		,tiqueteInicial			=	w_TKT_INICIAL
		,tiqueteFinal			=	w_TKT_FINAL
		,ventasGravadasTKT		=	w_totalTKT
		,totalTiquete			=	w_totalTKT
		,totalTarjeta			=	w_totalTarjeta + w_parcialTarjeta
		,totalTransferencia		=	w_totalTransferencia + w_parcialTransferencia
		,facturaInicial			=	0
		,facturaFinal			=	0
		,ventasGravadasFCT		=	w_totalFCT
		,totalFCT				=	w_totalFCT
		,CCFInicial				=	0
		,CCFFinal				=	0
		,ventasGravadasCCF		=	w_totalCCF
		,totalCCF				=	w_totalCCF
		,montoValesIngreso		=	w_montoValesIngreso
		,montoValesEgreso		=	w_montoValesEgreso
		,totalCredito			=	w_totalCredito
		,totalContado			=	w_totalContado + w_parcialContado
		,totalIngresos			=	w_totalIngresos
		,totalGeneral			=	w_totalGeneral
		,diferencia				=	w_diferencia
		,subtotal				=	w_subtotal
		,sobrante				=	w_sobrante
		,faltante				=	w_faltante
		,totalAnulado			=	w_totalAnulado
		,haberCaja				=	w_haberCaja
		,efectivoCaja			=	w_efectivoCaja
		,horaCierre				=	w_edit_time
		,estado					=	2
		,cajeroID				=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID					=	JSON_VALUE(i_object,"$.cajaID")
		,areaID					=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
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
				,FORMAT(totalCCF,2) AS totalCCF
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalIngresos,2) AS totalIngresos
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
				,FORMAT(sobrante,2) AS sobrante
				,FORMAT(faltante,2) AS faltante
				,FORMAT(totalTarjeta,2) AS totalTarjeta
				,FORMAT(totalTransferencia,2) AS totalTransferencia

		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	

/*
	20/02/2025
	eliminar vales de egresos
	restar las cortesias
*/
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Partial;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Partial(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT 				DECIMAL(14,4);
	DECLARE w_totalFCT 				DECIMAL(14,4);
	DECLARE w_totalCCF 				DECIMAL(14,4);
	DECLARE w_TKT_INICIAL 			INT(12);
	DECLARE w_totalCredito   		DECIMAL(14,4);
	DECLARE w_totalContado   		DECIMAL(14,4);
	DECLARE w_parcialContado   		DECIMAL(14,4);
	DECLARE w_totalIngresos   		DECIMAL(14,4);
	DECLARE w_totalGeneral   		DECIMAL(14,4);
	DECLARE w_subtotal   			DECIMAL(14,4);
	DECLARE w_efectivoCaja   		DECIMAL(14,4);
	DECLARE w_diferencia   			DECIMAL(14,4);
	DECLARE w_sobrante   			DECIMAL(14,4);
	DECLARE w_faltante   			DECIMAL(14,4);
	
	
	DECLARE w_totalTransferencia   	DECIMAL(14,4);
	DECLARE w_parcialTransferencia   	DECIMAL(14,4);
	
	
	DECLARE w_totalTarjeta   		DECIMAL(14,4);
	DECLARE w_parcialTarjeta   		DECIMAL(14,4);
	
	
	DECLARE w_totalMixto   			DECIMAL(14,4);	
	DECLARE w_totalVenta   			DECIMAL(14,4);
	DECLARE w_totalAnulado   		DECIMAL(14,4);
	DECLARE w_haberCaja   			DECIMAL(14,4);
	DECLARE w_montoApertura   		DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   			INT(12);
	DECLARE w_CCF_INICIAL   		INT(12);
	DECLARE w_CCF_FINAL   			INT(12);
	DECLARE w_FCT_INICIAL   		INT(12);
	DECLARE w_FCT_FINAL   			INT(12);
	
	DECLARE w_montoValesIngreso 	DECIMAL(14,4);
	DECLARE w_montoValesEgreso 		DECIMAL(14,4);	
	
    DECLARE w_edit_date 			DATETIME;
    DECLARE w_edit_time  			TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	
	/*
		Ventas al credito
	*/
	SET w_montoApertura = (
	
		SELECT IFNULL(montoApertura,0) 
		FROM corte
		WHERE  id  = JSON_VALUE(i_object,"$.id")
 
	);		
	
	
	/*
		Ventas Transferencia
	*/
	SET w_totalTransferencia = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND estado = 2
			  AND documentoID <> 4
	);	
	


	/*
		Ventas Tarjeta Credito / Debito
	*/
	SET w_totalTarjeta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 3
			  AND estado = 2
			  AND documentoID <> 4
	);


	/*
		Ventas Mixto
	*/
	SET w_totalMixto = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);
	
	
	SET w_parcialTransferencia = (
	
		SELECT IFNULL(SUM(transferencia),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialTarjeta = (
	
		SELECT IFNULL(SUM(tarjeta),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialContado = (
	
		SELECT IFNULL(SUM(efectivo),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
		
	
	
	/*
		w_parcialContado
	*/

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
 
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
 
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
 
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND estado = 2
	);		
	
	

	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	
	
	SET w_CCF_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 2
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_CCF_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 2
				AND ( estado = 2 OR estado = 4)
	); 		
	

	SET w_FCT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 3
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_FCT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 3
				AND ( estado = 2 OR estado = 4)
	); 
	
	/*
		23/02/2025 9:51 am
		Cortesias
	*/
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 5
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT IFNULL(SUM(monto),0) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	
	SET w_totalIngresos = w_totalTKT + w_totalFCT + w_totalCCF;
	
	SET w_totalGeneral = w_totalIngresos - 	w_montoValesIngreso;
	
	
	
	SET w_subtotal	= w_totalGeneral - (w_totalTarjeta + w_parcialTarjeta) -  (w_totalTransferencia + w_parcialTransferencia);
	
	
	SET w_haberCaja = w_montoApertura + w_subtotal;
	
	SET w_efectivoCaja = JSON_VALUE(i_object,"$.efectivoCaja");
	
	SET w_diferencia = w_efectivoCaja - w_haberCaja;
	
	SET w_sobrante = 0;
	SET w_faltante = 0;
	
	IF w_diferencia < 0 THEN 
		SET w_faltante = w_diferencia;
	END IF;
	
	IF w_diferencia >= 0 THEN 
		SET w_sobrante = w_diferencia;
	END IF;	
	
	UPDATE   corte
	SET  
		 tipoCorte				=	1
		,cortePadre				=	0 
		,fechaCorte				=	w_edit_date
		,tiqueteInicial			=	w_TKT_INICIAL
		,tiqueteFinal			=	w_TKT_FINAL
		,ventasGravadasTKT		=	w_totalTKT
		,totalTiquete			=	w_totalTKT
		,totalTarjeta			=	w_totalTarjeta + w_parcialTarjeta
		,totalTransferencia		=	w_totalTransferencia + w_parcialTransferencia
		,facturaInicial			=	0
		,facturaFinal			=	0
		,ventasGravadasFCT		=	w_totalFCT
		,totalFCT				=	w_totalFCT
		,CCFInicial				=	w_CCF_INICIAL
		,CCFFinal				=	w_CCF_FINAL
		,ventasGravadasCCF		=	w_totalCCF
		,totalCCF				=	w_totalCCF
		,montoValesIngreso		=	w_montoValesIngreso
		,montoValesEgreso		=	w_montoValesEgreso
		,totalCredito			=	w_totalCredito
		,totalContado			=	w_totalContado + w_parcialContado
		,totalIngresos			=	w_totalIngresos
		,totalGeneral			=	w_totalGeneral
		,subtotal				=	w_subtotal
		,sobrante				=	w_sobrante
		,faltante				=	w_faltante
		,totalAnulado			=	w_totalAnulado
		,haberCaja				=	w_haberCaja
		,efectivoCaja			=	w_efectivoCaja
		,horaCierre				=	w_edit_time
		,estado					=	1
		,cajeroID				=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID					=	JSON_VALUE(i_object,"$.cajaID")
		,areaID					=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
				,tiqueteInicial
				,tiqueteFinal
				,ventasGravadasTKT
				,FORMAT(totalTiquete,2) AS totalTiquete
				,facturaInicial
				,facturaFinal
				,ventasGravadasFCT
				,FORMAT(totalFCT,2) AS totalFCT
				,FORMAT(totalCCF,2) AS totalCCF
				,CCFInicial
				,CCFFinal
				,ventasGravadasCCF
 
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalGeneral,2) AS totalGeneral
				,FORMAT(sobrante,2) AS sobrante
				,FORMAT(faltante,2) AS faltante
				,FORMAT(subtotal,2) AS subtotal
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalIngresos,2) AS totalIngresos
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
				,FORMAT(totalTarjeta,2) AS totalTarjeta
				,FORMAT(totalTransferencia,2) AS totalTransferencia

		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	



/*
	20/02/2025
	eliminar vales de egresos
	restar las cortesias
*/
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CorteX_Finish;
;;

DELIMITER ;;
CREATE  PROCEDURE SP_CorteX_Finish(
	 
	 IN i_object JSON
)	 
BEGIN 
	DECLARE w_totalTKT 				DECIMAL(14,4);
	DECLARE w_totalFCT 				DECIMAL(14,4);
	DECLARE w_totalCCF 				DECIMAL(14,4);
	DECLARE w_TKT_INICIAL 			INT(12);
	DECLARE w_totalCredito   		DECIMAL(14,4);
	DECLARE w_totalContado   		DECIMAL(14,4);
	DECLARE w_parcialContado   		DECIMAL(14,4);
	DECLARE w_totalIngresos   		DECIMAL(14,4);
	DECLARE w_totalGeneral   		DECIMAL(14,4);
	DECLARE w_subtotal   			DECIMAL(14,4);
	DECLARE w_efectivoCaja   		DECIMAL(14,4);
	DECLARE w_diferencia   			DECIMAL(14,4);
	DECLARE w_sobrante   			DECIMAL(14,4);
	DECLARE w_faltante   			DECIMAL(14,4);
	
	
	DECLARE w_totalTransferencia   	DECIMAL(14,4);
	DECLARE w_parcialTransferencia   	DECIMAL(14,4);
	
	
	DECLARE w_totalTarjeta   		DECIMAL(14,4);
	DECLARE w_parcialTarjeta   		DECIMAL(14,4);
	
	
	DECLARE w_totalMixto   			DECIMAL(14,4);	
	DECLARE w_totalVenta   			DECIMAL(14,4);
	DECLARE w_totalAnulado   		DECIMAL(14,4);
	DECLARE w_haberCaja   			DECIMAL(14,4);
	DECLARE w_montoApertura   		DECIMAL(14,4);
	
	DECLARE w_TKT_FINAL   			INT(12);
	DECLARE w_CCF_INICIAL   		INT(12);
	DECLARE w_CCF_FINAL   			INT(12);
	DECLARE w_FCT_INICIAL   		INT(12);
	DECLARE w_FCT_FINAL   			INT(12);
	
	DECLARE w_montoValesIngreso 	DECIMAL(14,4);
	DECLARE w_montoValesEgreso 		DECIMAL(14,4);	
	
    DECLARE w_edit_date 			DATETIME;
    DECLARE w_edit_time  			TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();
	
	
	
	
	/*
		Ventas al credito
	*/
	SET w_montoApertura = (
	
		SELECT IFNULL(montoApertura,0) 
		FROM corte
		WHERE  id  = JSON_VALUE(i_object,"$.id")
 
	);		
	
	
	/*
		Ventas Transferencia
	*/
	SET w_totalTransferencia = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 2
			  AND estado = 2
			  AND documentoID <> 4
	);	
	


	/*
		Ventas Tarjeta Credito / Debito
	*/
	SET w_totalTarjeta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 3
			  AND estado = 2
			  AND documentoID <> 4
	);


	/*
		Ventas Mixto
	*/
	SET w_totalMixto = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);
	
	
	SET w_parcialTransferencia = (
	
		SELECT IFNULL(SUM(transferencia),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialTarjeta = (
	
		SELECT IFNULL(SUM(tarjeta),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
	
	
	SET w_parcialContado = (
	
		SELECT IFNULL(SUM(efectivo),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 4
			  AND estado = 2
			  AND documentoID <> 4
	);	
		
	
	
	/*
		w_parcialContado
	*/

	/*
		Ventas al Contado
	*/
	SET w_totalContado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 1
			  AND estado = 2
	);


	/*
		Ventas totales
	*/
	SET w_totalVenta = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 2
			  
	);

	/*
		Ventas Anulados
	*/
	SET w_totalAnulado = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND estado = 4
	);


	
	/*
		Tiquetes
	*/
	SET w_totalTKT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
 
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND (documentoID = 1 OR documentoID = 4)
				AND estado = 2
	);
	

	/*
		Facturas
	*/
	
	SET w_totalFCT = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
 
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 3
			  AND estado = 2
	);	
	
	
	/*
		CCF
	*/
	
	SET w_totalCCF = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
 
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND documentoID = 2
			  AND estado = 2
	);		
	
	

	
	SET w_TKT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 1
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_TKT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 1
				AND ( estado = 2 OR estado = 4)
	); 	


	SET w_CCF_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 2
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_CCF_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 2
				AND ( estado = 2 OR estado = 4)
	); 		
	

	SET w_FCT_INICIAL = (
	
		SELECT IFNULL(MIN(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		    AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			AND corteID  = JSON_VALUE(i_object,"$.id")
			AND documentoID = 3
			AND ( estado = 2 OR estado = 4)
	); 
	
	SET w_FCT_FINAL = (
	
		SELECT IFNULL(MAX(numeroDocumento),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
				AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
				AND corteID  = JSON_VALUE(i_object,"$.id")
				AND documentoID = 3
				AND ( estado = 2 OR estado = 4)
	); 	
	
	
	/*
		23/02/2025
		Cortesias
	*/
	SET w_montoValesIngreso = (
	
		SELECT IFNULL(SUM(total),0) 
		FROM venta
		WHERE cajeroID = JSON_VALUE(i_object,"$.cajeroID")
		      AND DATE_FORMAT(fechaVenta,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')
			  AND corteID  = JSON_VALUE(i_object,"$.id")
			  AND formaPagoID = 5
			  AND estado = 2
	);
	
	SET w_montoValesEgreso = (
		SELECT IFNULL(SUM(monto),0) 
		FROM vale
		WHERE  DATE_FORMAT(fechaHora,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y') 
		       AND tipo = 2
			   AND cajeroID = JSON_VALUE(i_object,"$.cajeroID")
			   AND corteID  = JSON_VALUE(i_object,"$.id")
	);		
	
	
	SET w_totalIngresos = w_totalTKT + w_totalFCT + w_totalCCF;
	
	SET w_totalGeneral = w_totalIngresos - 	w_montoValesIngreso;
	
	
	
	SET w_subtotal	= w_totalGeneral - (w_totalTarjeta + w_parcialTarjeta) -  (w_totalTransferencia + w_parcialTransferencia);
	
	
	SET w_haberCaja = w_montoApertura + w_subtotal;
	
	SET w_efectivoCaja = JSON_VALUE(i_object,"$.efectivoCaja");
	
	SET w_diferencia = w_efectivoCaja - w_haberCaja;
	
	 
	SET w_faltante = 0;
	SET w_sobrante = 0;
	
	IF w_diferencia < 0 THEN 
		SET w_faltante = w_diferencia;
	END IF;
	
	IF w_diferencia >= 0 THEN 
		SET w_sobrante = w_diferencia;
	END IF;	
	
	UPDATE   corte
	SET  
		 tipoCorte				=	1
		,cortePadre				=	0 
		,fechaCorte				=	w_edit_date
		,tiqueteInicial			=	w_TKT_INICIAL
		,tiqueteFinal			=	w_TKT_FINAL
		,ventasGravadasTKT		=	w_totalTKT
		,totalTiquete			=	w_totalTKT
		,totalTarjeta			=	w_totalTarjeta + w_parcialTarjeta
		,totalTransferencia		=	w_totalTransferencia + w_parcialTransferencia
		,facturaInicial			=	w_FCT_INICIAL
		,facturaFinal			=	w_FCT_FINAL
		,ventasGravadasFCT		=	w_totalFCT
		,totalFCT				=	w_totalFCT
		,CCFInicial				=	w_CCF_INICIAL
		,CCFFinal				=	w_CCF_FINAL
		,ventasGravadasCCF		=	w_totalCCF
		,totalCCF				=	w_totalCCF
		,montoValesIngreso		=	w_montoValesIngreso
		,montoValesEgreso		=	w_montoValesEgreso
		,totalCredito			=	w_totalCredito
		,totalContado			=	w_totalContado + w_parcialContado
		,totalIngresos			=	w_totalIngresos
		,totalGeneral			=	w_totalGeneral
		,subtotal				=	w_subtotal
		,sobrante				=	w_sobrante
		,faltante				=	w_faltante
		,totalAnulado			=	w_totalAnulado
		,haberCaja				=	w_haberCaja
		,efectivoCaja			=	w_efectivoCaja
		,horaCierre				=	w_edit_time
		,estado					=	2
		,cajeroID				=	JSON_VALUE(i_object,"$.cajeroID")
		,cajaID					=	JSON_VALUE(i_object,"$.cajaID")
		,areaID					=	JSON_VALUE(i_object,"$.areaID")
			
	WHERE      id = JSON_VALUE(i_object,"$.id");
	
	
		SELECT   
				id
				,CASE tipoCorte WHEN 1 THEN 'CORTE X' WHEN 2 THEN 'CORTE Z' END AS tipoCorte
				,cortePadre
				,DATE_FORMAT(fechaInicio,'%d/%m/%Y %H: %i: %s') AS fechaInicio
				,fechaCorte
				,FORMAT(montoApertura,2) AS montoApertura
				,tiqueteInicial
				,tiqueteFinal
				,ventasGravadasTKT
				,FORMAT(totalTiquete,2) AS totalTiquete
				,facturaInicial
				,facturaFinal
				,ventasGravadasFCT
				,FORMAT(totalFCT,2) AS totalFCT
				,FORMAT(totalCCF,2) AS totalCCF
				,CCFInicial
				,CCFFinal
				,ventasGravadasCCF
 
				,FORMAT(montoValesIngreso,2) AS montoValesIngreso
				,FORMAT(montoValesEgreso,2) AS montoValesEgreso
				,FORMAT(efectivoCaja,2) AS efectivoCaja
				,horaInicio
				,horaCierre
				,CASE estado WHEN 1 THEN 'VIGENTE' WHEN 2 THEN 'CERRADO' END AS estado
 				,cajeroID
				,cajaID
				,areaID
				,FORMAT(totalGeneral,2) AS totalGeneral
				,FORMAT(sobrante,2) AS sobrante
				,FORMAT(faltante,2) AS faltante
				,FORMAT(subtotal,2) AS subtotal
				,FORMAT(totalCredito,2) AS totalCredito
				,FORMAT(totalContado,2) AS totalContado
				,FORMAT(totalIngresos,2) AS totalIngresos
				,FORMAT(totalAnulado,2) AS totalAnulado
				,FORMAT(haberCaja,2) AS haberCaja
				,FORMAT(totalTarjeta,2) AS totalTarjeta
				,FORMAT(totalTransferencia,2) AS totalTransferencia

		
		FROM 	corte
		WHERE   id = JSON_VALUE(i_object,"$.id");

END;
;;  	

DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_EXISTE_CORTE_X_ABIERTO
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_EXISTE_CORTE_X_ABIERTO(
  IN i_cajaID INT(12)
)
BEGIN 
    
	DECLARE w_id INT(12);
	DECLARE w_count INT(12);

    DECLARE w_edit_date 			DATETIME;
    DECLARE w_edit_time  			TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();

	SET w_count = (
		SELECT IFNULL(COUNT(1),0) 
		FROM corte 
		WHERE 	estado = 1
				AND tipoCorte = 1
				AND DATE_FORMAT(fechaInicio,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')  
				AND cajaID = i_cajaID
	);
	
	
	SET w_id = (
		SELECT IFNULL(id,0) 
		FROM corte 
		WHERE 	estado = 1
				AND tipoCorte = 1
				AND DATE_FORMAT(fechaInicio,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')  
				AND cajaID = i_cajaID
		LIMIT 1
	);	
	
	IF w_id IS NULL THEN
		SET w_id = 0;
	END IF;
			
	SELECT   w_id AS id,
			 w_count    AS total;


END;

;;

/*
	INCONSISTENCIA DE DATOS
	
*/
DELIMITER ;; 
DROP PROCEDURE IF EXISTS  SP_CAJA_INICIALIZADA
;;


DELIMITER ;; 
CREATE   PROCEDURE SP_CAJA_INICIALIZADA(
 IN i_object JSON
)
BEGIN 
    
	DECLARE w_id INT(12);
	DECLARE w_count INT(12);

    DECLARE w_edit_date 			DATETIME;
    DECLARE w_edit_time  			TIME; 
	SET time_zone = "-06:00";	
    SET w_edit_date = NOW(); 
    SET w_edit_time  = CURTIME();


	SET w_count = (
		SELECT COUNT(1) 
		FROM corte 
		WHERE 	estado = 1
				AND DATE_FORMAT(fechaCorte,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')  
				AND	 cajeroID 	= 	JSON_VALUE(i_object,"$.cajeroID")
				AND cajaID 	= 	JSON_VALUE(i_object,"$.cajaID")
				AND areaID  = 	JSON_VALUE(i_object,"$.areaID")
				AND tipoCorte = 1
	);
	
	
	SET w_id = (
		SELECT id 
		FROM corte 
		WHERE 	estado = 1
				AND DATE_FORMAT(fechaCorte,'%d/%m/%Y') = DATE_FORMAT(w_edit_date,'%d/%m/%Y')  
				AND	 cajeroID 	= 	JSON_VALUE(i_object,"$.cajeroID")
				AND cajaID 		= 	JSON_VALUE(i_object,"$.cajaID")
				AND areaID  	= 	JSON_VALUE(i_object,"$.areaID")
				AND tipoCorte = 1
		LIMIT 1
	);	
			
	SELECT   w_id AS id,
			 'Resultado' AS resultado,
			  JSON_VALUE(i_object,"$.cajeroID") AS cajeroID,
			  JSON_VALUE(i_object,"$.cajaID") AS cajaID,
	          w_count    AS total;


END;

;;