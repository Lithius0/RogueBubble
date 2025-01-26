extends Resource
class_name Upgrade

@export var upgrade_name: String = ""
@export var icon: Texture2D
@export_multiline var description: String = ""
var player: Player

func count_self(array: Array[Upgrade]) -> int:
	var sum: int = 0
	for item in array:
		if item.upgrade_name == upgrade_name:
			sum += 1
	return sum
		
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
