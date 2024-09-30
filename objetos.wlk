import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var property balon = pelota
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method validarPatear() {
		if(not self.tengoPelota()){
			self.error("Lionel no esta lo suficientemente cerca de la pelota")
		}
	}
	
	method tengoPelota() {
		return position == balon.position()
	}

	method patear() {
		self.validarPatear()
		balon.serPateada()
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method serPateada() {
		position = game.at((game.width() - 1).min(position.x() + 3), position.y())
	}
}
