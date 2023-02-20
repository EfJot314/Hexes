extends Area2D


export var X = 0
export var Y = 0
export var r = 50

var dr = 3

var mouse_over = false
var selected = false

var polyg = Polygon2D.new()



# Called when the node enters the scene tree for the first time.
func _ready():
	createHex()

func _draw():
	pass
	

func _process(delta):
	#miana koloru w zaleznosci od stanu
	if mouse_over:
		polyg.color = Color.red
	elif selected:
		polyg.color = Color.blue
	else:
		polyg.color = Color.gray
	
	

func createHex():
	var R = r-dr
	var vertices = PoolVector2Array()
	for i in range(6):
		var xi = X + R*cos(i*PI/3)
		var yi = Y + R*sin(i*PI/3)
		vertices.append(Vector2(xi, yi))
	polyg.polygon += vertices
	self.add_child(polyg)


func _input(event):
	if event is InputEventMouseMotion:
		mouse_over = check_if_mouse_in_polygon(event.position)
	if event.is_action_pressed("selectHex"):
		if mouse_over:
			selected = !selected
	if event.is_action_pressed("unselectHex"):
		if mouse_over:
			selected = false
			

func check_if_mouse_in_polygon(mousePosition):
	if Geometry.is_point_in_polygon(mousePosition, polyg.get_polygon()):
		return true
	return false
	
	
func get_state():
	return selected
	
func get_number():
	return 0
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

