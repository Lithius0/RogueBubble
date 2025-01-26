extends Upgrade
class_name Dice

var wobble: bool = false

func on_hit(damage: int, upgrade_stack: Array[Upgrade]) -> int:
	if count_self(upgrade_stack) > 1:
		return damage
	
	match randi_range(1, 6):
		1:
			wobble = not wobble
			return damage
		2: 
			return damage + 1
		3:
			return damage - 1
		4: 
			return 0
		5:
			return damage
		6:
			return damage
	return damage
	
func on_move(movement: Vector2, upgrade_stack: Array[Upgrade]) -> Vector2:
	if wobble:
		return movement + Vector2(randf_range(-1, 1), randf_range(-1, 1))
	return movement
