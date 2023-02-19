extends Node2D


var a = 50

var hex = preload("res://Hexagon.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	create_map()


func create_map():
	var ny = 5
	var nx = 10
	
	var xp = 100
	var yp = 100
	
	for i in range(nx):
		var deltaY = pow(-1,i)*a*sqrt(3)/4
		for j in range(ny):
			var instance = hex.new()
			instance.r = a
			instance.X = xp+i*1.5*a
			instance.Y = yp+deltaY+j*a*sqrt(3)
			self.add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
