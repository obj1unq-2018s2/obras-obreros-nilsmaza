import obra.*

class Plantilla{
	
	var property plantilla = []
	var property obraAEjecutar = null
	
	method agregarTrabajador(obrero) { plantilla.add(obrero)
						self.pasarObraAlTrabajador()
						obraAEjecutar.obrerosQueTrabajaron(plantilla)
	}
	
	method pasarPlanilla() = obraAEjecutar.obrerosQueTrabajaron(plantilla)
	
	method pasarObraAlTrabajador() = plantilla.forEach{elem => elem.agregarObra(obraAEjecutar)}
		
	method quitarTrabajador(obrero) = plantilla.remove(obrero)
	
	method hacerTrabajo() = plantilla.forEach{elem => elem.consumo(obraAEjecutar)}
	
	method estaElObrero(obrero) = plantilla.contains(obrero)
	
}


class Trabajador {
	
	var property deLicencia =null
	var property obrasEjecutadas = []
	
	method pasoPor(obra) = obrasEjecutadas.contains(obra)
	
	method agregarObra(obra) = obrasEjecutadas.add(obra)
}

class Albaniles inherits Trabajador {
	
	const usoDeLadrillos = 100
	const metrosHechosPorDia = 3
	
//	method consumido(obra) = obra.modificarLadrillos(self.consumo(obra))
	
	method consumo(obra) {return  if ( deLicencia ) {return obra.ladrillos() - 0 }
				else{ obra.modificarLadrillos(usoDeLadrillos) 
				return obra.hechoHastaAhoraConstruido(self.hechoEnElDia(obra))}
	}
																		
	method hechoEnElDia(obra) = obra.metrosCuadradosConstruidos() + metrosHechosPorDia
	
}

class Plomeros  inherits Trabajador {
	
	const usoDeCanios = 10
	const usoDeArandelas = 30
	const metrosHechosPorDia = 0.5
	
	method consumo(obra) {return if ( deLicencia ){return obra.metrosDeCanio() - 0 }
		else{ obra.modificarCanios(usoDeCanios) 
			 obra.modificarArandelas(usoDeArandelas)
			return obra.hechoHastaAhoraAgua(self.hechoEnElDia(obra))}
	}

	method hechoEnElDia(obra) = obra.implementosDeGasColocados() + metrosHechosPorDia

}

class Electricistas inherits Trabajador {

	const usoDeCables = 10
	const usoDeCintas = 1
	const metrosHechosPorDia = 4
	
	
	method consumo(obra){return if ( deLicencia ){  }
		else{ obra.modificarCable(usoDeCables) 
			 obra.modificarCinta(usoDeCintas)
			return obra.hechoHastaAhoraElectricidad(self.hechoEnElDia(obra))}
	}
	
	method hechoEnElDia(obra) = obra.cablesElectricosColocados() + metrosHechosPorDia
	
}

class Gasistas inherits Trabajador {
	
	const usoDeCanios = 3
	const usoDeFosforos = 20
	const metrosHechosPorDia = 1
	
	method consumo(obra) {return if ( deLicencia ){  
							}else{ obra.modificarCanios(usoDeCanios ) 
								 obra.modificarFosforos(usoDeFosforos)
								 return obra.hechoHastaAhoraGas(self.hechoEnElDia(obra))
							}
	}
	
	method hechoEnElDia(obra) = obra.implementosDeGasColocados() + metrosHechosPorDia
 
}


