extends Node2D


# Don't
func _ready() -> void:
	pass 

# Care
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/UltimateMidEkran1.tscn")
	UltimateGlobalScript.lives += 5

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ultimate_settings.tscn")
