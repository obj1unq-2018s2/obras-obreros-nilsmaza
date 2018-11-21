import uocra.*
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

	method modificarLadrillos(numero) { ladrillos -= numero }
	
	method modificarCanios(numero){ metrosDeCanio -= numero }
	
	method modificarCables(numero){ metrosDeCanio -= numero }
	
	method modificarCinta(numero){cinta -= numero }
	
	method modificarFosforos(numero){ fosforos -= numero }
	
	method modificarArandelas(numero){ arandelas -= numero }
	
	method hechoHastaAhoraConstruido(numero){ metrosCuadradosConstruidos = numero }
	
	method hechoHastaAhoraGas(numero){ implementosDeGasColocados = numero}
	
	method hechoHastaAhoraAgua(numero){ implementosDeAguaColocados = numero }
	
	method hechoHastaAhoraElectricidad(numero){ cablesElectricosColocados = numero }
	
	method obrerosQueTrabajaron(obreros) { registroDeObreros = obreros.copy()}
	
	method registro() = registroDeObreros
	
	method habitacionesHechas() = metrosCuadradosConstruidos >= self.habitaciones() * 50
	
	method caniosDeAgua() = implementosDeAguaColocados >= self.banios() * 10
	
	method  gasColocados() = implementosDeGasColocados >= self.banios() * 8 + self.habitaciones() * 3
		// + (3 * self.habitaciones()) / 8 +(3 * self.habitaciones()) <= self.banios() +self.habitaciones()
	method cablesColocados() = cablesElectricosColocados >= self.habitaciones() * 50 + 100 * self.pisos()
	
	method terminado() = self.habitacionesHechas() and self.caniosDeAgua() and self.gasColocados() and self.cablesColocados()
	
	method descontarEfectivo(numero) { efectivo -= numero }
	
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

