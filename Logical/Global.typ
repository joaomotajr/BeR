
TYPE
	TipoTransmiter : 	STRUCT 
		idTxSoftware : STRING[80];
		txValueDet : REAL;
	END_STRUCT;
	TipoEstruturaDG_type : 	STRUCT 
		Estatos : REAL;
		TX : STRING[80];
		visDet : USINT;
		ID : STRING[80] := '1';
		Alarme2 : BOOL;
		Alarme1 : BOOL;
		Area : USINT;
	END_STRUCT;
	TipoEstrutura : 	STRUCT 
		DG : {REDUND_UNREPLICABLE} ARRAY[0..MAX_IDX_DETECTORES]OF TipoEstruturaDG_type;
		visDet01 : USINT;
		visDet02 : USINT;
		visDet03 : USINT;
		visDet04 : USINT;
		visDet05 : USINT;
		visSinVd : BOOL;
		visSinAm : BOOL;
		visSinVm : BOOL;
		do01SinVd : BOOL;
		do02SinAm : BOOL;
		do03SinVm : BOOL;
		do04SinVd : BOOL;
		do05SinAm : BOOL;
		do06SinVm : BOOL;
		do08Modem : BOOL;
		do07Buzer : BOOL;
		visNameDG1 : STRING[80];
		visNameDG2 : STRING[80];
		visNameDG3 : STRING[80];
		visNameDG4 : STRING[80];
		visNameDG5 : STRING[80];
		visModemReset : BOOL;
	END_STRUCT;
END_TYPE
