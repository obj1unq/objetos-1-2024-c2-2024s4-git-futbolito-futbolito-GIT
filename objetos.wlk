/** First Wollok example */
import wollok.game.*

object lionel {

	var laQueTienePuesta = titular
	
	var property position = game.at(3,5)
	
	method image() {
		return laQueTienePuesta.camiseta()
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method cambiarCamiseta() {
	  self.validarPosicionDeCambio()
	  laQueTienePuesta = laQueTienePuesta.cambiar()
	}	

	method validarPosicionDeCambio() {
	  if (not self.estaEnEnPosicionDeCambio()){
		self.error("No puedo cambiarme, no estoy donde debería estar.")
	  }
	}

	method estaEnEnPosicionDeCambio() {
	  return self.position().x() == 0
	}
}

object suplente {
  method camiseta() {
	return "lionel-suplente.png"
  }

  method cambiar() {
	return titular
  }
}

object titular {
  method camiseta() {
	return "lionel-titular.png"
  }
  method cambiar() {
	return suplente
  }
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}
