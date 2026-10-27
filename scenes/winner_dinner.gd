extends Node2D

#sssssssettinggggggsssssss
#yeah i know
#it aint a lot i this scene


func _on_ultimate_win_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ultimate_title_screen.tscn")
