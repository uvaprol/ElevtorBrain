extends Node2D

var task = null
var FLOORS = []

func _ready() -> void:
	for f in $"..".get_children():
		if f.name.find('Floor') != -1:
			FLOORS.append(f)

func _process(_delta: float) -> void:
	if task and not $AnimatedSprite2D.is_playing() and $Timer.is_stopped():
		if position.y < FLOORS[task - 1].position.y:
			position.y += 1
		elif position.y > FLOORS[task - 1].position.y:
			position.y -= 1
		else:
			$AnimatedSprite2D.play('default')
			FLOORS[task - 1].get_children()[0].play('default')

func _on_timer_timeout() -> void:
	$AnimatedSprite2D.play_backwards('default')
	FLOORS[task - 1].get_children()[0].play_backwards('default')

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.frame == 2:
		$Timer.start()
	else:
		task = null
