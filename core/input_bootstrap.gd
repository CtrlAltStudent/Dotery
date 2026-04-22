extends Node
## Rejestruje domyślne akcje wejścia przy pierwszym uruchomieniu (bez ręcznej konfiguracji w edytorze).
## Po zapisaniu projektu w edytorze mapa może zostać zmergowana — wtedy edytuj Input Map w Project Settings.

func _ready() -> void:
	_bind_key_if_missing(&"move_left", KEY_A)
	_bind_key_if_missing(&"move_right", KEY_D)
	_bind_key_if_missing(&"move_up", KEY_W)
	_bind_key_if_missing(&"move_down", KEY_S)
	_bind_key_if_missing(&"dash", KEY_SPACE)
	_bind_mouse_if_missing(&"primary_fire", MOUSE_BUTTON_LEFT)
	_bind_mouse_if_missing(&"secondary_action", MOUSE_BUTTON_RIGHT)


func _bind_key_if_missing(action: StringName, keycode: Key) -> void:
	if not InputMap.has_action(action):
		InputMap.add_action(action)
	if _action_has_key(action, keycode):
		return
	var e := InputEventKey.new()
	e.keycode = keycode
	InputMap.action_add_event(action, e)


func _action_has_key(action: StringName, keycode: Key) -> bool:
	for ev in InputMap.action_get_events(action):
		if ev is InputEventKey and ev.keycode == keycode:
			return true
	return false


func _bind_mouse_if_missing(action: StringName, button: MouseButton) -> void:
	if not InputMap.has_action(action):
		InputMap.add_action(action)
	if _action_has_mouse_button(action, button):
		return
	var e := InputEventMouseButton.new()
	e.button_index = button
	InputMap.action_add_event(action, e)


func _action_has_mouse_button(action: StringName, button: MouseButton) -> bool:
	for ev in InputMap.action_get_events(action):
		if ev is InputEventMouseButton and ev.button_index == button:
			return true
	return false
