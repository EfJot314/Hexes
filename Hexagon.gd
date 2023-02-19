extends Area2D


export var X = 0
export var Y = 0
export var r = 50

var dr = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _draw():
	createHex()

func createHex():
	var R = r
	#obramowanie
	var vertices = PoolVector2Array()
	for i in range(6):
		var xi = X + R*cos(i*PI/3)
		var yi = Y + R*sin(i*PI/3)
		vertices.append(Vector2(xi, yi))
	draw_polygon(vertices, [Color.black])
	#wypelnienie
	vertices = PoolVector2Array()
	R -= dr
	for i in range(6):
		var xi = X + R*cos(i*PI/3)
		var yi = Y + R*sin(i*PI/3)
		vertices.append(Vector2(xi, yi))
	draw_polygon(vertices, [Color.white])
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
