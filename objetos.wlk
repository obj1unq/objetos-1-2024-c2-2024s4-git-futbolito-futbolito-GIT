import wollok.game.*

object lionel {

	var property position = game.at(3,5)

	var property balon = pelota

	var property camisetaPuesta = self.titular()
	

	
	method image() {
		return camisetaPuesta +".png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}


	method validarPatear() {
		if(not self.tengoLaPelota()){
			self.error("Lionel no esta lo suficientemente cerca de la pelota")
		}
	}
	

	method patear() {
		self.validarPatear()
		balon.serPateada()
	}
}

	method camiseta(){
		self.validarCamiseta()
		camisetaPuesta = self.suplente()
		
	}

	method validarCamiseta(){
		if(not self.estaEnInicio()){
			self.error("Debo Estar en el inicio de la cancha")
		}
	}

	method estaEnInicio(){
		const posicionx = position.x()
		const posiciony = position.y()
		
		return position == game.at(0,5)
	}

	method titular(){

		return "lionel-titular"
	}

	method suplente(){

		return "lionel-suplente"
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

	method tengoLaPelota() {
	  return position == pelota.position()
	}
}

object pelota {
	const property image="pelota.png"


	method serPateada() {
		position = game.at((game.width() - 1).min(position.x() + 3), position.y())
	}

	var property position = game.at(5,5)

	method serTaqueada() {
	  position = game.at(0.max(position.x() - 2), position.y())
	}	

}
