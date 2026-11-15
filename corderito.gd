extends CharacterBody2D


const GRAVITY = 1200.0
const SPEED = 200.0
var start_position

func _ready():
	start_position = position

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	move_and_slide()
	
	if direction != 0:
		$Sprite2D.flip_h = direction > 0
		
	if position.y > 600:
		position = start_position
		velocity = Vector2.ZERO
		
func bounce(force):
	velocity.y = force
	var tween = create_tween()
	tween.tween_property($Sprite2D, "scale", Vector2(0.8, 1.2), 0.1)
	tween.tween_property($Sprite2D, "scale", Vector2.ONE, 0.2)			
