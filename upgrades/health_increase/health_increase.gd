extends Upgrade
class_name HealthUpgrade

@export var health_increase: int = 1

func on_add(player: Player) -> void:
	player.health += health_increase
	player.max_health += health_increase
