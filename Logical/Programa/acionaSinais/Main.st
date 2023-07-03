
PROGRAM _INIT
	(*Prepara os sinalizador e IHM para luz verde acionada*)
	
	Estrutura.do01SinVd := 1; // Aciona a luz verde do sinalizador
	Estrutura.do02SinAm := 0; // Apaga a luz amarela da sinaleira
	Estrutura.do03SinVm := 0; // Apaga a luz Vermelha da sinaleira
	Estrutura.do04SinVd := 1; // Aciona a luz verde do sinalizador
	Estrutura.do05SinAm := 0; // Apaga a luz amarela da sinaleira
	Estrutura.do06SinVm := 0; // Apaga a luz Vermelha da sinaleira
	Estrutura.do07Buzer := 0;
	Estrutura.visSinVd := 1; //Aciona a luz verde da IHM
END_PROGRAM

PROGRAM _CYCLIC

	
	(************************************************************
	Checa os limetes de alarmes inferior e superior DO detector 01
	e faz os acionamentos dos sinalizadores de acordo com os
	limites.
	*************************************************************)


	IF Estrutura.DG[1].Estatos < 8 THEN
		Estrutura.visDet01 := 0;
		Estrutura.visSinVd := 1;
		Estrutura.DG[1].Alarme1	:= 0;
		Estrutura.DG[1].Alarme2	:= 0;


	ELSIF Estrutura.DG[1].Estatos >= 8  AND Estrutura.DG[1].Estatos < 12  THEN 
		Estrutura.visDet01 := 1;
		Estrutura.DG[1].Alarme1	:= 1;
		
	ELSIF Estrutura.DG[1].Estatos >= 12  THEN 
		Estrutura.visDet01 := 2;
		Estrutura.DG[1].Alarme1	:= 0;
		Estrutura.DG[1].Alarme2	:= 1;

	END_IF
	
		
	(************************************************************
	Checa os limetes de alarmes inferior e superior DO detector 02
	e faz os acionamentos dos sinalizadores de acordo com os
	limites.
	*************************************************************)
		
	
	IF Estrutura.DG[2].Estatos < 39 THEN
		Estrutura.visDet02 := 0;
		Estrutura.DG[2].Alarme1	:= 0;
		Estrutura.DG[2].Alarme2	:= 0;


	ELSIF Estrutura.DG[2].Estatos >= 39  AND Estrutura.DG[2].Estatos < 43  THEN 
		Estrutura.visDet02 := 1;
		Estrutura.DG[2].Alarme1	:= 1;

	ELSIF Estrutura.DG[2].Estatos >= 43  THEN 
		Estrutura.visDet02 := 2;
		Estrutura.DG[2].Alarme1	:= 0;
		Estrutura.DG[2].Alarme2	:= 1;


	END_IF
	
	(************************************************************
	Checa os limetes de alarmes inferior e superior DO detector 03
	e faz os acionamentos dos sinalizadores de acordo com os
	limites.
	*************************************************************)
	
	
	IF Estrutura.DG[3].Estatos < 20 THEN
		Estrutura.visDet03 := 0;
		Estrutura.DG[3].Alarme1	:= 0;
		Estrutura.DG[3].Alarme2	:= 0;


	ELSIF Estrutura.DG[3].Estatos >= 20  AND Estrutura.DG[3].Estatos < 40  THEN 
		Estrutura.visDet03 := 1;
		Estrutura.DG[3].Alarme1	:= 1;
		
	ELSIF Estrutura.DG[3].Estatos >= 40  THEN 
		Estrutura.visDet03 := 2;
		Estrutura.DG[3].Alarme1	:= 0;
		Estrutura.DG[3].Alarme2	:= 1;


	END_IF

	(************************************************************
	Checa os limetes de alarmes inferior e superior DO detector 04
	e faz os acionamentos dos sinalizadores de acordo com os
	limites.
	*************************************************************)
	

	IF Estrutura.DG[4].Estatos < 39 THEN
		Estrutura.visDet04 := 0;
		Estrutura.DG[4].Alarme1	:= 0;
		Estrutura.DG[4].Alarme2	:= 0;

	ELSIF Estrutura.DG[4].Estatos >= 39  AND Estrutura.DG[4].Estatos < 43  THEN 
		Estrutura.visDet04 := 1;
		Estrutura.DG[4].Alarme1	:= 1;
	
	ELSIF Estrutura.DG[4].Estatos >= 43  THEN 
		Estrutura.visDet04 := 2;
		Estrutura.DG[4].Alarme1	:= 0;
		Estrutura.DG[4].Alarme2	:= 1;


	END_IF
	
	(************************************************************
	Checa os limetes de alarmes inferior e superior DO detector 05
	e faz os acionamentos dos sinalizadores de acordo com os
	limites.
	*************************************************************)
	

	IF Estrutura.DG[5].Estatos < 10 THEN
		Estrutura.visDet05 := 0;
		Estrutura.DG[5].Alarme1	:= 0;
		Estrutura.DG[5].Alarme2	:= 0;

	ELSIF Estrutura.DG[5].Estatos >= 10  AND Estrutura.DG[5].Estatos < 20  THEN 
		Estrutura.visDet05 := 1;
		Estrutura.DG[5].Alarme1	:= 1;
		
		
	ELSIF Estrutura.DG[5].Estatos >= 20  THEN 
		Estrutura.visDet05 := 2;
		Estrutura.DG[5].Alarme1	:= 0;
		Estrutura.DG[5].Alarme2	:= 1;


	END_IF
	
	IF Estrutura.DG[1].Alarme1 OR Estrutura.DG[2].Alarme1 OR Estrutura.DG[3].Alarme1 OR Estrutura.DG[5].Alarme1 = 1 THEN
		Estrutura.do01SinVd	:= 0;
		Estrutura.do02SinAm := 1;
		Estrutura.do03SinVm := 0;
		Estrutura.do07Buzer	:= 0;
		Estrutura.visSinAm 	:= 1;
		Estrutura.visSinVd	:= 0;
		Estrutura.visSinVm	:= 0;
		
	ELSIF Estrutura.DG[4].Alarme1 = 1 THEN
		Estrutura.do04SinVd	:= 0;
		Estrutura.do05SinAm	:= 1;
		Estrutura.do06SinVm	:= 0;
		Estrutura.do07Buzer	:= 0;
		Estrutura.visSinAm 	:= 1;
		Estrutura.visSinVd	:= 0;
		Estrutura.visSinVm	:= 0;
		
	ELSIF Estrutura.DG[1].Alarme2 OR Estrutura.DG[2].Alarme2 OR Estrutura.DG[3].Alarme2 OR Estrutura.DG[5].Alarme2 = 1 THEN
		Estrutura.do01SinVd	:= 0;
		Estrutura.do02SinAm	:= 0;
		Estrutura.do03SinVm	:= 1;
		Estrutura.do07Buzer	:= 1;
		Estrutura.visSinVm 	:= 1;
		Estrutura.visSinAm	:= 0;
		Estrutura.visSinVd	:= 0;
		
	ELSIF Estrutura.DG[4].Alarme2 = 1 THEN
		Estrutura.do04SinVd	:= 0;
		Estrutura.do05SinAm	:= 0;
		Estrutura.do06SinVm	:= 1;
		Estrutura.do07Buzer	:= 1;
		Estrutura.visSinVm 	:= 1;
		Estrutura.visSinAm	:= 0;
		Estrutura.visSinVd	:= 0;
			
	ELSIF Estrutura.DG[1].Alarme1 OR Estrutura.DG[2].Alarme1 OR Estrutura.DG[3].Alarme1 OR Estrutura.DG[4].Alarme1 OR Estrutura.DG[5].Alarme1 OR Estrutura.DG[1].Alarme2 OR Estrutura.DG[2].Alarme2 OR Estrutura.DG[3].Alarme2 OR Estrutura.DG[4].Alarme2 OR Estrutura.DG[5].Alarme2 = 1 THEN
		Estrutura.do07Buzer := 1;
		
	ELSE 
		Estrutura.visSinVd	:= 1;
		Estrutura.visSinAm	:= 0;
		Estrutura.visSinVm	:= 0;
		Estrutura.do01SinVd	:= 1;
		Estrutura.do02SinAm	:= 0;
		Estrutura.do03SinVm	:= 0;
		Estrutura.do04SinVd	:= 1;
		Estrutura.do05SinAm	:= 0;
		Estrutura.do06SinVm	:= 0;
		Estrutura.do07Buzer	:= 0;


			
			
	END_IF
			
	

	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

