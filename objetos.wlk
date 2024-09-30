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
	
	method taquito() {
	  self.validarTaquito()
	  pelota.serTaqueada()
	}

	method validarTaquito(){
		if(not self.tengoLaPelota()){
			self.error("no tengo la pelota")
		}
	}
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method serTaqueada() {
	  position = game.at(0.max(position.x() - 2), position.y())
	}	
}
