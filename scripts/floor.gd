extends Node2D

func _on_button_pressed() -> void:
	if $"..".floor_tasks.find(int(name.split('r')[-1])) == -1:
		$"..".floor_tasks.append(int(name.split('r')[-1]))
		$"..".floor_tasks.sort()
		print($"..".floor_tasks)
