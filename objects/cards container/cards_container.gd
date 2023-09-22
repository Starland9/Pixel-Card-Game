extends Node2D
class_name CardsContainer

const card_scene := preload("res://objects/card/card.tscn")

var cards : Array[Card] = []
@export var type : CardManager.Types


func _ready():
	draw_cards()
	
func draw_cards(increment: Vector2 = Vector2.ZERO):
	var pos = Vector2.ZERO
	_clear()
	for card in cards:
		if not card.type == type:
			continue
			
		var card_instance := card_scene.instantiate()
		add_child(card_instance)
		card_instance.init_from_card(card)
		card_instance.position += pos
		pos += increment
	
func onClick(card: Card):
	pass

func _clear():
	for card in get_children():
		card.queue_free()

func give_card(card: Card):
	CardManager.set_card_type(card, type)

func _input(event):
	if event is InputEventMouseButton:
		for card in get_children():
			if event.double_click and card is Card and card.get_event(event):
				onClick(card)
				return
				
func _shuffle_card():
	cards.shuffle()
