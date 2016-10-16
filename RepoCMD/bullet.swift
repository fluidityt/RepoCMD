import SpriteKit

/// Just a repo.. no actual OOP going on
struct Bullet {

	private struct Config {		private static let
		origin = 		CGP(x: (25 - gView!.frame.width), y: (200 - gView!.frame.height)),
		bounds = 		CGPoint(x: (gView!.frame.width - 25), y: (gView!.frame.height - 200)),
		radius =		CGFloat(10),
		speed  = 		NSTimeInterval(1.5)}
	
	private struct Method {											private static let
		randomSpeed 	=	{ return CGF(random(1.5, 2) ) }; 			private static let
		randomRadius 	= { return CGF(random(10, 20) )	}; 				private static let
		
		randomColor 	=	{ () -> NSColor in
			switch random(1,3) {
				case 1:	return NSColor.blueColor()
				case 2:	return NSColor.greenColor()
				case 3:	return NSColor.redColor()
				default: return ERROR(NSColor.init())}} ; private static let
		
		randomPosition = { () -> CGPoint in	typealias C = Config
			let ran_x = random(C.origin.x, C.bounds.x) //random(e.offset, e.bounds.x) 							- e.adjusted.width/2
			let ran_y = random(C.origin.y, C.bounds.y)  //- e.adjusted.height
			switch random(1,4) { // side to spawn on 1 top 4 left
				case 1: return CGP(	x: ran_x,				y: C.bounds.y)
				case 3: return CGP( x: ran_x, 			y: C.origin.y)
				case 2: return CGP(	x: C.bounds.x, 	y: ran_y)
				case 4: return CGP( x: C.origin.x,	y: ran_y)
				default: printError("problem in randysidepick"); return CGP(x:0,y:0)}}	}
	
	let	node: SKShapeNode
	var speed: NSTimeInterval
	
	init() { let n=node
		node = SKShapeNode(circleOfRadius: Config.radius);_=n
			.fillColor = Method.randomColor();_=n
				.position = Method.randomPosition();_=n
		
		speed = Config.speed
	}
	
	func spawn() {
	}
}

	}

	
	
}


