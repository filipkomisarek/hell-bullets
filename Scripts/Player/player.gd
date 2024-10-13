extends CharacterBody2D

var speed: int = 75
# defalut direction that player alwayes looing down at the beginning
var direction: Vector2 = Vector2(0,1)

func _physics_process(delta: float) -> void:
	# get access bt vector2d to left, right, up and down movement and normalized it
	var inputDir: Vector2 = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")).normalized()
		
	if inputDir.x > 0:
		# check if player is moving right and set frame '1' with false flip
		get_node("Player").frame = 1
		get_node("Player").flip_h = false
		direction = inputDir
	elif inputDir.x < 0:
		# check if player is moving left
		get_node("Player").frame = 1
		get_node("Player").flip_h = true
		direction = inputDir
	elif inputDir.y > 0:
		# check if player is moving down
		get_node("Player").frame = 0
		get_node("Player").flip_h = false
		direction = inputDir
	elif inputDir.y < 0:
		# check if player is moving up
		get_node("Player").frame = 2
		get_node("Player").flip_h = false
		direction = inputDir
		
	velocity = inputDir * speed
	move_and_slide()
