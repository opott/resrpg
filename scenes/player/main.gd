extends CharacterBody2D

var speed = 100.0
var direction = Vector2.ZERO

const scorescene = preload("res://scenes/player/score.tscn")
const icon1 = preload("res://Coin.png")

var scores = [
	["coins", 5, icon1, Vector2(0, 100)]
]

var score_labels = []

func _ready() -> void:
	for score in scores:
		var score_label = scorescene.instantiate()
		
		score_label.whatitscounting = score[0]
		score_label.val = int(score[1])
		score_label.text = score[0]
		score_label.get_node("TextureRect").texture = score[2]
		score_label.position = score[3]
		
		add_child(score_label)
		score_labels.append(score_label)

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
func increase_score(label_counting):
	for label in score_labels:
		if label.whatitscounting == label_counting:
			label.val += 1
			label.text = str(label.val)
			
