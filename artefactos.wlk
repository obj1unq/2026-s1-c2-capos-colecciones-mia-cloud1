import capos.*
import moradas.*
import enemigos.*

object espadaDelDestino {
    var fueUsada = false 
    method poderQueAporta(personaje) {
        if ( fueUsada ) {
            return personaje.poderBase() / 2
        } else {
            return personaje.poderBase()
        }
    }

    method utilizar() {
       fueUsada = true
    }
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
    method utilizar() {
       cantidadDeUsos = cantidadDeUsos + 1 
    }
}


object armaduraDeAcero {
    method poderQueAporta(personaje) {
        return 6
    }
    method utilizar() {
    }
}

object libroDeHechizos {
    const hechizos = []

    method poderQueAporta(personaje) {
        return if(not hechizos.isEmpty()) hechizos.first().poderQueAporta(personaje) else 0
    }

    method utilizar() {
        if(not hechizos.isEmpty()) {
            hechizos.remove(hechizos.first())
        }
    }

    method agregarHechizo(hechizo) {
        hechizos.add(hechizo)
    }

}

object bendicion {
    method poderQueAporta(personaje) {
        return 4
    }
}

object invisibilidad {
    method poderQueAporta(personaje) {
        return personaje.poderBase()
    }
}

object invocacion {

    method poderQueAporta(personaje) {
        if (personaje.tieneArtefactosEnSuMorada()) {
            return personaje.artefactoMasPoderosoDeLaMorada().poderQueAporta(personaje)
        } else {
            return 0
        }
    }
}