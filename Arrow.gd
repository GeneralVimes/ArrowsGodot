extends Node2D

var speed=200.0;
var fly_time=0.0;#скільки часу треба летіти
var spent_time=0.0;# скільки часу вже летіли
var x0=0;
var y0=0;
var x1=0;
var y1=0;
#параметри дуги
var k = 0.5#де на шляху від 0 до 1 буде максимальне перевищення дуги
var m = 100#величина максимального перевищення
var a = -m/(k*k-k);#коефиіиєнт квадратного тричлена delta_y = a*t*t-a*t

var is_stuck=false
# Called when the node enters the scene tree for the first time.
func _ready():
	#launch(700, 300);
	
	pass # Replace with function body.

func launch(xt, yt):#Запускаємо стрілу з початкової позиції у деяку точку xt, yt
	x0 = self.position.x;
	y0 = self.position.y;
	x1=xt;
	y1=yt;
	var dx = x1-x0;
	var dy = y1-y0;
	var d = sqrt(dx*dx+dy*dy);#яка дистанція між точками по ппрямій
	fly_time = d/speed;
	spent_time=0;
	m = 0.25*d;#перераховуємо переметри параболи
	a = -m/(k*k-k);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_stuck:
		return
	#delta - це скільки часу пройшло в секундах
	spent_time+=delta;
	var t = spent_time/fly_time;

	if t<10:#умова що стріла пролетіла відстанб до цільової точки
		#якщщо її прибрати, пона буде летіти до нескінченності
		#тоді треба додати умову виходу за екран
		var xa = x0+t*(x1-x0);
		var ya = y0+t*(y1-y0);
		ya += a*t*t-a*t
		
		self.rotation = Vector2(xa-self.position.x, ya-self.position.y).angle()+PI/2;
		
		self.position.x = xa;
		self.position.y = ya;
		
		
	pass


func stick_to_object(ob):
	print("stick_to_object")
	if not is_stuck:
		is_stuck=true;
		var dx = self.position.x-ob.position.x;
		var dy = self.position.y-ob.position.y;
		var dr = self.rotation-ob.rotation;

		self.get_parent().remove_child(self)
		ob.add_child(self);

		self.position.x = dx;
		self.position.y = dy;
		self.rotation = dr;
