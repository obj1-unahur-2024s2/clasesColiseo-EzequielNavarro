import equipamento.*
import grupos.*

class Mirmillones{
    var vida = 100
    const property arma
    var property armadura
    var property fuerza 

    method destreza() = 15

    method pelear(unGladiador){
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }
    
    method atacar(unGladiador){
        unGladiador.recibirAtaque( 
            0.max(self.poderDeAtaque() - unGladiador.defensa())
             )
        
    }

    method defensa() = armadura.defensa(self) + self.destreza() 

    method poderDeAtaque() = arma.poderDeAtaque() + fuerza
    
    method recibirAtaque(unValor){
        vida = 0.max(vida - unValor)
    }

    method puedePelear() = vida > 0

    method crearUnGrupo(otroGladiador){
        const nuevoGrupo = new Grupo(
            gladiadores=[self, otroGladiador],
            nombre="mirmillolandia" 
            )
    }
    
}

class Dimachaeurus{
    var vida = 100
    const property armas = []

    var property destreza 

    method pelear(unGladiador){
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }

    method fuerza() = 10

    method atacar(unGladiador){
        unGladiador.recibirAtaque( 0.max(self.poderDeAtaque() - unGladiador.defensa()) )
        destreza += 1
    }

    method defensa() = destreza * 0.5

    method poderDeAtaque() = self.fuerza() + armas.sum({arma => arma.poderDeAtaque()})
    
    method recibirAtaque(unValor){
        vida = 0.max(vida - unValor)
    }

    method puedePelear() = vida > 0

    method crearUnGrupo(otroGladiador){
        const nuevoGrupo = new Grupo(
            gladiadores=[self, otroGladiador],
            nombre="D-" + (self.poderDeAtaque() + otroGladiador.poderDeAtaque())
            )
    }
}