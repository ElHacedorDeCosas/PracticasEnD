import std.stdio, std.conv, std.string, std.exception, std.random;

const bool DEBUG_MODE = false;

void msj(char[9] *ref_tab, char *ref_jug, char *ref_com) {
	writefln("  %s  |  %s  |  %s  ", (*ref_tab)[0], (*ref_tab)[1], (*ref_tab)[2]);
	writefln("-----|-----|-----");
	writefln("  %s  |  %s  |  %s  ", (*ref_tab)[3], (*ref_tab)[4], (*ref_tab)[5]);
	writefln("-----|-----|-----");
	writefln("  %s  |  %s  |  %s  ", (*ref_tab)[6], (*ref_tab)[7], (*ref_tab)[8]);
}

void turno_jugador(char[9] *ref_tab, char *ref_jug, char *ref_com, bool *ref_turno_jug){

	writeln("Por favor ingrese la pocición en la que quiere colocar su ficha (1-9)");
	auto entrada_txt = readln();

	try {
		int entrada_int = to!int(chomp(entrada_txt));
		if ((entrada_int -1) >= 0 && (entrada_int -1) < 9) {
			if ((*ref_tab)[entrada_int -1] != *ref_jug && (*ref_tab)[entrada_int -1] != *ref_com) {
				(*ref_tab)[entrada_int -1] = *ref_jug;
				*ref_turno_jug = false;
			}else {
				writeln("Esa casilla ya está ocupada");
			}
		}else {
				writeln("El numero ingresado está por fuera de las casillas del tablero");
		}
	}catch (Exception err){
		if (DEBUG_MODE == true){
			writeln("Error al leer la entrada: ", err);
		}
		writeln("Vuelva a ingresar su opción");
	}
}

void turno_computador(char[9] *ref_tab, char *ref_jug, char *ref_com, bool *ref_turno_com){

	auto num_rand = uniform(1, 10);
	if ((*ref_tab)[num_rand - 1] != *ref_jug && (*ref_tab)[num_rand - 1] != *ref_com) {
		(*ref_tab)[num_rand - 1] = *ref_com;
		*ref_turno_com = false;
		writefln("Computador elige: %d", num_rand);
	}
}

void es_victoria(char[9] *ref_tab, char *ref_jug, char *ref_com, bool *ref_victoria){

}

void main(){

	char jugador = 'O';
	char computador = 'X';
	char[9] tablero = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '];
	bool es_victoria = false;
	bool es_turno_jugador = false;
	bool es_turno_computador = false;

	while (es_victoria == false) {
		msj(&tablero, &jugador, &computador);
		es_turno_jugador = true;
		while (es_turno_jugador == true) {
			turno_jugador(&tablero, &jugador, &computador, &es_turno_jugador);
		}
		es_turno_computador = true;
		while (es_turno_computador == true) {
			turno_computador(&tablero, &jugador, &computador, &es_turno_computador);
		}
	}
}
