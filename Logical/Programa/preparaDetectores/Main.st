
PROGRAM _INIT
	(* Prepara o range dos detectores *)
	
	//Configura detector 1
	Estrutura.DG[1].Area 	:= 2;
	Estrutura.DG[2].Area 	:= 2;
	Estrutura.DG[3].Area 	:= 2;	
	Estrutura.DG[4].Area 	:= 1;
	Estrutura.DG[5].Area 	:= 2;	
	
	Estrutura.DG[1].ID		:= '73';
	Estrutura.DG[2].ID		:= '74';
	Estrutura.DG[3].ID		:= '75';
	Estrutura.DG[4].ID		:= '72';
	Estrutura.DG[5].ID		:= '76';

	LCRScal_DG[1].x1 := 0.0;	 //x1 e x2 não pode ser alterado, y1 e y2 é o range do detector
	LCRScal_DG[1].y1 := 0.0;
	LCRScal_DG[1].x2 := 32767.0;
	LCRScal_DG[1].y2 := 50.0;
	
	LCRScal_DG[2].x1 := 0.0;	 //x1 e x2 não pode ser alterado, y1 e y2 é o range do detector
	LCRScal_DG[2].y1 := 0.0;
	LCRScal_DG[2].x2 := 32767.0;
	LCRScal_DG[2].y2 := 100.0;
	
	LCRScal_DG[3].x1 := 0.0;	 //x1 e x2 não pode ser alterado, y1 e y2 é o range do detector
	LCRScal_DG[3].y1 := 0.0;
	LCRScal_DG[3].x2 := 32767.0;
	LCRScal_DG[3].y2 := 1000.0;

	LCRScal_DG[4].x1 := 0.0;	 //x1 e x2 não pode ser alterado, y1 e y2 é o range do detector
	LCRScal_DG[4].y1 := 0.0;
	LCRScal_DG[4].x2 := 32767.0;
	LCRScal_DG[4].y2 := 1000.0;

	LCRScal_DG[5].x1 := 0.0;	 //x1 e x2 não pode ser alterado, y1 e y2 é o range do detector
	LCRScal_DG[5].y1 := 0.0;
	LCRScal_DG[5].x2 := 32767.0;
	LCRScal_DG[5].y2 := 100.0;

	
	
			
END_PROGRAM

PROGRAM _CYCLIC
	
	FOR uIdx := 0 TO MAX_IDX_DETECTORES BY 1 DO
		
		(* Converte em numero real os valores da entrada analogica *)
		LCRScal_DG[uIdx].x := INT_TO_REAL(aiDG[uIdx]);
		
		(* Chama o bloco de função e declara nas variaveis os resultados *)	
		LCRScal_DG[uIdx]();
		Estrutura.DG[uIdx].Estatos 	:= LCRScal_DG[uIdx].y;
		Estrutura.DG[uIdx].TX		:= REAL_TO_STRING (Estrutura.DG[uIdx].Estatos * 100000);
		
	END_FOR;
		
END_PROGRAM
