extends Sprite2D
class_name Card

const width := 17
const height := 26

var color : CardManager.Colors
var number : CardManager.Numbers


func _ready():
	pass


func init_card(_color: CardManager.Colors, _number: CardManager.Numbers, rect: Rect2):
	color = _color
	number = _number
	region_rect = rect
	
func init_from_card(card: Card):
	color = card.color
	number = card.number
	region_rect = card.region_rect
	
