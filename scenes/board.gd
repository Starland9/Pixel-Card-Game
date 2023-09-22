extends Node2D
class_name Board

@onready var bank : Bank = $Bank
@onready var human: Player = $Players/human
@onready var cpu: Player = $Players/cpu
@onready var table : Table = $Table

var current_player : Player


func _ready():
	current_player = human
	_draw_all_cards()

func _on_bank_shared(card: Card):
	current_player.give_card(card)
	_draw_all_cards()
	_alternate_player()
	
func _alternate_player():
	if current_player == human:
		current_player = cpu
	else:
		current_player = human


func _draw_all_cards():
	bank.draw_cards(Vector2(0, 0.1))
	human.draw_cards(Vector2(17, 0))
	cpu.draw_cards(Vector2(17, 0))
	table.draw_cards(Vector2(
			randf_range(-50, 50),
			randf_range(-50, 50),
		))


func _on_human_played(card: Card):
	table.set_card(card)
	_draw_all_cards()

func _on_cpu_played(card: Card):
	table.set_card(card)
	_draw_all_cards()
