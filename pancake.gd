extends Area2D

@export var bounce_force = -500.0
@export var move_distance = Vector2.ZERO
@export var move_time = 2.0

func _ready():
	body_entered.connect(_on_body_entered)
	$AnimatedSprite2D.animation_finished.connect(_on_animation_finished)
	$AnimatedSprite2D.play("idle")
	if move_distance != Vector2.ZERO:
		var tween = create_tween().set_loops()
		tween.tween_property(self, "position", position + move_distance, move_time).set_trans(Tween.TRANS_SINE)
		tween.tween_property(self, "position", position, move_time).set_trans(Tween.TRANS_SINE)
		
func _on_body_entered(body):
	if body.is_in_group("jugador") and body.velocity.y > 0:
		body.bounce(bounce_force)
		$AnimatedSprite2D.play("squash")
		
func _on_animation_finished():
	$AnimatedSprite2D.play("idle")				
		
		
