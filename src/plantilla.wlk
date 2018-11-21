import uocra.*
import obra.*

class Plantilla{
	
	var property plantilla = []
	var property obraAEjecutar = null
	var property registro = []
	
	method agregarTrabajador(obrero) { plantilla.add(obrero)
						self.pasarObraAlTrabajador()
						obraAEjecutar.obrerosQueTrabajaron(plantilla)
	}
	
	method pasarPlanilla() = obraAEjecutar.obrerosQueTrabajaron(plantilla)
	
	method pasarObraAlTrabajador() = plantilla.forEach{elem => elem.agregarObra(obraAEjecutar)}
		
	method quitarTrabajador(obrero) {
		if(obrero.deLicencia()){
			self.error("Las leyes laborales están para respetarse - licencia implica estabilidad laboral")
		}
			plantilla.remove(obrero)
	}
	
	method obrerosDisponibles() = plantilla.filter{elem => not elem.deLicencia() }
	
	method hacerTrabajo() {
		if(self.obrerosDisponibles().isEmpty()){
			self.error("No hay obreros disponibles para trabajar")
		}
		self.obrerosDisponibles().forEach{elem => elem.consumo(obraAEjecutar)}	
	}
	
	method estaElObrero(obrero) = plantilla.contains(obrero)  
	
	method obraTerminada() = obraAEjecutar.terminado()
	
	method pagarleATodos() = plantilla.forEach{elem => elem.pagarAObrero(obraAEjecutar)}
	
}


class Trabajador {
	
	var property deLicencia = null
	var property obrasEjecutadas = []
	var property efectivo = 0
	var property jornadasAdeudadas = 0
	
	method pasoPor(obra) = obrasEjecutadas.contains(obra)
	
	method agregarObra(obra) = obrasEjecutadas.add(obra)
	
	method cambiarLicencia(bool) { deLicencia = bool }
		
}


class Albaniles inherits Trabajador {
	
	const usoDeLadrillos = 100
	const metrosHechosPorDia = 3
	
	method consumo(obra) { obra.modificarLadrillos(usoDeLadrillos) 
						   obra.hechoHastaAhoraConstruido(self.hechoEnElDia(obra))
						   jornadasAdeudadas += 1
	}
																		
	method hechoEnElDia(obra) = obra.metrosCuadradosConstruidos() + metrosHechosPorDia
	
	method cuantoHayQuePagarle() =  jornadasAdeudadas * uocra.jornalAlbanil()
	
	method pagarAObrero(obra) { efectivo = self.cuantoHayQuePagarle()
								obra.descontarEfectivo(self.cuantoHayQuePagarle())
								jornadasAdeudadas = 0
	}
}

class Plomeros  inherits Trabajador {
	
	const usoDeCanios = 10
	const usoDeArandelas = 30
	const metrosHechosPorDia = 0.5
	
	method consumo(obra) { obra.modificarCanios(usoDeCanios) 
			 			   obra.modificarArandelas(usoDeArandelas)
						   obra.hechoHastaAhoraAgua(self.hechoEnElDia(obra))
						   jornadasAdeudadas += 1
	}

	method hechoEnElDia(obra) = obra.implementosDeGasColocados() + metrosHechosPorDia
	
	method cuantoHayQuePagarle() =  jornadasAdeudadas * uocra.jornalEspecialistaBanioCocina()
	
	method pagarAObrero(obra) { efectivo = self.cuantoHayQuePagarle()
								obra.descontarEfectivo(self.cuantoHayQuePagarle())
								jornadasAdeudadas = 0
	}

}

class Electricistas inherits Trabajador {

	const usoDeCables = 10
	const usoDeCintas = 1
	const metrosHechosPorDia = 4
	
	
	method consumo(obra){ obra.modificarCable(usoDeCables) 
			 			  obra.modificarCinta(usoDeCintas)
						  obra.hechoHastaAhoraElectricidad(self.hechoEnElDia(obra))
						  jornadasAdeudadas += 1
	}
	
	method hechoEnElDia(obra) = obra.cablesElectricosColocados() + metrosHechosPorDia
	
	method cuantoHayQuePagarle() =  jornadasAdeudadas * uocra.jornalElectricista()

	method pagarAObrero(obra) { efectivo = self.cuantoHayQuePagarle()
								obra.descontarEfectivo(self.cuantoHayQuePagarle())
								jornadasAdeudadas = 0
	}	
	
}

class Gasistas inherits Trabajador {
	
	const usoDeCanios = 3
	const usoDeFosforos = 20
	const metrosHechosPorDia = 1
	
	method consumo(obra) { obra.modificarCanios(usoDeCanios ) 
						   obra.modificarFosforos(usoDeFosforos)
						   obra.hechoHastaAhoraGas(self.hechoEnElDia(obra))
						   jornadasAdeudadas += 1
	}
	
	method hechoEnElDia(obra) = obra.implementosDeGasColocados() + metrosHechosPorDia
	
	method cuantoHayQuePagarle() =  jornadasAdeudadas * uocra.jornalEspecialistaBanioCocina()
 
 	method pagarAObrero(obra) { efectivo = self.cuantoHayQuePagarle()
								obra.descontarEfectivo(self.cuantoHayQuePagarle())
								jornadasAdeudadas = 0
	}
 
}


