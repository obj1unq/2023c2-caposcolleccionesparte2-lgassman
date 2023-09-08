import artefactos.*
import castillo.*

object rolando {
	
	const property artefactos = #{}
	var property capacidad = 2
	var property castillo = castilloDePiedra
	const property historialDeArtefactosEncontrados = []

	method recolectar(artefacto) {
		if (self.puedeAgregarArtefacto())
			artefactos.add(artefacto)
	}

	method puedeAgregarArtefacto() = artefactos.size() < capacidad

	method irAlCastillo() {
		self.guardarArtefactosEnElCastillo()
		self.liberarEspacio()
	}
	
	method guardarArtefactosEnElCastillo() {
		castillo.guardarArtefactos(self)
	}
	
	method liberarEspacio() {
		artefactos.clear()
	}

	method todosLosArtefactosRecolectados() {
		return artefactos.union(self.artefactosDelCastillo())
	}
	
	method artefactosDelCastillo() = castillo.artefactos()

}