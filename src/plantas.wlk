import wollok.game.*
import hector.*


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

class Trigo0 inherits Planta{
	method image()= "wheat_0.png"
	
	//method image(x)= "wheat_"+ x + ".png"	
}

class Trigo1 inherits Planta{
	method image()= "wheat_1.png"
		
}
class Trigo2 inherits Planta{
	method image()= "wheat_2.png"
		
}
class Trigo3 inherits Planta{
	method image()= "wheat_3.png"
		
}



class Tomaco inherits Planta{
	
	method image()= "tomaco.png"
}

