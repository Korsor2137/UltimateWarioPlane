extends Node2D
@onready var timer: RichTextLabel = $timer #literally just letters

var time : float

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	timer.text = str(snapped(time, 0.10)) 

func czas_tyka(start_time: float):
	time = start_time
	
	while time > 0.0: 
		await wait(0.10)
		time = time - 0.10
	
	#when timer reaches 0, your mama
	return
	
func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 
#sleepy time monke, this shi is the tutorial but changed names, cant improve it much :/
