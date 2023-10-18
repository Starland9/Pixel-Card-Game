extends Node2D
class_name Board

@onready var bank : Bank = $Bank
@onready var human: Player = $Players/human
@onready var cpu: Player = $Players/cpu
@onready var table : Table = $Table
@onready var animator : CardAnimator = $Animator

var current_player : Player
var first_share_finised := false


func _ready():
	init_game()
	
func init_game():
	current_player = human
	bank.cards = CardManager.cards
	var rnd_card = CardManager.cards.pick_random()
	table.give_card(rnd_card)
	bank.remove_card(rnd_card)
	bank.first_share()
	first_share_finised = true
	_draw_all_cards()
	

func _on_bank_shared(card: Card):
	current_player.give_card(card)
	_draw_all_cards()
	_alternate_player()
	if first_share_finised:
		cpuPlay()
	
func _alternate_player():
	if current_player == human:
		current_player = cpu
	else:
		current_player = human
		

func _draw_all_cards():
	bank.draw_cards()
	human.draw_cards()
	cpu.draw_cards()
	table.draw_cards()

func set_card_on_table(card: Card, player: Player):
	
	if not is_good_player(player):
		return alert_bad_player(player)
		
	if not table.is_card_playable(card):
		return alert_cannot_play_card()

		
	current_player.remove_card(card)
	table.give_card(card)
	_alternate_player()
	_draw_all_cards()
	check_game_over()
	
func alert_cannot_play_card():
	Input.vibrate_handheld(100)
	OS.alert("You cannot play this card !")
	
func alert_bad_player(player: Player):
	Input.vibrate_handheld(100)
	OS.alert(player.name + ", You are not allowed to play !!!")
	
func check_game_over():
	if first_share_finised and current_player.cards.is_empty():
		Input.vibrate_handheld(2000)
		OS.alert(current_player.name + ", YOU WIN THIS GAME !!!")
		var __ = get_tree().reload_current_scene()
	
func cpuPlay():
	if not current_player == cpu:
		return
	var card = current_player.cpuPlay(table.cards.back())
	if card is Card:
		set_card_on_table(card, cpu)
	
func is_good_player(player: Player):
	return player == current_player
	
func _on_human_played(card: Card):
	set_card_on_table(card, human)
	cpuPlay()

func _on_cpu_cpu_demand_bank():
	bank.share()
