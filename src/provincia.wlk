import excepciones.*

class Provincia {

	var property campos = #{}

	// Devuelve los dueños de los campos de la provincia (sin repetidos)
	method duenios() {
		return self.dueniosDeCampos().asSet()
	}

	// Devuelve los dueños de los campos de la provincia (repetidos)
	method dueniosDeCampos() {
		return campos.map{ campo => campo.duenio() }
	}

	// Validar la construcción de una estancia en el campo recibido
	method validarConstruccionEstancia(campo) {
		self.validarMonopolio()
		self.validarConstruccionPareja(campo)
	}

	method validarMonopolio() {
		if (self.duenios().size() > 1) {
			throw monopolioException
		}
	}

	method validarConstruccionPareja(campo) {
		if (!self.esConstruccionPareja(campo)) {
			throw construccionParejaException
		}
	}

	method esConstruccionPareja(campo) {
		return campos.all{ otroCampo => otroCampo.cantidadEstancias() >= campo.cantidadEstancias() }
	}


}

