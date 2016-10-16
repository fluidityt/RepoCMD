import SpriteKit

/// Just a repo.. no actual OOP going on
struct Bullet {

	let	node: SKShapeNode
	
	init(parent_view: SKScene = SKScene()){
		let initial_config = (radius: 0, color: gColor.green, speed: 0)
		
		node = SKShapeNode(circleOfRadius: CGFloat(initial_config.radius))
		node.speed = CGFloat(initial_config.speed)
		node.fillColor = initial_config.color
		parent_view.addChild(node)
	}

	private struct Config {		private static let
		origin = 		CGP(x: (25 - gView!.frame.width), y: (200 - gView!.frame.height)),
		bounds = 		CGPoint(x: (gView!.frame.width - 25), y: (gView!.frame.height - 200))	}
	
	private struct Method {		private static let
		randomSpeed 	=	{ return CGF( 2 ) },
		randomRadius 	= { return CGF(4)	},
		
		randomColor 	=	{ () -> NSColor in
			switch random(1,3) {
			case 1:	return NSColor.blueColor()
			case 2:	return NSColor.greenColor()
			case 3:	return NSColor.redColor()
			default: return ERROR(NSColor.init())}},
		
		randomPosition = { () -> CGPoint in	typealias C = Config
			let ran_x = random(C.origin.x, C.bounds.x) //random(e.offset, e.bounds.x) 							- e.adjusted.width/2
			let ran_y = random(C.origin.y, C.bounds.y)  //- e.adjusted.height

			switch random(1,4) { // side to spawn on 1 top 4 left
			case 1: return CGP(	x: ran_x,				y: C.bounds.y)
			case 3: return CGP( x: ran_x, 			y: C.origin.y)
			case 2: return CGP(	x: C.bounds.x, 	y: ran_y)
			case 4: return CGP( x: C.origin.x,	y: ran_y)
			default: printError("problem in randysidepick"); return CGP(x:0,y:0)}}	}
	
	
	// This may be slower than just passing in the node?
	func spawn(m: Bullet.Type) -> Bool {
		//let m = Bullet.doFunc
		node.speed 			= m.ethod.randomSpeed()
		node.fillColor 	= m.ethod.randomColor()
		node.position		= m.ethod.randomPosition(m.config)
		
		return true
	}
	
}


