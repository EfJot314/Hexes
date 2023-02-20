extends Area2D


export var X = 0
export var Y = 0
export var r = 50

var dr = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	createHex()

func _draw():
	#createHex()
	pass

func createHex():
	var R = r-dr
	var vertices = PoolVector2Array()
	for i in range(6):
		var xi = X + R*cos(i*PI/3)
		var yi = Y + R*sin(i*PI/3)
		vertices.append(Vector2(xi, yi))
	var polyg = Polygon2D.new()
	polyg.polygon += vertices
	polyg.color = Color.gray
	self.add_child(polyg)
	
	
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
