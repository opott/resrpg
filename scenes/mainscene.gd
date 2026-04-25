extends Node

const coin_node = preload("res://scenes/coin.tscn")

const coins_to_create = [
		Vector2(0, 1),
		Vector2(100, 200),
		Vector2(88, 231),
		Vector2(123, 234),
		Vector2(253, 53),
		Vector2(-88, 231),
		Vector2(123, -234),
		Vector2(-253, -53),
		Vector2(-100, 145),
		Vector2(97, 34),
		Vector2(30, 800),
		Vector2(-25, 213),
		Vector2(-97, -34),
		Vector2(30, -800),
		Vector2(-25, 213),
	]

var coin_nodes = []

func _ready() -> void:
	for coin in coins_to_create:
		var coin_instance = coin_node.instantiate()
		coin_instance.position = coin
		add_child(coin_instance)
		coin_nodes.append(coin_instance)
		
	_connect_signals()

func _connect_signals():
	for coin in coin_nodes:
		coin.collected.connect(_coin_collected)
		
func _coin_collected():
	$Player.increase_score("coins")
