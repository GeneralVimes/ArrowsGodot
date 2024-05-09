extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.x-=1;
	pass


func _on_area_2d_area_entered(area):
	print("area entered", area, area.name)
	if area.name=="arrow_tip":
		var arr=area.get_parent()
		arr.stick_to_object(self)
	pass # Replace with function body.
