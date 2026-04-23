import artefactos.*
import moradas.*
import enemigos.*

object rolando {
    var capacidadMaxima = 2
    const artefactos = #{}
    const historialDeArtefactos = []
    var poderBase = 0
    const morada = castillo 

    
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
    method llegarA(_morada) {
        _morada.depositarArtefactos(artefactos)
        artefactos.clear()
    }
    method posesiones() {
        return self.artefactos().union(morada.inventario())
    }
    method tieneArtefacto(artefacto) {
        return self.posesiones().contains(artefacto)
    }
    method historialDeArtefactos() {
        return historialDeArtefactos
    }
    method poderBase(_poder) {
        poderBase = _poder
    }
    method poderBase() = poderBase

    method poderDePelea() {
        
        return poderBase + self.poderDeLosArtefactos()
    }

    method poderDeLosArtefactos() {
        return artefactos.sum({artefacto => artefacto.poderQueAporta(self)})
    }
    method lucharBatalla() {
        poderBase = poderBase + 1
        artefactos.forEach( {artefacto => artefacto.utilizar()})
    }

      method artefactoMasPoderosoDeLaMorada() {
        return morada.artefactoMasPoderoso(self)
    }

    method enemigosQuePuedeVencer(enemigos) {
        return enemigos.filter({enemigo => self.poderDePelea() > enemigo.poderDePelea()})
    }
    method conquistarMoradas(enemigos) {
        return self.enemigosQuePuedeVencer(enemigos).map({enemigo => enemigo.morada()})
    }
    method esElMasPoderoso(enemigos) {
        return enemigos.all({ enemigo => self.poderDePelea() > enemigo.poderDePelea() })
    }
    method tieneArtefactoFatalPara(enemigo) {
        return artefactos.any({ artefacto => artefacto.poderQueAporta(self) > enemigo.poderDePelea() })
    }

    method artefactoFatalPara(enemigo) {
        return artefactos.find({ artefacto => artefacto.poderQueAporta(self) > enemigo.poderDePelea() })
    }

    method tieneArtefactosEnSuMorada() {
        return morada.hayArtefactosEnLaMorada()
    }

}

