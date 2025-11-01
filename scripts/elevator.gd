extends Node2D

const FLOOR = [464, 258, 33]
var task = null
var move_direction = null
	

func _process(_delta: float) -> void:
	if task and $Timer.is_stopped():
		if position.y < FLOOR[task - 1]:
			position.y += 1
			move_direction = 'down'
		elif position.y > FLOOR[task - 1]:
			position.y -= 1
			move_direction = 'up'
		else:
			move_direction = 'stop'
			$Timer.start()


func _on_timer_timeout() -> void:
	$"..".floor_tasks.erase(task)
	$"..".elevator_tasks.erase(task)
	move_direction = null
	task = null
