object rolando {
    var capacidadMaxima = 2
    const artefactos = #{}  // porque no cambia la referencia
    const historialDeArtefactos = []
    var poderBase = 0
 
    method encontrar(artefacto) {
        historialDeArtefactos.add(artefacto)
        if (artefactos.size() < capacidadMaxima)
            artefactos.add(artefacto)
    }
    method capacidadMaxima (_nuevaCapacidad) {
        capacidadMaxima = _nuevaCapacidad
    }
    method capacidadMaxima() {
        return capacidadMaxima
    }
    method artefactos() {
        return artefactos
    }
    method llegarA(hogar) {
        hogar.depositarArtefactos(artefactos)
        artefactos.clear()
    }
    method poseciones(hogar) {
        return self.artefactos().union(hogar.inventario())
    }
    method historialDeArtefactos() {
        return historialDeArtefactos
    }
    method poderBase(_poder) {
        poderBase = _poder
    }
    method poderBase() = poderBase

    method poderDePelea() {
        const poderArtefactos = ({artefacto => artefacto.poderQueAporta(self)})
        return poderBase + poderArtefactos
    }

    method lucharBatalla() {
        poderBase = poderBase + 1
        artefactos.forEach( {artefacto => artefacto.esUtilizado()})
    }
}
object espadaDelDestino {
    var fueUsada = false 
    method poderQueAporta(personaje) {
        if ( fueUsada ) {
            return personaje.poderBase() / 2
        } else {
            return personaje.poderBase()
        }
    }

    method esUtilizado() {
       fueUsada = true
    }
}


object libroDeHechizos {
    const hechizos = #{}

    
}


object collarDivino {
    var cantidadDeUsos = 0
    method poderQueAporta(personaje) {
        if(personaje.poderBase() > 6) {
            return 3 + cantidadDeUsos
        } else {
            return 3
        }
    }
    method esUtilizado() {
       cantidadDeUsos = cantidadDeUsos + 1 
    }
}


object armaduraDeAcero {
    method poderQueAporta(personaje) {
        return 6
    }
    method esUtilizado() {
    }
}

object castillo {
    const inventario = #{}

    method depositarArtefactos(artefactos) {
        inventario.addAll(artefactos)

    }
    method inventario() {
        return inventario 
    }
}