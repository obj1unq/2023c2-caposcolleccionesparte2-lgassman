
object archibaldo {
	const property hogar = palacio
	method poder() = 16
}

object caterina {
	const property hogar = fortaleza
	method poder() = 28
	
}

object astra {
	const property hogar = torre
	method poder() = 14
	
}

object fortaleza {
	
}
object palacio {
	
} 
object torre {
	
}

object erethia {
	const property habitantes = #{archibaldo, caterina, astra}

	method vencibles(capo) {
		return habitantes.filter({habitante => capo.leGana(habitante)})
	}
	
	method poderoso(capo) {
		return habitantes.all({habitante => capo.leGana(habitante)})
	}
}

