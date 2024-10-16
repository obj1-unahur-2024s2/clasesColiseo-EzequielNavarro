class ArmaDeFilo{
    const property longitud
    var property filo

    method poderDeAtaque() = longitud * filo


}

class ArmaContundente{
    const property peso

    method poderDeAtaque() = peso

}

object casco{ // No tiene sentido hacer Class,la defensa siempre valdra 10, no hay atributos.
    method defensa(unGladiador) = 10 // Necesita parametro para ser POLIMORFICO con escudo !!!
}
    
object escudo{ // Obj. la defensa() varia pero no tiene atributos, siempre es el mismo escudo.
    method defensa(unGladiador) {
        return 5 + ( unGladiador.destreza() * 0.1 )
    }
}

// EJ del uso polimorfico de casco y escudo.
/*object luchador{
    var property armadura = casco
    method defensa() = armadura.defensa(self)
} */