extends Node2D

var task = null
var can_move = true
var FLOORS = []
#var move_direction = null
#var open_on_floor = false
#var open_status = false

func _ready() -> void:
	for f in $"..".get_children():
		if f.name.find('Floor') != -1:
			FLOORS.append(f)
	print(FLOORS[3-1])

func _process(_delta: float) -> void:
	if task and can_move:
		if position.y < FLOORS[task - 1].position.y:
			position.y += 1
			#move_direction = 'down'
		elif position.y > FLOORS[task - 1].position.y:
			position.y -= 1
			#move_direction = 'up'
		else:
			#move_direction = 'stop'
			#open_on_floor = true
			#$AnimatedSprite2D.play('default')
			can_move = false
			FLOORS[task - 1].get_children()[0].play('default')
			#open_status = true
			#$AnimatedSprite2D.play_backwards('default')

func _on_timer_timeout() -> void:
	#$AnimatedSprite2D.play_backwards('default')
	FLOORS[task - 1].get_children()[0].play_backwards('default')
	#open_status = false
	#move_direction = null
	task = null

func move_door() -> void:
	if not can_move:
		$Timer.start()
	else:
		can_move = true
