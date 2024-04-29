import tablero.tablero

object juego {

	const property jugadores = []
	var property estaTerminado = false

	method empezar() {
		if (not self.estaTerminado()) {
			jugadores.forEach{ jugador => self.queJuegue(jugador)}
		}
	}

	method queJuegue(unJugador) {
		if (unJugador.estaPreso()) {
			self.jugarPreso(unJugador)
		} else {
			self.jugar(unJugador)
		}
	}

	method agregarJugadores(unosJugadores) {
		jugadores.addAll(unosJugadores)
	}

	method jugarPreso(unJugador) {
		const dado1 = unJugador.tirarDado()
		const dado2 = unJugador.tirarDado()
		if (unJugador.esDoble(dado1, dado2)) {
			unJugador.salirDePrision()
		} else {
			unJugador.pasarUnTurnoEnPrision()
		}
	}

	method jugar(unJugador) {
		const tiradaDados = unJugador.tirarDados()
		if (!unJugador.estaPreso()) {
			const casilleros = tablero.casillerosDesdeHasta(unJugador.casilleroActual(), tiradaDados)
			unJugador.moverse(casilleros)
		}
		
	}

}

