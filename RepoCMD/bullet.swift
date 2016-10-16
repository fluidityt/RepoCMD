import SpriteKit
typealias LHS = Void
typealias Yourself = Void
let lhs = Void.self
let myself = Void.self


public extension SKNode {
	public func addToScene(scene: SKScene = gScene!) {
		scene.addChild(self)
	}
}

/// Trying to limit OOP
struct Bullet {
	
	internal enum Difficulty { case easy, normal, hard }
	
	private struct Config {
		private let
		origin 		 = CGP(x: (25 - gView!.frame.width), y: (200 - gView!.frame.height)),
		bounds 		 = CGPoint(x: (gView!.frame.width - 25), y: (gView!.frame.height - 200)),
		radius 		 = CGFloat(10),
		difficulty = Difficulty.hard
	}
	
	private static let config = Config()
	
	let	node = SKShapeNode(circleOfRadius: Config.init().radius)
	init() { self.node.addToScene() }
	
	private static func	 randomDifficulty()  -> CGF	{ return CGF(random(1.25, 1.5)) }
	private static func  randomRadius() -> CGF { return CGF(random(10, 20)) }
	
	private static func  randomColor() 	-> NSColor	{
		switch random(1,3) {
		case 1:	return NSColor.blueColor()
		case 2:	return NSColor.greenColor()
		case 3:	return NSColor.redColor()
		default: return ERROR(NSColor.init())}
	}
	
	private static func randomPosition(config c: Config = config)  -> CGP {
		let rand = (x: random(c.origin.x, c.bounds.x),
		            y: random(c.origin.y, c.bounds.y))
		switch random(1,4) {																							// side to spawn on 1 top 4 left
		case 1: return CGP(	x: rand.x,			y: c.bounds.y)
		case 3: return CGP( x: rand.x, 			y: c.origin.y)
		case 2: return CGP(	x: c.bounds.x, 	y: rand.y)
		case 4: return CGP( x: c.origin.x,	y: rand.y)
		default:return CGP( x: 0,						y: error! as! CGF)						// Will crash
		}
	}

	
	
	private static func setDifficulty(level: Difficulty) -> NSTimeInterval {
		switch level {
			case .easy: 	return 1.5
			case .normal:	return randomSpeed
				
	static func spawn (bullet: Bullet,
	                   wheel: SKSpriteNode,
										 config: Any = Bullet.config
										 difficulty: NSTimeInterval = ) {
		bullet.node.fillColor = self.randomColor();let bn = bullet.node;_=bn
			.position = self.randomPosition(config: config as! Config);_=bn
				.setScale(self.randomRadius())
		
	}
}