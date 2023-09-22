extends CardsContainer
class_name Player

signal played(card: Card)

func _ready():
	pass 
	
		
func play(card: Card):
	CardManager.set_card_type(card, CardManager.Types.CENTER)
	played.emit(card)
		
func onClick(card: Card):
	play(card)
