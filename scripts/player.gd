extends CharacterBody2D
## Sterowanie: WASD (akcje move_*), Spacja — dash, mysz — kierunek celowania, LPM — pod przyszły atak.

@export var move_speed: float = 140.0
@export var dash_speed: float = 380.0
@export var dash_duration: float = 0.12
@export var dash_cooldown: float = 0.38
@export var aim_line_max_length: float = 96.0

var _dash_time_left: float = 0.0
var _dash_cd_left: float = 0.0
var _dash_dir: Vector2 = Vector2.RIGHT


func _ready() -> void:
	add_to_group(&"player")


func _physics_process(delta: float) -> void:
	_tick_timers(delta)

	var move_input := Input.get_vector(&"move_left", &"move_right", &"move_up", &"move_down")
	var aim_world := get_global_mouse_position() - global_position

	_handle_dash_input(move_input, aim_world)

	var speed := move_speed
	var desired_dir := move_input
	if _dash_time_left > 0.0:
		speed = dash_speed
		desired_dir = _dash_dir

	if desired_dir.length_squared() > 1.0:
		desired_dir = desired_dir.normalized()

	velocity = desired_dir * speed
	move_and_slide()

	_update_pivot_and_aim_visual(aim_world)
	_handle_primary_fire()


func _tick_timers(delta: float) -> void:
	if _dash_time_left > 0.0:
		_dash_time_left = maxf(0.0, _dash_time_left - delta)
	if _dash_cd_left > 0.0:
		_dash_cd_left = maxf(0.0, _dash_cd_left - delta)


func _handle_dash_input(move_input: Vector2, aim_world: Vector2) -> void:
	if _dash_cd_left > 0.0 or _dash_time_left > 0.0:
		return
	if not Input.is_action_just_pressed(&"dash"):
		return

	var toward_mouse := aim_world.normalized() if aim_world.length_squared() > 0.0001 else Vector2.RIGHT
	_dash_dir = move_input.normalized() if move_input.length_squared() > 0.0001 else toward_mouse
	_dash_time_left = dash_duration
	_dash_cd_left = dash_cooldown


func _update_pivot_and_aim_visual(aim_world: Vector2) -> void:
	var pivot: Marker2D = $WeaponPivot
	pivot.rotation = aim_world.angle()

	var line: Line2D = $AimLine
	var len := minf(aim_line_max_length, aim_world.length())
	var dir := aim_world.normalized() if aim_world.length_squared() > 0.0001 else Vector2.RIGHT
	line.points = PackedVector2Array(Vector2.ZERO, dir * len)


func _handle_primary_fire() -> void:
	if not Input.is_action_just_pressed(&"primary_fire"):
		return
	# Tu później: strzał / melee / użycie przedmiotu w kierunku WeaponPivot.
	pass
