extends Node


func _ready():
	$Label2.set_text("Score: "+str(global.score))
	$Label3.set_text("Time: "+str(global.time))

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
