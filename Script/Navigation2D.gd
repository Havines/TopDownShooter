extends Navigation2D
var pers 
var point=[]
var pos_player


func _ready():
	pers = $"../Enemy_shooting"
	pos_player = $"../Player"
	
#func _process(delta):
#	pass

#func get_path(end_point):
	#if pers:
		#point = get_simple_path(pers.position,end_point,true)
	#else:
		#pass
	#print(point)

#func _input(event):
	#if event.is_action_pressed("shoot"):
		#self.get_path(event.position)
		#update()

func path_to_player(coord):
	var point1 = get_simple_path(coord, pos_player.position, true)
	return point1

#func _draw():
	#for i in point:
		#draw_circle(i,10,Color(1,1,1))
	#draw_polyline(point,Color(1,1,1),1.0,false)


