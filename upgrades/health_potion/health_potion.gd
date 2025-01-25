extends Upgrade
class_name HealthPotion

@export var restore_amount: int = 2

func on_add(player: Player) -> void:
	player.health = clampi(player.health + restore_amount, 0, player.max_health)
