import wollok.game.*

object lionel {
	var laQueTienePuesta = titular
	var property position = game.at(3, 5)
	
	method image() = laQueTienePuesta.camiseta()
	
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
		if (not self.estaEnEnPosicionDeCambio()) self.error(
				"No puedo cambiarme, no estoy donde debería estar."
			)
	}
	
	method estaEnEnPosicionDeCambio() = self.position().x() == 0
	
	method patearPelota() {
		self.validarPosicionDePelota()
		pelota.patear()
	}
	
	method validarPosicionDePelota() {
		if (not self.estaEnLaPosicionDeLaPelota()) self.error(
				"No estas sobre la pelota!"
			)
	}
	
	method estaEnLaPosicionDeLaPelota() = pelota.position() == self.position()
}

object suplente {
	method camiseta() = "lionel-suplente.png"
	
	method cambiar() = titular
}

object titular {
	method camiseta() = "lionel-titular.png"
	
	method cambiar() = suplente
}

object pelota {
	const property image = "pelota.png"
	var property position = game.at(5, 5)
	
	method inicio() {
		game.at(0, 5)
	}
	
	method patear() {
		position = game.at((game.width() - 1).min(position.x() + 3), position.y())
	}
}