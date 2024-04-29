import entidad.*

object banco inherits Entidad (dinero = 500000000, propiedades = #{}) {

	override method hacerQuePague(unJugador, unCasillero) {
		unJugador.comprar(unCasillero, self)
		propiedades.remove(unCasillero)
	}

	method agregarPropiedades(unasPropiedades) {
		propiedades = unasPropiedades
	}
	
	override method pagarA(alguien, monto) {
		alguien.cobrar(monto)
		self.pagar(monto)
	}
	
	override method esJugadorRival(unJugador) = false
	override method sosBanco() = true
}

