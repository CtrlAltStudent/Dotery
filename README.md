# Dotery


Startowy projekt **2D dungeon survival RPG** w klimacie pixel art. Repo: [CtrlAltStudent/Dotery](https://github.com/CtrlAltStudent/Dotery).

## Dlaczego Godot 4

- Silny moduł **2D**, wygodne **sceny** i **sygnały** — dobry podział pracy: Ty (logika), znajomy (grafika w `assets/`).
- **Bez licencji** dla engine’u, mały rozmiar, szybkie iteracje.
- **Pixel-perfect**: w `project.godot` ustawione `canvas_items` + filtr tekstur **Nearest** oraz rozdzielczość bazowa **640×360** (skalowanie całkowite).

## Wymagania

- [Godot 4.2+](https://godotengine.org/download) (zalecane 4.3 lub nowsze).
- Otwórz w edytorze folder z `project.godot` jako projekt.

## Sterowanie (domyślne)

| Wejście | Akcja |
|----------|--------|
| **WASD** | Ruch |
| **Spacja** | Dash |
| **Mysz** | Kierunek celowania (obrót „pivota” broni + podgląd linii) |
| **LPM** | `primary_fire` — na razie zarezerwowane pod atak |
| **PPM** | `secondary_action` — zarezerwowane |

Mapa akcji jest dokładana przy starcie przez `core/input_bootstrap.gd` (autoload), żeby nie konfigurować ręcznie przy klonowaniu repozytorium.

## Struktura (na start)

```
core/           — autoloady i wspólna infrastruktura (np. input)
scenes/         — sceny (.tscn), m.in. main, player
scripts/        — logika (GDScript)
assets/sprites/ — sprite’y od grafika
assets/tilesets/
assets/audio/
```

## Następne sensowne etapy

1. **TileMap** + kolizje ścian (warstwa `world` już nazwana w ustawieniach fizyki).
2. **Animacje** (`AnimatedSprite2D` / `AnimationPlayer`) zamiast prostokąta gracza.
3. **Wróg + prosty stan zdrowia**, pętla fali / pokój po pokoju.
4. **UI**: pasek życia, minimapa, ekwipunek.
5. **Audio**: `AudioStreamPlayer2D` pod kroki i walkę.

Masz już grupę `player` na postaci — AI mogą szukać `get_tree().get_first_node_in_group("player")`.

## Licencja

Ustalcie w zespole (np. MIT) przed pierwszym publicznym releasem.

Startup 2d game project

