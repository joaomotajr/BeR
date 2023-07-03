
PROGRAM _INIT
	
	uri     := '/api/historic/SaveByPositionUid2';  
	
	httpClient_0.pHost 				:= ADR (Host);
	httpClient_0.hostPort			:= HostPort;	
	httpClient_0.method 			:= httpMETHOD_GET;
	httpClient_0.option 			:= httpOPTION_HTTP_11;
	httpClient_0.pResponseData 		:= ADR (Responsedata);
	httpClient_0.responseDataSize	:= SIZEOF (Responsedata);
	httpClient_0.pUri    			:= ADR (sAuxiliar);
	
	TON_0.PT := T#15s;
	
END_PROGRAM

PROGRAM _CYCLIC	
	
	CASE eStep OF
		
		HTTP_STEP_DESABILITADO:
			
			bEnviar := TRUE;
			
			IF(bEnviar)THEN
				
				//Reseta comando
				bEnviar := FALSE;				
				iDG := 1;
				
				eStep := HTTP_STEP_CONCATENA;
				
			END_IF
		
		HTTP_STEP_CONCATENA:
			
			sAuxiliar				:= CONCAT(uri, CONCAT('/', CONCAT(Estrutura.DG[iDG].ID, CONCAT('/', Estrutura.DG[iDG].TX))));
			httpClient_0.enable		:= TRUE;
			httpClient_0.send		:= TRUE;
		
			eStep := HTTP_STEP_ENVIA;
			
		HTTP_STEP_ENVIA:
			
			//Checa status do bloco
			IF(httpClient_0.status <> 65535)THEN
				
				IF(httpClient_0.status = 0)THEN
					
					//Reseta comandos
					httpClient_0.send	:= FALSE;					
					TON_0.IN := TRUE;
					
					eStep := HTTP_STEP_DELAY;
				ELSE
					eStep := HTTP_STEP_ERRO;
				END_IF
			ELSE
				eStep := HTTP_STEP_ERRO;
			END_IF		
		
		HTTP_STEP_DELAY:
		
			IF(TON_0.Q)THEN
				
				TON_0.IN := FALSE;				
				eStep := HTTP_STEP_PROXIMO_DG;
				
			END_IF
		
		
		HTTP_STEP_PROXIMO_DG:
		
			iDG := iDG + 1;
		
			IF(iDG > MAX_IDX_DETECTORES)THEN
				eStep := HTTP_STEP_CONCLUIDO;
			ELSE
				eStep := HTTP_STEP_CONCATENA;
			END_IF
		
		HTTP_STEP_CONCLUIDO:
			
			httpClient_0.enable := FALSE;
			httpClient_0.send	:= FALSE;
			TON_0.IN := FALSE;
		
			eStep := HTTP_STEP_DESABILITADO;
		
		HTTP_STEP_ABORTA:
		
			//Reseta blocos
			httpClient_0.enable := FALSE;
			httpClient_0.send	:= FALSE;
			TON_0.IN := FALSE;
			eStep := HTTP_STEP_DESABILITADO;
		
		HTTP_STEP_ERRO:
			
			//Reseta blocos
			httpClient_0.enable := FALSE;
			httpClient_0.send	:= FALSE;
			TON_0.IN := FALSE;
			eStep := HTTP_STEP_DESABILITADO;
		 

	END_CASE;
	
	//Chamada de execução do bloco de função
	httpClient_0();
	TON_0();
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Release Client instance *)
	httpClient_0(enable := 0, send := 0);
END_PROGRAM