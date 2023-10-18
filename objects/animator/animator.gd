extends Node2D
class_name CardAnimator

signal animation_complete()

@onready var tween: Tween

func _ready():
	tween.finished.connect(_on_tween_finished)
	tween = get_tree().create_tween().bind_node(self)


func animate_card(
	card_from: Card,
	from: Vector2, to: Vector2
):
	tween.tween_property(card_from, "global_position", to, 0.5)


func _on_tween_finished():
	animation_complete.emit()
