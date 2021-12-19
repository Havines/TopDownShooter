extends KinematicBody2D
var speed = 2500
var time = 10

func _ready():
	add_to_group("Bullet")


func _process(delta):
	#var mouse = get_tree().get_root().get_mouse_position()
	move_and_collide(speed*delta*Vector2(cos(rotation),sin(rotation)))
	#self.rotation = (mouse - position).angle()
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



func _on_Area2D_body_entered(body):
	if !body.is_in_group("Enemy"):
		$Sprite.visible = false
		$Sprite2.visible = false
		$Light2D.visible = false
		
		$Sparks.emitting = true
		$Timer.start()
		#self.queue_free()
		#print ("NotEnemy")
		



func _on_Timer_timeout():
	self.queue_free()
