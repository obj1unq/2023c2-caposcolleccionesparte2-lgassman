import artefactos.*
import castillo.*

object rolando {
	
	const property artefactos = #{}
	var property capacidad = 2
	var property hogar = castilloDePiedra
	const property historialDeArtefactosEncontrados = []
	var property poderBase = 5
	
	method recolectar(artefacto) {
		artefactos.add(artefacto)
	}
	
	method encontrar(artefacto) {
		if (self.puedeAgregarArtefacto()) {
			self.recolectar(artefacto)
		}
		historialDeArtefactosEncontrados.add(artefacto)
	}

	method puedeAgregarArtefacto() = artefactos.size() < capacidad

	method irAlHogar() {
		self.guardarArtefactosEnElHogar()
		self.liberarEspacio()
	}
	
	method guardarArtefactosEnElHogar() {
		hogar.guardarArtefactos(self)
	}
	
	method liberarEspacio() {
		artefactos.clear()
	}

	method posesiones() {
		return artefactos + self.artefactosDelhogar()
	}
	
	method artefactosDelhogar() = hogar.artefactos()

	method posee(artefacto) = self.posesiones().contains(artefacto)
	
	
	method poder() {
		return self.poderBase() + self.poderPorArtefactos()
	}
	
	method poderPorArtefactos() {
		return artefactos.sum({artefacto => artefacto.poder(self) })
	}
	
	method batalla() {
		poderBase = poderBase + 1
		artefactos.forEach({artefacto => artefacto.batalla() })
	}
	
	method poderDeInvocacion() {
		return hogar.poderMejorArtefacto(self)	
	}
	
	method enemigosVencibles(tierra) {
		return tierra.vencibles(self)
	}
	
	method moradasConquistables(tierra) {
		const vencibles = self.enemigosVencibles(tierra)
		return vencibles.map({habitante => habitante.hogar()}).asSet()	
	}
	
	method leGana(enemigo) {
		return enemigo.poder() < self.poder()
	}
	
	method tieneArmaFatal(enemigo) {
		return artefactos.any({artefacto => artefacto.poder(self) > enemigo.poder()})
	}

	method armaFatal(enemigo) {
		return artefactos.find({artefacto => artefacto.poder(self) > enemigo.poder()})
	}
}



