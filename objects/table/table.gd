extends CardsContainer
class_name Table


func _ready():
	container = $Containier
	randomize()


func draw_cards(_increment: Vector2 = Vector2.ZERO):
	super.draw_cards(Vector2(
			randf_range(-1, 1),
			randf_range(-1, 1),
		))
		
func analyse():
	pass
	
func is_card_playable(card: Card) -> bool:
	if cards.is_empty():
		return true
	var last_card: Card = cards.back()
	return last_card.is_playable_by(card)
		
func give_card(card: Card):
	super.give_card(card)
