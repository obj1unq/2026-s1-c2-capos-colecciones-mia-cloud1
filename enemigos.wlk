import capos.*
import artefactos.*
import moradas.*

object caterina {
    const morada = fortalezaDeAcero
    method poderDePelea() { return 28 }
    method morada() = morada 
}

object archibaldo {
    const morada = palacioDeMarmol
    method poderDePelea() { return 16}
    method morada() = morada 
}

object astra {
    const morada = torreDeMarfil
    method poderDePelea() {
        return 14
    }

    method morada() {
        return morada
    }
}