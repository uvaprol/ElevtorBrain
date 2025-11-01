extends Node2D

var task = null
const floor = [464, 258, 33]
	

func _process(delta: float) -> void:
	if task and $Timer.is_stopped():
		if position.y < floor[task - 1]:
			position.y += 1
		elif position.y > floor[task - 1]:
			position.y -= 1
		else:
			$Timer.start()


func _on_timer_timeout() -> void:
	$"..".floor_tasks.erase(task)
	$"..".elevator_tasks.erase(task)
	task = null
