import banco.*

class Propiedad {

	var property duenio = banco
	var precioCompra

	method sosEmpresa()

	method sosSalida() = false

	method rentaPara(jugadorQueCayo)

	method cayo(unJugador) {
		duenio.hacerQuePague(unJugador, self)
	}

	method cambiarDuenio(unJugador) {
		duenio = unJugador
	}

	method paso(_unJugador) {
	}
	
	method hipotecar() {
		banco.pagarA(duenio, precioCompra/2)
		duenio = banco
		precioCompra *= 1.5
	}
	
	method precioCompra() = precioCompra
}

class Empresa inherits Propiedad {

	override method sosEmpresa() = true

	override method rentaPara(jugadorQueCayo) {
		return jugadorQueCayo.tirarDados() * 30000 * duenio.cantidadDeEmpresas()
	}
}

class Campo inherits Propiedad {

	const renta
	const property provincia
	var cantidadEstancias = 0
	const precioConstruccion

	method agregarEstancia() {
		provincia.validarConstruccionEstancia(self)
		if (duenio.puedePagar(precioConstruccion)) {
			cantidadEstancias++
			duenio.pagar(precioConstruccion)
		}
	}

	override method sosEmpresa() = false

	override method rentaPara(jugadorQueCayo) {
		return 2 ** cantidadEstancias * renta
	}

	method cantidadEstancias() {
		return cantidadEstancias
	}

	override method hipotecar() {
		super()
		banco.pagarA(duenio, self.precioEstanciasDeHipoteca())
	}
	
	method precioEstanciasDeHipoteca() = cantidadEstancias*precioConstruccion/2

}

