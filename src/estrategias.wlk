import banco.*
import tablero.*

object standard {

	method caerPara(unCasillero, unJugador) {
		unCasillero.cayo(unJugador)
	}

}

object garca {

	method caerPara(unCasillero, unJugador) {
		if (unCasillero.sosEmpresa()) {
			if (tablero.hayRivalDuenioDeEmpresa(unJugador)) {
				unCasillero.cayo(unJugador)
			}
		} else {
			if (tablero.algunDuenioRivalDeProvincia(unCasillero, unJugador)) {
				unCasillero.cayo(unJugador)
			}
		}
	}

}

object imperialista {

	method caerPara(unCasillero, unJugador) {
		if (unCasillero.sosEmpresa()) {
			if (tablero.ningunaEmpresaConDuenio()) {
				unCasillero.cayo(unJugador)
			}
		} else {
			if (not tablero.algunDuenioRivalDeProvincia(unCasillero, unJugador)) {
				unCasillero.cayo(unJugador)
			}
		}
	}

}

