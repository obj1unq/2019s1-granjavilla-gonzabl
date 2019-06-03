import wollok.game.*
import plantas.*

object hector {
	var monedero
	var property indice = 0
	var property position = game.origin()
	var cosechas = []
	
	method image()= "player.png" 
	
	method movimiento(newMov){
		self.position(newMov)
	}
	
	method sembrar(planta){
		const objetos = game.colliders(self)
		
		if (objetos.isEmpty()){
			game.addVisualIn(planta,self.position())
		}
		
	}
	
	method regar(){ 
		const objetos = game.colliders(self)
		if (objetos.isEmpty()){
			throw new Exception ("No tengo nada para regar")
		}
		self.regarMaiz(objetos.head())
		self.regarTrigo(objetos.head())
		self.regarTomaco(objetos.head())	
	}

	
	method regarMaiz(planta) {
		const maizBebe= new MaizBebe()
		const maiz = new MaizAdulto()
		if(maizBebe.image() == planta.image() ){
			game.addVisualIn(maiz,self.position())
			game.removeVisual(planta)
		}
	}
	
	// Buscar la forma de utilizarlo de nuevo para poder evitar la anidacion de metodos
	//method cambioDeIndice() = if (indice < 3){indice = indice + 1}  else indice = 0
	method regarTrigo(planta) {
		const trigo0= new Trigo0()
		const trigo1= new Trigo1()
		
		// METODO CON LISTAS, REVISAR PARA HACERLO FUNCIONAR
		
		//const trigo2= new Trigo2()
		//const trigo3= new Trigo3()
		//var etapaActual =["wheat_0.png","wheat_1.png","wheat_2.png","wheat_3.png"]		
		//const losTrigos = [trigo0,trigo1,trigo2,trigo3]
		/* 
		if(losTrigos.get(indice).image() == planta.image() ){
		//if(etapaActual.get(indice) == planta.image() ){	
			self.cambioDeIndice()
			game.addVisualIn(losTrigos.get(indice),self.position())
			game.removeVisual(planta)
		}
		*/
		if(trigo0.image() == planta.image()){
			game.addVisualIn(trigo1,self.position())
			game.removeVisual(planta)
		}else{
			self.trigo1(planta)
		}
	}
	
	method trigo1(planta){
		const trigo1= new Trigo1()
		const trigo2= new Trigo2()
		if(trigo1.image() == planta.image()){
			game.addVisualIn(trigo2,self.position())
			game.removeVisual(planta)
		}else{
			self.trigo2(planta)
		}
	}
	
	method trigo2(planta){
		const trigo2= new Trigo2()
		const trigo3= new Trigo3()
		if(trigo2.image() == planta.image()){
			game.addVisualIn(trigo3,self.position())
			game.removeVisual(planta)
		}else{
			self.trigo3(planta)
		}
	}
	
	method trigo3(planta){
		const trigo3= new Trigo3()
		const trigo0= new Trigo0()
		if(trigo3.image() == planta.image()){
			game.addVisualIn(trigo0,self.position())
			game.removeVisual(planta)
		}else{}
	}
		
	method regarTomaco(planta){
		const tomaco = new Tomaco()
		if(tomaco.image() == planta.image()){
			self.cambiarPosicion(tomaco,planta)
		}
	}
	
	method cambiarPosicion(tomaco,planta) {
		var limites = []
		var ancho = game.width()
		var largo = game.height()
		
		(0 .. ancho).forEach{ n => limites.add(new Position(n, largo)) }
		if (limites.contains(self.position().up(1)) ){
			game.addVisualIn(tomaco,self.position().down(largo-1))
			game.removeVisual(planta)
			
		}else{
			game.addVisualIn(tomaco,self.position().up(1))
			game.removeVisual(planta)
		}
	}
	
	method cosechar(){ 
		const trigo2 = new Trigo2()
		const trigo3 = new Trigo3()
		const maiz = new MaizAdulto()
		const tomaco = new Tomaco()
		
		const objetos = game.colliders(self)
		if (objetos.isEmpty()){
			throw new Exception ("No tengo nada para cosechar")
		}else{
			if(objetos.head().image() == trigo2.image() || objetos.head().image() == trigo3.image() || objetos.head().image() == maiz.image() || objetos.head().image() == tomaco.image()){
			cosechas.add(objetos.head())
			game.removeVisual(objetos.head())
			}else{
				throw new Exception ("No tengo nada para cosechar")
			}
		}	
	}
	
	
	
}
