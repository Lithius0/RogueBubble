extends Resource
class_name Upgrade

@export var upgrade_name: String = ""
@export var icon: Texture2D
@export var description: String = ""
var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func on_add(player: Player) -> void:
	self.player = player

func on_hit(damage: int, upgrade_stack: Array[Upgrade]) -> int:
	return damage
	
func on_move(movement: Vector2, upgrade_stack: Array[Upgrade]) -> Vector2:
	return movement
