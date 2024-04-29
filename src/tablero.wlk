object tablero {

	const property casilleros = []

	method casillerosDesdeHasta(unCasillero, unNumero) {
		return self.casillerosDesde(casilleros.copy(), unCasillero).take(unNumero)
	}

	method casillerosDesde(unosCasilleros, unCasillero) {
		const primero = unosCasilleros.first()
		unosCasilleros.remove(primero) // Remueve el primero
		unosCasilleros.add(primero) // Lo agrega al final
		return if (primero == unCasillero) unosCasilleros else self.casillerosDesde(unosCasilleros, unCasillero)
	}

	method agregarCasilleros(unosCasilleros) {
		casilleros.addAll(unosCasilleros)
	}
	
	method hayRivalDuenioDeEmpresa(unJugador) = self.empresas().any{ empresa => empresa.duenio().esJugadorRival(unJugador) }
	
	method empresas() = casilleros.filter{ casillero => casillero.sosEmpresa() }
	
	method algunDuenioRivalDeProvincia(unCasillero, unJugador) {
		const dueniosDeProvincia = unCasillero.provincia().duenios()
		return dueniosDeProvincia.any{ duenio => duenio.esJugadorRival(unJugador) }
	}
	
	method ningunaEmpresaConDuenio() = self.empresas().alll{ empresa => empresa.duenio().sosBanco() }
	
}

