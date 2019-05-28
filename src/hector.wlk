import wollok.game.*

object hector {
	var monedero
	
	var property position = game.origin()
	
	method image()= "player.png" 
	
	method movimiento(newMov){
		self.position(newMov)
	}
	
	method sembrar(planta){
		game.addVisualIn(planta,self.position())
	}
	
	method regar(planta){
		//game.addVisualIn(planta,self.position())
	}
	
	method cosechar(planta){
		
	}
	
}



class Planta {
	
	
}

class Maiz inherits Planta{
	
	
}

class MaizBebe inherits Maiz{
	method image()= "corn_baby.png"
}

class MaizAdulto inherits Maiz{
	method image()= "corn_adult.png"
}

class Trigo inherits Planta{
	

}


class TrigoEvol0 inherits Trigo{
	method image()= "wheat_0.png"
}

class Tomaco inherits Planta{
	
	method image()= "tomaco.png"
}

