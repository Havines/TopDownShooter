extends KinematicBody2D
var hp = 30

var speed = 170
var vision = false
var moving = false
var path = []
onready var navigation = $"../Navigation2D"


func _ready():
	add_to_group("Enemy")
	


func _physics_process(delta):
	var pos_player = $"../Player".position
	
	if moving:
		if path.size() == 0:
			path = navigation.path_to_player(self.position)
		else:
			var r = (pos_player - self.position).angle()
			if(r!=0):
				self.rotation = r
			#var colasion = move_and_collide(path[0] - self.position).normalized()*speed*delta)
			self.position += (path[0] - self.position).normalized()*speed*delta
			if self.position.distance_to(path[0]) < speed*delta:
				path.remove(0)


	if vision:
		var space_state = get_world_2d().direct_space_state
		var res = space_state.intersect_ray(self.position, $"../Player".position,[self,$"../Player",$"Area2D"])
		if !res:
			#$Path.start()
			moving = true




func _on_Area2D_body_entered(body):
	if body.is_in_group("Bullet"):
		hp-=1
		$Sprite.frame = 1
		$Anim.start()
		#$Particles2D.restart()
		if hp<1:
			queue_free()
		#body.queue_free()
	if body.is_in_group("Player"):
		global.HP_p -= 100





func _on_Anim_timeout():
	$Sprite.frame = 0


func _on_Area2D2_body_entered(body):
	if body.is_in_group("Player"):
		vision = true


func _on_Path_timeout():
	path = navigation.path_to_player(self.position)
