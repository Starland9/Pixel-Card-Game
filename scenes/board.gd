extends Node2D

const card_scene := preload("res://objects/card/card.tscn")

var bank: Array[Card]

func _ready():
	CardManager.bank_filled.connect(_on_card_manager_bank_filled)


func _draw_bank():
	for card in bank:
		var card_instance := card_scene.instantiate()
		card_instance.init_from_card(card)
		add_child(card_instance)

func _on_card_manager_bank_filled(_bank: Array[Card]):
	bank = _bank
	_draw_bank()
