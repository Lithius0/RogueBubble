extends AnimatableBody2D

@export var target: Node2D
var timer := 5.0
@export var speed := 100.0
var direction := Vector2.UP
var moving := false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_instance_valid(target):
		return
	
	if not moving:
		global_rotation = Vector2.DOWN.angle_to(target.global_position - global_position)
		timer -= delta
		if timer <= 0:
			direction = (target.global_position - global_position).normalized()
			moving = true

func _physics_process(delta: float) -> void:
	if not moving:
		return
	var collision := move_and_collide(direction * speed * delta)
	if not is_instance_valid(collision):
		return
	var collider := collision.get_collider()
	if not is_instance_valid(collider):
		return
		
	if collider is Player:
		var player := collider as Player
		player.hit(1)
	queue_free()

func spawn(player: Player) -> void:
	target = player
	timer = randf_range(3, 5)
