object castilloDePiedra {
	var property artefactos = #{}
	
	
	method guardarArtefactos(personaje) {
		artefactos.addAll(personaje.artefactos())
	}
	
	method poderMejorArtefacto(personaje) {
//		if (artefactos.isEmpty()) {
//			return 0
//		}
//		const artefacto = artefactos.max({artefacto => artefacto.poder(personaje)})
//		return artefacto.poder(personaje)

		const listaDeNumeros = artefactos.map({artefacto => artefacto.poder(personaje)})
		return listaDeNumeros.maxIfEmpty({0})
	}
}
