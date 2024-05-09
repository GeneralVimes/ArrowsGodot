extends Node2D

var speed_x=0;
var speed_y=0;
var g_const=500
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.x+=speed_x*delta;
	self.position.y+=speed_y*delta;
	speed_y+=g_const*delta
	pass


func start_fying(x0, y0, vx, vy):
	self.position.x = x0;
	self.position.y = y0;
	speed_x=vx;
	speed_y=vy;
