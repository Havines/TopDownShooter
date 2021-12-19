extends Camera2D
var player_pos
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	player_pos = $"../Player".position
	self.position = player_pos
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.

