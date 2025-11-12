extends Node2D

var floor_tasks = []
var ELEVATORS = []
var FLOORS = []

func  _ready() -> void:
	for e in get_children():
		if 'Elevator' in e.name:
			ELEVATORS.append(e)

func _process(_delta: float) -> void:
	if len(floor_tasks) != 0:
#TODO решить проблему повторного вызова во время открытых дверей на этаже
		for e in ELEVATORS:
			if not e.task:
				e.task = floor_tasks[-1]
				floor_tasks.remove_at(-1)
				break
	$Label.text = "{tasks}".format({'tasks': floor_tasks})
