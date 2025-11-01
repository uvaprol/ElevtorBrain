extends Node2D

var task = null
const FLOOR = [464, 258, 33]
	

func _process(_delta: float) -> void:
	if task and $Timer.is_stopped():
		if position.y < FLOOR[task - 1]:
			position.y += 1
		elif position.y > FLOOR[task - 1]:
			position.y -= 1
		else:
			$Timer.start()


func _on_timer_timeout() -> void:
	$"..".FLOOR_tasks.erase(task)
	$"..".elevator_tasks.erase(task)
	task = null
