extends Node2D

@export var music_end = 7.5
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.finished.connect(_on_music_finished)

func _process(delta):
	if $AudioStreamPlayer2D.playing and $AudioStreamPlayer2D.get_playback_position() >= music_end:
		$AudioStreamPlayer2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_music_finished():
	$AudioStreamPlayer2D.play()
