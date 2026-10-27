extends Node2D

@onready var kontenerhp: HBoxContainer = $Kontenerhp
@onready var timer: RichTextLabel = $timer
@onready var level: RichTextLabel = $lelewel

const bumbarabum = preload("res://bullshish/boom/boom.tscn")



func _ready() -> void:
	level.text = "Level " + str(UltimateGlobalScript.minigames_done + 1)

	await get_tree().process_frame
	await pokapiwo() #piwo visibility
	await czkj(3.0) #the waiting time

	if UltimateGlobalScript.lives == 0:
		get_tree().change_scene_to_file("res://scenes/DeathScene.tscn")
	elif UltimateGlobalScript.minigames_done < 2:
		UltimateGlobalScript.minigames_done += 1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(UltimateGlobalScript.minigames_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


func pokapiwo() -> void:
	var Żyćko = kontenerhp.get_children()
	var lives = clampi(UltimateGlobalScript.lives, 0, 5)

	#so it chceks every heart in range
	for i in range(Żyćko.size()):
		# and if ŻyćkoX >= overall lifes
		if i >= lives:
			#it
			#becomes
			#invisible, magic hehe
			#it took me too long
			Żyćko[i].modulate.a = 0.0

	#ałaa is time ending -> life lost
	if UltimateGlobalScript.ałaa and lives < Żyćko.size():
		var heart = Żyćko[lives]
		heart.modulate.a = 1.0
		await explode(heart)
		# i wanted the deltarune effect, boom
		heart.modulate.a = 0.0
		UltimateGlobalScript.ałaa = false


	if lives == 0:
		await get_tree().create_timer(0.4).timeout
		kontenerhp.hide()


	
func explode(heart: Control) -> void:
		var bomba_ez = bumbarabum.instantiate()
		add_child(bomba_ez)
		#yeah the position function naming took me a bit too, but its almost the same as .css
		bomba_ez.global_position = heart.global_position + heart.size / 2.0
		bomba_ez.z_index = 2137 #yes
		bomba_ez.animation_finished.connect(bomba_ez.queue_free)
		bomba_ez.play()

		await get_tree().create_timer(0.3).timeout


func czkj(seconds: float) -> void:
		while seconds > 0.0:
			timer.text = str(snappedf(seconds, 0.1))
			await get_tree().create_timer(0.1).timeout
			seconds -= 0.1

		timer.text = "0.0"
