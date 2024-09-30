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
	
	method patearPelota() {
	  self.validarPosicionDePelota()
	  pelota.patear()
	}

	method validarPosicionDePelota() {
	  if (not self.estaEnLaPosicionDeLaPelota()){
		self.error("No estas sobre la pelota!")
	  }
	}

	method estaEnLaPosicionDeLaPelota() {
	  return pelota.position() == self.position()
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method inicio() {
	  game.at(0,5)
	}

	method patear() {
	  position = game.at((game.width() - 1).min(position.x() + 3), position.y())
	}
}
