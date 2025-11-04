extends Node2D

#
var floor_y = []
var task = null
var move_direction = null

func _ready() -> void:
	for child in $"..".get_children():
		if child.name.find('Floor') != -1:
			floor_y.append(child.position.y)
	#floor_y.sort()
	print(floor_y)

func _process(_delta: float) -> void:
	if task and $Timer.is_stopped():
		if position.y < floor_y[task - 1]:
			position.y += 1
			move_direction = 'down'
		elif position.y > floor_y[task - 1]:
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
