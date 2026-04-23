import capos.*
import artefactos.*
import enemigos.*

object castillo {
    const inventario = #{}

    method depositarArtefactos(artefactos) {
        inventario.addAll(artefactos)

    }
    method inventario() {
        return inventario 
    }

    method hayArtefactosEnLaMorada() {
        return not inventario.isEmpty()
    }
    method artefactoMasPoderoso(personaje) {
        return inventario.max({artefacto => artefacto.poderQueAporta(personaje)})
    }
}
object fortalezaDeAcero {}
object palacioDeMarmol {}

object torreDeMarfil {

}

