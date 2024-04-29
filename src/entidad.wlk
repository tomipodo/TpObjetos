import excepciones.dineroSuficienteException

class Entidad {

	var propiedades
	var property dinero

	method pagar(monto) {
		dinero -= monto
	}

	method cobrar(monto) {
		dinero += monto
	}

	method cantidadDeEmpresas() {
		return propiedades.count{ propiedad => propiedad.sosEmpresa() }
	}

	method puedePagar(monto) {
		return dinero >= monto
	}

	method pagarA(alguien, monto)

	method hacerQuePague(unJugador, unCasillero)

	method esJugadorRival(unJugador) = unJugador != self

	method sosBanco()

	method propiedades() = propiedades

}

