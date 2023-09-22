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
	
func shuffle_anime():
	var start_pos = global_position
	var tween = get_tree().create_tween()
	
	
func init_from_card(card: Card):
	paint = card.paint
	number = card.number
	region_rect = card.region_rect
	
func get_event(event: InputEventMouse):
	return event.position.x > global_position.x and event.position.x < global_position.x + width and event.position.y > global_position.y and event.position.y < global_position.y + height
	
	

	
	
