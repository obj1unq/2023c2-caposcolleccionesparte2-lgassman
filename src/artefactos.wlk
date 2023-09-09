 
object espada {
	
	var nueva = true
	
	method coeficiente() = if(nueva) 1 else 0.5
	
	
	method poder(personaje) {
		return personaje.poderBase() * self.coeficiente() 
	} 
	
	method batalla() { nueva = false }

	
}

object collar {
	
	const poderBase = 3
	var cantidadUsos = 0
	
	method poder(personaje) {
		return poderBase + self.poderExtra(personaje) 
	}
	
	method poderExtra(personaje) {
		return if (personaje.poderBase() > 6) cantidadUsos else 0
	}
	
	method batalla() {
		cantidadUsos = cantidadUsos + 1
	}	
	
}

object armadura {
	
	method poder(personaje) = 6
	method batalla() {}	
	
}


object libro {
	
	var property hechizos = []
	
	method agregar(hechizo) {
		hechizos.add(hechizo)
	}	
	
	method poder(personaje) {
		return if (hechizos.isEmpty()) 0 
			   else hechizos.first().poder(personaje)
	}
	
	method batalla() {
		if (not hechizos.isEmpty()) {
			hechizos.remove(hechizos.first())
		}
	}	
}

object bendicion {
	method poder(personaje) = 4
} 

object invisibilidad {
	method poder(personaje) = personaje.poderBase()
}

object invocacion {
	method poder(personaje) = personaje.poderDeInvocacion()
}

