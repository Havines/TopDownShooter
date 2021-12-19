extends KinematicBody2D
var hp = 5
var speed = 170


func _ready():
	add_to_group("Enemy")

func _process(delta):
	var pos_player = $"../Player".position
	self.position += (pos_player - self.position).normalized()*speed*delta
	$Sprite.rotation = (pos_player- self.position).angle()
	
	move_and_collide(speed*delta*Vector2())
	
	
	


func _on_Area2D_body_entered(body):
	if body.is_in_group("Bullet"):
		hp-=1
		$Sprite.frame = 1
		$Anim.start()
		#$Particles2D.restart()
		if hp<1:
			global.score += 10
			$"../Camera2D/Label2".set_text("Score: "+str(global.score))
			$Death.start()
			$Sprite.visible = false
			$CollisionPolygon2D2.queue_free()
			$Light2D.queue_free()
			$AnimationPlayer.play("Death")
			$Area2D.queue_free()
			speed = 0
	if body.is_in_group("Player"):
		global.HP_p -=100
		print(111)






func _on_Anim_timeout():
	$Sprite.frame = 0


func _on_Death_timeout():
	queue_free()
