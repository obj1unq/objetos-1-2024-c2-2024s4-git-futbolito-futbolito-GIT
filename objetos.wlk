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
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}
