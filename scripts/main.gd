extends Node2D

var floor_tasks = []
var elevator_tasks = []
#var floors = []
#
#func _ready() -> void:
	#for child in get_children():
		#if child.name.find('Floor') != -1:
			#floors.append(child)
	#print(floors)

func _process(_delta: float) -> void:
	if len(floor_tasks) != 0 and not $Elevator.task:
		floor_tasks.sort()
		$Elevator.task = floor_tasks[-1]
	$Label.text = "{tasks}".format({'tasks': floor_tasks})
