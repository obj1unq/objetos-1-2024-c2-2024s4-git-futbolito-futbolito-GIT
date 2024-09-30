/** First Wollok example */
import wollok.game.*

object lionel {

	var property position = game.at(3,5)
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
		
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}
