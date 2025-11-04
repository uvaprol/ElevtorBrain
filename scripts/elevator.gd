extends Node2D

var floors = []
var task = null
var move_direction = null
var open_on_floor = false
var open_status = false

func _ready() -> void:
	for child in $"..".get_children():
		if child.name.find('Floor') != -1:
			floors.append(child)
	print(floors)

func _process(_delta: float) -> void:
	if task and not open_on_floor:
		if position.y < floors[task - 1].position.y:
			position.y += 1
			move_direction = 'down'
		elif position.y > floors[task - 1].position.y:
			position.y -= 1
			move_direction = 'up'
		else:
			move_direction = 'stop'
			open_on_floor = true
			$"..".floor_tasks.erase(task)
			$"..".elevator_tasks.erase(task)
			$AnimatedSprite2D.play('default')
			open_status = true
			#$AnimatedSprite2D.play_backwards('default')

func _on_timer_timeout() -> void:
	$AnimatedSprite2D.play_backwards('default')
	open_status = false
	move_direction = null
	task = null

func _on_animated_sprite_2d_animation_finished() -> void:
	if open_status:
		$Timer.start()
	else:
		open_on_floor = false
