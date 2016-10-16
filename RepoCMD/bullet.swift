import SpriteKit
typealias LHS = Void
typealias Yourself = Void
let lhs = Void.self
let myself = Void.self
typealias NSTI = NSTimeInterval

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
		dculty		 = (def_level: Difficulty.normal,
		      		    range: (CGF(1.25), CGF(1.5)))
	}
	
	private static let config = Config()
	
	let	node = SKShapeNode(circleOfRadius: Config.init().radius)
	init() { self.node.addToScene() }
	
	private static func  randomRadius() 		 -> CGF  	  { return random(10, 20) }
	
	private static func  randomColor() 			 -> NSColor	{
		switch random(1,3) {
		case 1:	return NSColor.blueColor()
		case 2:	return NSColor.greenColor()
		case 3:	return NSColor.redColor()
		default: return ERROR(NSColor.init())}
	}
	
	private static func  randomPosition(
		graph g: (origin: CGP, bounds: CGP) = (config.origin, config.bounds)) -> CGP {
		
		let rand = (x: random(g.origin.x, g.bounds.x),
		            y: random(g.origin.y, g.bounds.y))
		
		switch random(1,4) {																							// side to spawn on 1 top 4 left
			case 1: return CGP(	x: rand.x,			y: g.bounds.y)
			case 3: return CGP( x: rand.x, 			y: g.origin.y)
			case 2: return CGP(	x: g.bounds.x, 	y: rand.y)
			case 4: return CGP( x: g.origin.x,	y: rand.y)
			default:return CGP( x: 0,						y: error! as! CGF)					// Will crash
		}
	}
 
	// Timer and scale
	private static func setDifficulty(level: Difficulty, range: (CGF,CGF) = config.dculty.range)
		-> (duration: NSTI, scale: CGF) {
			switch level {
				case .easy: 	return ( 1.5, 0)
				case .normal:	return ( NSTI( random( range.0, range.1)), 0)
				case .hard:		return ( 1.0, 0)
			}
	}
	
	// Spawner
	static func spawn (bullet: Bullet,											// ;_=bn
	                   wheel:  SKSpriteNode,
										 config: Any		 		= config,
										 dculty: Difficulty = config.dculty.def_level)
		-> Bool {
			
			bullet.node.fillColor = self.randomColor()
			bullet.node.position  = self.randomPosition()
			
			let new_dculty = self.setDifficulty(dculty)
			
			if dculty == .hard {
				bullet.node.setScale( new_dculty.scale)
			}
		
			let attack_wheel = SKAction.moveTo( wheel.position,
			                                    duration: new_dculty.duration)
			bullet.node.runAction( attack_wheel)
			return true
	}
}