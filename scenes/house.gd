extends StaticBody2D

var at_door = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("e") and at_door:
		get_tree().change_scene_to_file("res://scenes/homescene.tscn")
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	at_door = true
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	at_door = false
