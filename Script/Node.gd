extends Control



func _on_Button_pressed():
	var ch = get_tree().change_scene("res://Scens/Stage.tscn")
	assert(ch == OK)
