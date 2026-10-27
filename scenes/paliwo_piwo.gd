extends Node2D

signal piwo_collected

@onready var self_area: Area2D = $Area2D


func _ready() -> void:
	self_area.body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and visible:
		piwo_collected.emit()
		hide()
