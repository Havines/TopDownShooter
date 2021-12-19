extends Node
var Mob = preload("res://Scens/Enemy.tscn")
var MobSh = preload("res://Scens/Enemy_shooting.tscn")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()

func _process(delta):
	pass
	
	
func _on_MobTimer_timeout():
	var xpos = int(rand_range(1,12))
	#$Mob/MobPath/MobSpawnLocation.set_offset(randi())
	#$Mob/MobPath2/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	if xpos == 1:
		mob.position = $Mob/Mob1.position
	elif xpos == 2:
		mob.position = $Mob/Mob2.position
	elif xpos == 3:
		mob.position = $Mob/Mob3.position
	elif xpos == 4:
		mob.position = $Mob/Mob4.position
	elif xpos == 5:
		mob.position = $Mob/Mob5.position
	elif xpos == 6:
		mob.position = $Mob/Mob6.position
	elif xpos == 7:
		mob.position = $Mob/Mob7.position
	elif xpos == 8:
		mob.position = $Mob/Mob8.position
	elif xpos == 9:
		mob.position = $Mob/Mob9.position
	elif xpos == 10:
		mob.position = $Mob/Mob10.position
	elif xpos == 11:
		mob.position = $Mob/Mob11.position
	elif xpos == 12:
		mob.position = $Mob/Mob12.position
	




func _on_MobTimer2_timeout():
	var xpos = int(rand_range(1,12))
	var mobs = MobSh.instance()
	add_child(mobs)
	if xpos == 1:
		mobs.position = $Mob/Mob1.position
	elif xpos == 2:
		mobs.position = $Mob/Mob2.position
	elif xpos == 3:
		mobs.position = $Mob/Mob3.position
	elif xpos == 4:
		mobs.position = $Mob/Mob4.position
	elif xpos == 5:
		mobs.position = $Mob/Mob5.position
	elif xpos == 6:
		mobs.position = $Mob/Mob6.position
	elif xpos == 7:
		mobs.position = $Mob/Mob7.position
	elif xpos == 8:
		mobs.position = $Mob/Mob8.position
	elif xpos == 9:
		mobs.position = $Mob/Mob9.position
	elif xpos == 10:
		mobs.position = $Mob/Mob10.position
	elif xpos == 11:
		mobs.position = $Mob/Mob11.position
	elif xpos == 12:
		mobs.position = $Mob/Mob1.position


func _on_Timer_timeout():
	global.time += 1
	$Camera2D/Label.set_text("Time: " + str(global.time))
