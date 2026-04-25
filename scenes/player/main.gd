extends CharacterBody2D

var speed = 100.0
var direction = Vector2.ZERO

const scorescene = preload("res://scenes/player/score.tscn")
const icon1 = preload("res://Coin.png")

var scores = [
	["coins", 0, icon1, Vector2(0, 0)]
]

var score_labels = []

func _ready() -> void:
	for score in scores:
		var score_label = scorescene.instantiate()

		score_label.whatitscounting = score[0]
		score_label.val = int(score[1])

		# world-space placement (relative to Player)
		score_label.position = score[3]

		# set the visible number on the child Label node
		score_label.get_node("Label").text = str(score_label.val)

		# if your icon is also a child, set it similarly, e.g.
		# score_label.get_node("TextureRect").texture = score[2]

		add_child(score_label)
		score_labels.append(score_label)

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

func increase_score(label_counting: String) -> void:
	for tracker in score_labels:
		if tracker.whatitscounting == label_counting:
			tracker.val += 1
			tracker.get_node("Label").text = str(tracker.val)
