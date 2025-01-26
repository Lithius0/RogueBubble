extends Upgrade
class_name SpeedUpgrade

@export var speed_multiplier: float = 1.2

func on_move(movement: Vector2, upgrade_stack: Array[Upgrade]) -> Vector2:
	if count_self(upgrade_stack) < 7:
		return movement * speed_multiplier
	else:
		return movement