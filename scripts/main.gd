extends Node2D

var floor_tasks = []
var ELEVATORS = []
var FLOORS = []

func  _ready() -> void:
	
	for e in get_children():
		if 'Elevator' in e.name:
			ELEVATORS.append(e)
	print(ELEVATORS)
#var floors = []
#
#func _ready() -> void:
	for e in ELEVATORS:
			print(e.task, not e.task)
	#for child in get_children():
		#if child.name.find('Floor') != -1:
			#floors.append(child)
	#print(floors)

func _process(_delta: float) -> void:
	if len(floor_tasks) != 0:
		for e in ELEVATORS:
			print(e.task, not e.task)
			if not e.task:
				e.task = floor_tasks[-1]
				floor_tasks.remove_at(-1)
				break
	$Label.text = "{tasks}".format({'tasks': floor_tasks})
