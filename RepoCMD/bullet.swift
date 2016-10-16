import SpriteKit
let _myself_ = Void.self

public extension SKNode {
	public func addToScene(scene: SKScene = gScene!) {
		scene.addChild(self)
	}
}

/// Trying to limit OOP
struct Bullet {

	/* Statics */
	
	private struct Config {		private static let
		origin = 		CGP(x: (25 - gView!.frame.width), y: (200 - gView!.frame.height)),
		bounds = 		CGPoint(x: (gView!.frame.width - 25), y: (gView!.frame.height - 200)),
		radius =		CGFloat(10),
		speed  = 		NSTimeInterval(1.5)}
	
	private struct Method {
		private static func	 randomSpeed()  -> CGF	{ return CGF(random(1, 1.5)) }
		private static func  randomRadius() -> CGF { return CGF(random(10, 20)) }
		
		private static func  randomColor() 	-> NSColor	{
			switch random(1,3) {
				case 1:	return NSColor.blueColor()
				case 2:	return NSColor.greenColor()
				case 3:	return NSColor.redColor()
				default: return ERROR(NSColor.init())}
		}
		
		private static func randomPosition(config C: Config.Type = Config.self)  -> CGP {
			let rand = (x: random(C.origin.x, C.bounds.x),
			            y: random(C.origin.y, C.bounds.y))
			switch random(1,4) {																							// side to spawn on 1 top 4 left
				case 1: return CGP(	x: rand.x,			y: C.bounds.y)
				case 3: return CGP( x: rand.x, 			y: C.origin.y)
				case 2: return CGP(	x: C.bounds.x, 	y: rand.y)
				case 4: return CGP( x: C.origin.x,	y: rand.y)
				default:return CGP( x: 0,						y: error! as! CGF)}}	}   // Will crash
	
	/* Members */
	
	let	node = SKShapeNode(circleOfRadius: Config.radius)
	init() { self.node.addToScene() }
	
	 func spawn(selfDot: Void.Type) {
		
		self.node.fillColor = Method.randomColor();let n=node;_=n
			.position = Method.randomPosition(config: Config.self)
		
		
	
	}
}