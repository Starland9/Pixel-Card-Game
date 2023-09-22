extends CardsContainer
class_name Bank

signal shared(card: Card)

var visible_card: Card

func _ready():
	cards = CardManager.cards
	_shuffle_card()

func _process(delta):
	pass
	
func onClick(card: Card):
	shared.emit(visible_card)
		
func _update_visible_card():
	visible_card = get_children()[-1]
	




