extends CardsContainer
class_name Bank

signal shared(card: Card)

var visible_card: Card

func _ready():
	container = $Container
	hide_cards= true
	_shuffle_card()
	draw_cards()


func first_share():
	for i in range(10):
		share()

func _process(_delta):
	pass
	
func onClick(_card: Card):
	share()
	
func share():
	var card = cards.back()
	remove_card(card)
	shared.emit(card)
	draw_cards()
		
func _update_visible_card():
	visible_card = get_children()[-1]

func draw_cards(_increment: Vector2 = Vector2.ZERO):
	super.draw_cards(Vector2(0, 0.1))



