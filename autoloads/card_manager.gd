extends Node

enum Colors { RED, BLACK }
enum Numbers { A, TWO, THREE, FOUR, FIVE, SIX, SEVEN, HEIGHT, NINE, TEN, J, Q, K }
enum Types { BANK, P_DOWN, P_UP, CENTER }
enum Paints { HEART, ISO, DARK, TREFFLE }

signal bank_filled()
signal bank_updated(bank: Array[Card])

var cards: Array[Card] = []


func _ready():
	randomize()
	fill_bank()


func fill_bank():
	for paint in range(4):
		for num in range(1, 14):
			var card := Card.new()
			card.number = Numbers.values()[num-1]
			card.region_rect = Rect2(num * 18, paint * 27, 17, 26)
			card.paint = paint

			cards.append(card)
	cards.shuffle()
	bank_filled.emit()
	
	
func set_card_type(card: Card, type: Types):
	for c in cards:
		if c.paint == card.paint and c.number == card.number:
			c.type = type
			return
			
			
				
			
	
