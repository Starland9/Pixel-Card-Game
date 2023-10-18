extends CardsContainer
class_name Player

signal played(card: Card)
signal cpuDemandBank()


func _ready():
	container = $Control/ScrollContainer/HBoxContainer
	
		
func play(card: Card):
	$Play.play()
	played.emit(card)
	
func cpuPlay(current_card: Card):
	for card in cards:
		if current_card.is_playable_by(card):
			play(card)
			return card
	cpuDemandBank.emit()
		
func onClick(card: Card):
	play(card)
	
func give_card(card: Card):
	var card2: Card = Card.new()
	card2.init_from_card(card, type)
	cards.push_front(card2)
	
func draw_cards(_increment: Vector2 = Vector2.ZERO):
	_clear()
	for card in cards:
		var card_instance := card_scene.instantiate()
		var control: = Control.new()
		control.add_child(card_instance)
		card_instance.init_from_card(card, type)
		if hide_cards:
			card_instance.enable_hide()
		control.custom_minimum_size = Vector2(card_instance.width, card_instance.height)
		container.add_child(control)

func _input(event):
	if event is InputEventMouseButton:
		for control in container.get_children():
			var card = control.get_children()[0]
			if event.double_click and card is Card and card.get_event(event):
				onClick(card)
				return
