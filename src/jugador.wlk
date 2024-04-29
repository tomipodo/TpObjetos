import entidad.*
import casillerosEspeciales.*
import banco.*
import excepciones.*

class Jugador inherits Entidad(propiedades = #{}) {

	var tiroAnteriorFueDoble = false
	var casilleroActual = salida
	var cantidadDeTurnosPrision = -1
	var estrategia

	method tirarDados() {
		const dado1 = self.tirarDado()
		const dado2 = self.tirarDado()
		return self.validarTiradaDoble(dado1, dado2)
	}

	method tirarDado() = 0.randomUpTo(6).roundUp()

	method validarTiradaDoble(unDado, otroDado) {
		if (self.esDoble(unDado, otroDado)) {
			if (tiroAnteriorFueDoble) {
				self.irAPrision()
			} else {
				tiroAnteriorFueDoble = true
				return unDado + otroDado
			}
		}
		tiroAnteriorFueDoble = false
		return unDado + otroDado
	}

	method esDoble(unDado, otroDado) {
		return unDado == otroDado
	}

	override method hacerQuePague(unJugador, unCasillero) {
		unJugador.pagarA(self, unCasillero.rentaPara(unJugador))
	// Cuando el jugador cae en su propiedad se paga a si mismo
	}

	method moverse(unosCasilleros) {
		self.pasarPor(unosCasilleros)
		casilleroActual = unosCasilleros.last()
		self.caer(casilleroActual)
	}

	method pasarPor(unosCasilleros) {
		unosCasilleros.forEach{ unCasillero => unCasillero.paso(self)}
	}

	method caer(unCasillero) {
		const duenio = unCasillero.duenio()
		if (duenio.sosBanco()) {
			estrategia.caerPara(unCasillero, self)
		} else {
			unCasillero.cayo(self)
		}
	}

	method irAPrision() {
		cantidadDeTurnosPrision = 0
		casilleroActual = prision
	}

	method estaPreso() = cantidadDeTurnosPrision >= 0 && cantidadDeTurnosPrision < 3

	method salirDePrision() {
		cantidadDeTurnosPrision = -1
	}

	method pasarUnTurnoEnPrision() {
		cantidadDeTurnosPrision++
	}

	override method esJugadorRival(unJugador) = unJugador != self

	override method pagarA(alguien, monto) {
		self.hipotecarHastaPagar(monto)
		alguien.cobrar(monto)
		self.pagar(monto)
	}

	method comprar(unCasillero, unVendedor) {
		const monto = unCasillero.precioCompra()
		self.validarMonto(monto)
		self.pagarA(unVendedor, monto)
		propiedades.add(unCasillero)
		unCasillero.cambiarDuenio(self)
	}

	method hipotecarHastaPagar(monto) {
		if (!self.puedePagar(monto)) {
			self.hipotecarPropiedad()
			self.hipotecarHastaPagar(monto)
		}
	}

	method hipotecarPropiedad() {
		if (propiedades.size() == 0) {
			throw hipotecaException
		}
		propiedades.anyOne().hipotecar()
	}

	method validarMonto(monto) {
		if (!self.puedePagar(monto)) {
			throw dineroSuficienteException
		}
	}

	method casilleroActual() = casilleroActual

	override method sosBanco() = false

}

