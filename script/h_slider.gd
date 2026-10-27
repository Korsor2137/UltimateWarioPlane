extends HSlider

func _ready() -> void:
	min_value = 0
	max_value = 100
	step = 1

	# Ustaw głośność początkową na 10%
	value = 10
	Music.volume_linear = value / 100.0

	value_changed.connect(_on_volume_changed)


func _on_volume_changed(new_value: float) -> void:
	Music.volume_linear = new_value / 100.0
