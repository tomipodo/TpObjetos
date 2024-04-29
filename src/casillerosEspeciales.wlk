class PremioGanadero {

	method sosSalida() = false

	method cayo(unJugador) {
		unJugador.cobrar(2500)
	}

	method paso(unJugador) {
	}

	method sosEmpresa() = false

}

object salida {

	method sosSalida() = true

	method cayo(unJugador) {
	}

	method paso(unJugador) {
		unJugador.cobrar(5000)
	}

	method sosEmpresa() = false

}

object prision {

	method sosSalida() = false

	method cayo(unJugador) {
	}

	method paso(unJugador) {
	}

	method sosEmpresa() = false

}

