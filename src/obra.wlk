import plantilla.*

class Obra {
	var property ladrillos = 0
	var property metrosDeCanio = 0
	var property metrosDeCable = 0
	var property cinta = 0
	var property fosforos = 0
	var property arandelas = 0
	var property efectivo = 0
	var property metrosCuadradosConstruidos = 0
	var property implementosDeAguaColocados = 0
	var property implementosDeGasColocados = 0
	var property cablesElectricosColocados = 0
	
	var property registroDeObreros = []
	
	method habitaciones()	
	method pisos()
	method banios() 

	method modificarLadrillos(numero) {return ladrillos -= numero }
	
	method modificarCanios(numero){return metrosDeCanio -= numero }
	
	method modificarCables(numero){return metrosDeCanio -= numero }
	
	method modificarCinta(numero){return cinta -= numero }
	
	method modificarFosforos(numero){return fosforos -= numero }
	
	method modificarArandelas(numero){return arandelas -= numero }
	
	method hechoHastaAhoraConstruido(numero){ return metrosCuadradosConstruidos = numero }
	
	method hechoHastaAhoraGas(numero){return implementosDeGasColocados = numero}
	
	method hechoHastaAhoraAgua(numero){return implementosDeAguaColocados = numero }
	
	method hechoHastaAhoraElectricidad(numero){return cablesElectricosColocados = numero }
	
	method obrerosQueTrabajaron(obreros) {return registroDeObreros = obreros.copy()}
	
	method registro() = registroDeObreros
}


class Casa inherits Obra {
	var property habitaciones = 3
	var property banios = 1
	
	override method habitaciones() = habitaciones
	override method banios() = banios
	
	override method pisos() = 1
}

class Edificio inherits Obra {
	var property pisos = 4
	override method pisos() = pisos
}

