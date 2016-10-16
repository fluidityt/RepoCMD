import SpriteKit

internal enum Difficulty { case easy, normal, hard }
// TODO: Should probably put the spawn timer in here.and Config.... but it would be my only var..

/// Trying to limit OOP
struct Bullet {
	
	/* Data */
	private struct Config {
		private let
		origin 		 = CGP( x: (25 - gView!.frame.width),       y: (200 - gView!.frame.height)),
		bounds 		 = CGP( x: (gView!.frame.width - 25),       y: (gView!.frame.height - 200)),
		radius 		 = CGF( 10),
		dculty		 =    ( def_level: Difficulty.normal,       range: (CGF(1.25), CGF(1.5)))
	}
	private static let config = Config()
	
	let	node = SKShapeNode(circleOfRadius: Config.init().radius)
	init() 		{ self.node.addToScene() }
	
	
/* Spawner */
	static func spawn (	bullet: Bullet,											// ;_=bn
											wheel:  SKSpriteNode,
											config: Any,
											dculty: Difficulty = config.dculty.def_level)
		-> Bool {
			
			/* Get Values */
			let conf = config as! Config
			
			let random_color = { () -> NSColor in
				switch random(1,3) {
					case 1:	return NSColor.blueColor()
					case 2:	return NSColor.greenColor()
					case 3:	return NSColor.redColor()
					default: return ERROR(NSColor.init())}
			}()
			
			let random_position = { () -> CGPoint in
				let rand = (x: random(conf.origin.x, conf.bounds.x),
				            y: random(conf.origin.y, conf.bounds.y))
				switch random(1,4) {																							// side to spawn on 1 top 4 left
					case 1: return CGP(	x: rand.x,					y: conf.bounds.y)
					case 3: return CGP( x: rand.x, 					y: conf.origin.y)
					case 2: return CGP(	x: conf.bounds.x, 	y: rand.y)
					case 4: return CGP( x: conf.origin.x,		y: rand.y)
					default:return CGP( x: 0,								y: error! as! CGF)			// Will crash
				}
			}()
			
			let new_dculty = { () -> (duration: NSTI, scale: CGF) in
				switch dculty {
					case .easy: 	return ( 1.5, 0.5)
					case .normal:	return (NSTI( random(conf.dculty.range.0, conf.dculty.range.1)), 0)
					case .hard:		return ( 1.0, 2)
				}
			}()
		
			/* Assign */
			bullet.node.fillColor = random_color
			bullet.node.position  = random_position
			
			if dculty == .hard 		{
				bullet.node.setScale( new_dculty.scale)
			}
			
			let attack_wheel 			= SKAction.moveTo( wheel.position, duration: new_dculty.duration)
			bullet.node.runAction( attack_wheel)
			
			return true
	}
	
}