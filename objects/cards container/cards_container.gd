extends Node2D
class_name CardsContainer

const card_scene := preload("res://objects/card/card.tscn")

var cards : Array[Card] = []
@export var type : CardManager.Types

@onready var container = self
@export var hide_cards := false

func _ready():
	draw_cards()
	

func draw_cards(increment: Vector2 = Vector2.ZERO):
	var pos = Vector2.ZERO
	_clear()
	for card in cards:
		var card_instance := card_scene.instantiate()
		container.add_child(card_instance)
		card_instance.position += pos
		if hide_cards:
			card_instance.enable_hide()
		card_instance.init_from_card(card, type)
		pos += increment
	
func onClick(_card: Card):
	pass

func _clear():
	for card in container.get_children():
		card.queue_free()

func give_card(card: Card):
	var card2: Card = Card.new()
	card2.init_from_card(card, type)
	cards.append(card2)

	
	
func remove_card(card: Card):
	for c in cards:
		if c.paint == card.paint and c.number == card.number:
			cards.erase(c)
			return
	return null

	
	
func _input(event):
	if event is InputEventMouseButton:
		if self is Player:
			print(container.get_children())
		for card in container.get_children():
			if event.double_click and card is Card and card.get_event(event):
				onClick(card)
				return
				
func _shuffle_card():
	cards.shuffle()
