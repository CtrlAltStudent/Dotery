# Dotery

Early-stage **2D dungeon survival RPG** in a pixel art style. Repository: [CtrlAltStudent/Dotery](https://github.com/CtrlAltStudent/Dotery).

We are a small team: **gameplay and code** on one side, **assets and animation** on the other (international collaboration — README and code comments default to English so everyone can follow along).

## Why Godot 4

- Strong **2D** tooling, **scenes**, and **signals** — a clean split of work: logic in `scripts/` and `scenes/`, art drops into `assets/`.
- **No engine licensing fees**, small footprint, fast iteration.
- **Pixel-friendly setup** in `project.godot`: `canvas_items` stretch, **Nearest** texture filter, base resolution **640×360**, integer scaling.

## Requirements

- [Godot 4.2+](https://godotengine.org/download) (4.3 or newer recommended).
- Open the folder that contains `project.godot` as a project in the editor.

## Default controls

| Input | Action |
|--------|--------|
| **WASD** | Move |
| **Space** | Dash |
| **Mouse** | Aim direction (weapon pivot rotation + aim preview line) |
| **LMB** | `primary_fire` — reserved for attacks |
| **RMB** | `secondary_action` — reserved |

Input actions are registered at startup by `core/input_bootstrap.gd` (autoload) so clones work without manual Project Settings input mapping.

## Project layout

```
core/           — autoloads and shared infrastructure (e.g. input)
scenes/         — scenes (.tscn), including main and player
scripts/        — gameplay logic (GDScript)
assets/sprites/ — character and world sprites
assets/tilesets/
assets/audio/
```

## Sensible next steps

1. **TileMap** + wall collisions (physics layer `world` is already named in project settings).
2. **Animation** (`AnimatedSprite2D` / `AnimationPlayer`) instead of the placeholder player shape.
3. **Enemy + simple health**, wave loop / room-by-room flow.
4. **UI**: health bar, minimap, inventory.
5. **Audio**: `AudioStreamPlayer2D` for footsteps and combat.

The player is already in the `player` group — AI can use `get_tree().get_first_node_in_group("player")`.

## License

Pick one as a team (e.g. MIT) before the first public release.
