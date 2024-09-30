/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method inicio() {
		//al apretar la tecla *i* la pelota se debe quedar en el origen borde izquierdo (0,5)
		position = game.at(0, 5)
	}
	
	method buscarla(){
		//al apretar la tecla *b* lionel se mueve a donde está la pelota
		position = pelota.position()
	}
	method taquito() {
		keyboard.t().onPressDo({self.patearTaquito()})
	}
	method patearTaquito() {
		self.validarLionelYPelotaJuntos()
		pelota.retroceder()
	}

	method validarLionelYPelotaJuntos() {
		if (not self.hayColision()) {
			self.error("Lionel no está con la pelota")
		}
	}

	method hayColision() {
      const colisiones = game.colliders(self)
      return not(colisiones.isEmpty())
    }
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method retroceder() {
		position = game.at((position.x() - 2).max(0), position.y())
	}
}
