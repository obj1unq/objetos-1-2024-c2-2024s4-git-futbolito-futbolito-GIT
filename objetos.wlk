/** First Wollok example */
import wollok.game.*

object lionel {
	const property balon = pelota
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
	
	method patear() {
	  self.validarPatear()
	  balon.serPateada()
	}

	method validarPatear() {
	  if ( balon.position() != self.position()){
		 self.error("No hay ninguna pelota aca!")
		 game.say(self,"No hay ninguna pelota aca!")
	  }
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method serPateada() {
	  position = game.at((game.width() - 1).min(position.x() + 3), position.y())
	}
}
