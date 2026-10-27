extends Node2D

@onready var themed_timer: Node2D = $ThemedTimer

var piwo_collected: int = 0


func _ready() -> void:
	
	await themed_timer.czas_tyka(20.0)




	UltimateGlobalScript.minigames_done = maxi(UltimateGlobalScript.minigames_done - 1, 0)
	UltimateGlobalScript.lives = maxi(UltimateGlobalScript.lives - 1, 0)
	UltimateGlobalScript.ałaa = true

	get_tree().change_scene_to_file("res://scenes/UltimateMidEkran1.tscn")


func _process(_delta: float) -> void:


	if piwo_collected >= 3:


		if UltimateGlobalScript.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/UltimateMidEkran1.tscn")


func piwo_collect() -> void:
	piwo_collected += 1
