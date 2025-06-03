import std.stdio;
import std.conv;
import std.string;
import std.exception;
import std.random;

void msj(char[9]* refTab)
{
	writefln("  %s  |  %s  |  %s  ", (*refTab)[0], (*refTab)[1], (*refTab)[2]);
	writefln("-----|-----|-----");
	writefln("  %s  |  %s  |  %s  ", (*refTab)[3], (*refTab)[4], (*refTab)[5]);
	writefln("-----|-----|-----");
	writefln("  %s  |  %s  |  %s  ", (*refTab)[6], (*refTab)[7], (*refTab)[8]);
}

void turnoJugador(char[9]* refTab, char* refJug, char* refCom, bool* refTurnoJug)
{
	// - Entrada por consola - //
	writeln("Por favor ingrese la pocición en la que quiere colocar su ficha (1-9)");
	auto entradaTxt = readln();

	// - Manejo de la entrada - //
	if (isNumeric(chomp(entradaTxt)) == true)
	{
		int entradaInt = to!int(chomp(entradaTxt));
		if ((entradaInt - 1) >= 0 && (entradaInt - 1) < 9)
		{
			if ((*refTab)[entradaInt - 1] != *refJug && (*refTab)[entradaInt - 1] != *refCom)
			{
				(*refTab)[entradaInt - 1] = *refJug;
				*refTurnoJug = false;
			}else
			{
				writeln("Esa casilla ya está ocupada");
			}
		}else
		{
			writeln("El numero ingresado está por fuera de las casillas del tablero");
		}
	}else
	{
		writeln("Vuelva a ingresar su opción");
	}
}

void turnoComputador(char[9]* refTab, char* refJug, char* refCom, bool* refTurnoCom)
{
	auto numRand = uniform(1, 10);//1..9
	if ((*refTab)[numRand - 1] != *refJug && (*refTab)[numRand - 1] != *refCom)
	{
		(*refTab)[numRand - 1] = *refCom;
		*refTurnoCom = false;
		writefln("Computador elige: %d", numRand);
	}
}

string verificarVictoria(char[9]* refTab, char* refJug, char* refCom, bool* refVictoria)
{
	string salida = "Error";
	int noEspacio = 0;

	// - Verificación de victoria del Jugador/Computador o Empate - //
	if ((*refTab)[0] == *refJug && (*refTab)[1] == *refJug && (*refTab)[2] == *refJug || //Primera Linea
		(*refTab)[3] == *refJug && (*refTab)[4] == *refJug && (*refTab)[5] == *refJug || //Segunda Linea
		(*refTab)[6] == *refJug && (*refTab)[7] == *refJug && (*refTab)[8] == *refJug || //Tercera Linea
		(*refTab)[0] == *refJug && (*refTab)[4] == *refJug && (*refTab)[8] == *refJug || //Diagonal Derecha
		(*refTab)[2] == *refJug && (*refTab)[4] == *refJug && (*refTab)[6] == *refJug || //Diagonal Izquierda
		(*refTab)[0] == *refJug && (*refTab)[3] == *refJug && (*refTab)[6] == *refJug || //Primera Columna
		(*refTab)[1] == *refJug && (*refTab)[4] == *refJug && (*refTab)[7] == *refJug || //Segunda Columna
		(*refTab)[2] == *refJug && (*refTab)[5] == *refJug && (*refTab)[8] == *refJug )  //Tercera Columna
	{
		salida = "¡VICTORIA DEL JUGADOR, FELICIDADES!";
		*refVictoria = true;
	}else if ((*refTab)[0] == *refCom && (*refTab)[1] == *refCom && (*refTab)[2] == *refCom || //Primera Linea
			  (*refTab)[3] == *refCom && (*refTab)[4] == *refCom && (*refTab)[5] == *refCom || //Segunda Linea
			  (*refTab)[6] == *refCom && (*refTab)[7] == *refCom && (*refTab)[8] == *refCom || //Tercera Linea
			  (*refTab)[0] == *refCom && (*refTab)[4] == *refCom && (*refTab)[8] == *refCom || //Diagonal Derecha
			  (*refTab)[2] == *refCom && (*refTab)[4] == *refCom && (*refTab)[6] == *refCom || //Diagonal Izquierda
			  (*refTab)[0] == *refCom && (*refTab)[3] == *refCom && (*refTab)[6] == *refCom || //Primera Columna
			  (*refTab)[1] == *refCom && (*refTab)[4] == *refCom && (*refTab)[7] == *refCom || //Segunda Columna
			  (*refTab)[2] == *refCom && (*refTab)[5] == *refCom && (*refTab)[8] == *refCom )  //Tercera Columna
	{
		salida = "¡VICTORIA DEL COMPUTADOR, MEJOR SUERTE PARA LA PROXIMA!";
		*refVictoria = true;
	}else
	{
		foreach(caracter; *refTab)
		{
			if (caracter != ' ')
			{
				noEspacio++;
			}
		}
		if (noEspacio == 9)
		{
			salida = "¡EMPATE!";
			*refVictoria = true;
		}
	}
	noEspacio = 0;
	return salida;
}

void main()
{
	char jugador = 'O';
	char computador = 'X';
	char[9] tablero = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '];
	bool esVictoria = false;
	string ganador;
	bool esTurnoJugador = false;
	bool esTurnoComputador = false;

	writeln("___Ta-Te-Ti___");
	while (esVictoria == false)
	{
		msj(&tablero);
		esTurnoJugador = true;
		while (esTurnoJugador == true)
		{
			turnoJugador(&tablero, &jugador, &computador, &esTurnoJugador);
		}
		ganador = verificarVictoria(&tablero, &jugador, &computador, &esVictoria);
		esTurnoComputador = true;
		while (esTurnoComputador == true)
		{
			turnoComputador(&tablero, &jugador, &computador, &esTurnoComputador);
		}
		ganador = verificarVictoria(&tablero, &jugador, &computador, &esVictoria);
	}
	msj(&tablero);
	writeln(ganador);
}
