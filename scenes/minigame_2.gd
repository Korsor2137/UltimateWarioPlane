
extends Node2D



@onready var samolot: = $Sasalot
@onready var themed_timer: Node2D = $ThemedTimer
@onready var piwo: = $PiwoPaliwo

####
var move_distance: float = 35.0
###

func _ready() -> void:
	await themed_timer.czas_tyka(12.0)
	
	UltimateGlobalScript.minigames_done = maxi(UltimateGlobalScript.minigames_done - 1, 0)
	UltimateGlobalScript.lives = maxi(UltimateGlobalScript.lives - 1, 0)
	UltimateGlobalScript.ałaa = true

	get_tree().change_scene_to_file("res://scenes/UltimateMidEkran1.tscn")

func _input(event: InputEvent) -> void:


	var ruszaj_kurwiu := false
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			ruszaj_kurwiu = true
			
	elif event is InputEventKey:
		if event.keycode == KEY_SPACE and event.pressed and not event.echo:
			ruszaj_kurwiu = true


	if ruszaj_kurwiu:
		samolot.global_position.x += move_distance
		czy_win()



func czy_win() -> void:
	if samolot.global_position.x >= piwo.global_position.x:
		get_tree().change_scene_to_file("res://scenes/winner_dinner.tscn")
