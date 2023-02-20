extends Node2D


var a = 50

var hex = preload("res://Hexagon.gd")

var mapTab = []


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
			#wyznaczanie id
			var id = i*ny+j
			#tworzenie listy sasiadow
			var neig = []
			var yBT0 = false	# y > 0
			var yLTny = false	# y < ny-1
			if j > 0:
				yBT0 = true
				neig.append(id-1)
			if j < ny-1:
				yLTny = true
				neig.append(id+1)
			if deltaY < 0:
				if i > 0:
					if yBT0:
						neig.append(id-ny-1)
					neig.append(id-ny)
				if i < nx-1:
					if yBT0:
						neig.append(id+ny-1)
					neig.append(id+ny)
			else:
				if i > 0:
					neig.append(id-ny)
					if yLTny:
						neig.append(id-ny+1)
				if i < nx-1:
					neig.append(id+ny)
					if yLTny:
						neig.append(id+ny+1)
				
			#przekazywanie danych do hexa
			instance.set_initial_data(id, neig)
			
			#dodawanie hexa do mapy
			mapTab.append(instance)
			self.add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
