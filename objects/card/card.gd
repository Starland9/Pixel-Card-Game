extends Sprite2D
class_name Card

@onready var width := 17.0
@onready var height := 26.0


var number : CardManager.Numbers
var type := CardManager.Types.BANK
var paint : CardManager.Paints


func _ready():
	width *= scale.x
	height *= scale.y
	
func is_playable_by(card: Card) -> bool:
	if number == card.number:
		return true
	if paint == card.paint:
		return true
		
	return false
	
func enable_hide():
	$Hider.show()

func disable_hide():
	$Hider.hide()
	
func init_from_card(card: Card, card_type: CardManager.Types):
	paint = card.paint
	number = card.number
	region_rect = card.region_rect
	type = card_type
	
func is_equal_to(card: Card):
	return card.number == number and card.type == type and card.paint == paint
	
func get_event(event: InputEventMouse):
	return event.position.x > global_position.x and event.position.x < global_position.x + width \
		and event.position.y > global_position.y and event.position.y < global_position.y + height
	
