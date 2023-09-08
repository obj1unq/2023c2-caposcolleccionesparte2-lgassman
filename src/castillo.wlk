object castilloDePiedra {
	const property artefactos = #{}
	
	method guardarArtefactos(personaje) {
		artefactos.addAll(personaje.artefactos())
	}
}
