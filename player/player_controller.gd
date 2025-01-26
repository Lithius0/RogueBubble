extends CharacterBody2D
class_name Player

signal upgrade_added()

@export var speed = 1
@export var health: float = 3.0:
	set(value):
		health = value
		update_health_bar()
@export var max_health: float = 3.0:
	set(value):
		max_health = value
		update_health_bar()
@export var health_bar: ColorRect
@export var upgrade_icons: Array[Button] = []
@export var upgrades: Array[Upgrade] = []
@export var upgrade_pool: Array[Upgrade] = []

var upgrade_shop: Array[Upgrade] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_health_bar()
	unshow_uprades()
	for i in upgrade_icons.size():
		var icon = upgrade_icons[i]
		icon.pressed.connect(upgrade_pressed.bind(i))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var movement = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	movement *= delta
	movement *= speed
	var upgrade_stack: Array[Upgrade] = []
	for upgrade in upgrades:
		movement = upgrade.on_move(movement, upgrade_stack)
		upgrade_stack.append(upgrade)
	move_and_collide(movement)
	
func upgrade_pressed(index: int) -> void:
	var upgrade = upgrade_shop[index]
	upgrade.on_add(self)
	upgrades.append(upgrade)
	upgrade_added.emit()
	unshow_uprades()
	
func update_health_bar():
	if not is_instance_valid(health_bar):
		return
		
	health_bar.scale = Vector2(clamp(float(health) / max_health, 0.0, 1.0), 1.0)
	
func hit(damage: int) -> void:
	var upgrade_stack: Array[Upgrade] = []
	for upgrade in upgrades:
		damage = upgrade.on_hit(damage, upgrade_stack)
		upgrade_stack.append(upgrade)
	health -= damage
	return
	
func show_upgrades() -> void:
	upgrade_shop.resize(upgrade_icons.size())
	for i in upgrade_icons.size():
		var upgrade_icon = upgrade_icons[i]
		var upgrade: Upgrade = upgrade_pool.pick_random()
		upgrade_shop[i] = upgrade
		upgrade_icon.icon = upgrade.icon
		upgrade_icon.tooltip_text = upgrade.upgrade_name + "\n" + upgrade.description
		
		upgrade_icon.visible = true
		
func unshow_uprades() -> void:
	for upgrade_icon in upgrade_icons:
		upgrade_icon.visible = false
