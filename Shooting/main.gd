extends Node2D

var aror_scene = preload("res://arrow.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	
	if event is InputEventMouseButton:
		if event.pressed:
			var ar = aror_scene.instantiate()
			ar.position.x = 50;
			ar.position.y = 350;
			add_child(ar)
			ar.launch(event.position.x, event.position.y)
			#print(event);

func _process(delta):
	pass
