extends KinematicBody2D
export var MOUTION = 350
var shoot = true
var patron = 35
var weapon = ["pistol", "AK71", "minigun"]
var use_weapon = weapon[1]
var anim 


func _ready():
	add_to_group("Player")
	randomize()

func _process(delta):
	var mouse = get_global_mouse_position()
	
	
	var motion = Vector2()
	self.rotation = (mouse - position).angle()
	if Input.is_action_pressed("ui_up"):
		motion += Vector2(0,-1)
	if Input.is_action_pressed("ui_down"):
		motion += Vector2(0, +1)
	if Input.is_action_pressed("ui_right"):
		motion += Vector2(+1, 0)
	if Input.is_action_pressed("ui_left"):
		motion += Vector2(-1, 0)
		
	
	if Input.is_action_pressed("aim"):
		MOUTION = 125
	else:
		MOUTION = 350
	
	if use_weapon == weapon[1]:
		$Timer.wait_time = 0.08
		$Timer/anim.wait_time = 0.1
	elif use_weapon == weapon[2]:
		$Timer.wait_time = 0.05
		$Timer/anim.wait_time = 0.07
	
	if global.HP_p ==0:
		get_tree().change_scene("res://Scens/GameOver.tscn")
	
	#self.position += x*MOUTION*delta
	motion = motion.normalized()*MOUTION
	
	move_and_collide(motion*delta)
	reload()
	#$Label.rect_rotation = $Label.rect_rotation + self.rotation
	#if ($Label.rect_rotation > (mouse - position).angle()):
	#	$Label.rect_rotation = 180
	

func _on_Timer_timeout():
	if Input.is_action_pressed("ui_accept"):
		if patron >0:
			shooting()



func shooting():
	$Sprite.frame = 1
	var bullet = preload("res://Scens/Bullet.tscn").instance()
	bullet.position = $Position2D.global_position 
	if Input.is_action_pressed("aim"):
		bullet.rotation = self.rotation+deg2rad(rand_range(-1.7,1.7))
	else:
		bullet.rotation = self.rotation+deg2rad(rand_range(-3.9,3.9))
	get_parent().add_child(bullet)
	patron -= 1
	$Light2D.visible = true
	$Label.set_text(str(patron)+'/35')


func reload():
	if Input.is_action_pressed("reload"):
		$Label.set_text('Reloading')
		$Timer2.start()


func _on_anim_timeout():
	if $Sprite.frame ==1:
		$Sprite.frame =0
		$Light2D.visible = false


func _on_Timer2_timeout():
	patron = 35
	$Label.set_text(str(patron)+'/35')
