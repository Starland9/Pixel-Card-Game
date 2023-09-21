extends Node

enum Colors { RED, BLACK }
enum Numbers { A, TWO, THREE, FOUR, FIVE, SIX, SEVEN, HEIGHT, NINE, TEN, J, Q, K }

signal bank_filled(bank: Array[Card])
signal bank_updated(bank: Array[Card])

var bank: Array[Card] = []
var p1_cards: Array[Card] = []
var p2_cards: Array[Card] = []

func _ready():
	fill_bank()


func fill_bank():
	for x in range(1, 14):
		for j in range(0, 4):
			var card := Card.new()
			card.number = Numbers.values()[x-1]
			if j < 2:
				card.color = Colors.RED
			else:
				card.color = Colors.BLACK

			bank.append(card)
			
	bank_filled.emit(bank)
			
			
			
				
			
	
