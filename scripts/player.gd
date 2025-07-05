extends CharacterBody2D

# Geschwindigkeit des Spielers (Pixel pro Sekunde)
@export var speed := 100.0
@onready var animation_sprite = $AnimatedSprite2D
var current_direction := Vector2.ZERO

func _physics_process(_delta):
	player_move()
	
func player_move(): 
	var input_vector := Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		current_direction = Vector2.RIGHT
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		current_direction = Vector2.LEFT
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down"):
		current_direction = Vector2.DOWN
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		current_direction = Vector2.UP
		input_vector.y -= 1
		
	player_animation(input_vector)

	input_vector = input_vector.normalized()
	velocity = input_vector * speed
	move_and_slide()
	
func player_animation(input: Vector2):
	if current_direction == Vector2.RIGHT and input != Vector2.ZERO:
		animation_sprite.play("right_walking")
	if current_direction == Vector2.RIGHT and input == Vector2.ZERO:
		animation_sprite.play("right_idle")
	if current_direction == Vector2.LEFT and input != Vector2.ZERO:
		animation_sprite.play("left_walking")
	if current_direction == Vector2.LEFT and input == Vector2.ZERO:
		animation_sprite.play("left_idle")
	if current_direction == Vector2.DOWN and input != Vector2.ZERO:
		animation_sprite.play("down_walking")
	if current_direction == Vector2.DOWN and input == Vector2.ZERO:
		animation_sprite.play("down_idle")
	if current_direction == Vector2.UP and input != Vector2.ZERO:
		animation_sprite.play("up_walking")
	if current_direction == Vector2.UP and input == Vector2.ZERO:
		animation_sprite.play("up_idle")
