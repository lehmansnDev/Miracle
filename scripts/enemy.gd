extends CharacterBody2D

@export var speed := 50
@export var move_interval := 2.0

var move_timer := 0.0
var current_direction := Vector2.DOWN

@onready var animation_sprite = $AnimatedSprite2D

func _ready():
	randomize()

func _physics_process(delta):
	move_timer -= delta
	
	if move_timer <= 0:
		current_direction = Vector2(randi_range(-1, 1), randi_range(-1, 1)).normalized()
		move_timer = move_interval

	velocity = current_direction * speed
	move_and_slide()

	update_animation()

func update_animation():
	var is_moving = velocity.length() > 0.1

	if abs(current_direction.x) > abs(current_direction.y):
		if current_direction.x > 0:
			animation_sprite.play("right_walking" if is_moving else "right_idle")
		else:
			animation_sprite.play("left_walking" if is_moving else "left_idle")
	else:
		if current_direction.y > 0:
			animation_sprite.play("down_walking" if is_moving else "down_idle")
		else:
			animation_sprite.play("up_walking" if is_moving else "up_idle")
