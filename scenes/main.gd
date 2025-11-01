extends Node2D

var floor_tasks = []
var elevator_tasks = []

func _process(_delta: float) -> void:
	if len(floor_tasks) != 0 and not $Elevator.task:
		$Elevator.task = floor_tasks[0]
	$Label.text = "{tasks}".format({'tasks': floor_tasks})
