/** First Wollok example */
import wollok.game.*

object lionel {
	//var balon = pelota //otra opción es que conozca la pelota, en cuyo caso no se pasaría en el buscar nada.
	var property position = game.at(3,5)
	
	//method balon(_balon){ balon = _balon }
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method buscar(pateable){
		self.ir(pateable.position())
	}

	method ir(posicion){
		position = posicion
	}
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}

object configuracion{
	const anchoCancha = 15
	const largoCancha = 10

	method configurarTablero(){
		game.cellSize(40)
		game.width(anchoCancha)
		game.height(largoCancha)
	}

	method configurarVisuales(){
		game.addVisual(lionel)
		game.addVisual(pelota)
	}

	method configurarTeclas(){
		//Ya venian de antes pero se movieron apra prolijidad.
		keyboard.enter().onPressDo({game.say(lionel, "Vamos Argentina!")})
		keyboard.left().onPressDo({lionel.retroceder()})
		keyboard.right().onPressDo({lionel.avanzar()})
		//Agregado con Buscarla
		keyboard.b().onPressDo({ lionel.buscar(pelota) })
	}

}

