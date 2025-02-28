/*
	28/02/2025
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

/*
	28/02/2025
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