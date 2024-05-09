extends Node2D
var was_mouse_down=false;
var mouse_down_x = 0;
var mouse_down_y = 0;

var drawn_arrow_im;

# Called when the node enters the scene tree for the first time.
func _ready():
	drawn_arrow_im = $ArrowDrawn
	pass # Replace with function body.
#щоб стрілка тягнулася, коли натискаємо муши та тягнемо
#натискання миші - основу стрылки ставимо у координати миші
#сама стрілка довжини 0
#рух миші після натискання - змынюэмо дожину стрылки та ъъ кут повороту так,
#щоб основа залишалася у початковій точці, а кінець стрілки був під мишею

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			drawn_arrow_im.visible=true;
			drawn_arrow_im.position.x = event.position.x
			drawn_arrow_im.position.y = event.position.y
			drawn_arrow_im.scale.y = 0
			was_mouse_down=true
			mouse_down_x = event.position.x
			mouse_down_y = event.position.y
		else:
			drawn_arrow_im.visible=false;
			was_mouse_down=false;
			var shoot_arr = load("res://flying_arrow.tscn").instantiate()
			add_child(shoot_arr);
			var dx = event.position.x-mouse_down_x;
			var dy = event.position.y-mouse_down_y;			
			shoot_arr.start_fying(mouse_down_x,mouse_down_y,dx,dy)
			
	if event is InputEventMouseMotion:
		if was_mouse_down:
			var dx = event.position.x-mouse_down_x;
			var dy = event.position.y-mouse_down_y;
			var d = sqrt(dx*dx+dy*dy);
			drawn_arrow_im.scale.y = d/100;
			var phi = atan2(dx, -dy)
			drawn_arrow_im.rotation = phi
			
		

"""
#це інпут івент для відслідковування кліків та дабл кліків
#потрібно створити енастпуні глобальні змінні
var was_mouse_down=false;
var mouse_down_x = 0;
var mouse_down_y = 0;

func _input(event):
	#print(event)
	if event is InputEventMouseButton:
		print(event)
		if event.pressed:#натиснули мишу
			was_mouse_down=true;
			mouse_down_x=event.position.x
			mouse_down_y=event.position.y
			if event.double_click:
				print("DOUBLE!!!")
				was_mouse_down=false
		else:#відтиснули мишу
			if was_mouse_down:
				var dx = mouse_down_x-event.position.x
				var dy = mouse_down_y-event.position.y
				if abs(dx)<10 and abs(dy)<10:
					print("CLICK!!!")
					
				was_mouse_down=false
"""					
			
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
