extends Node2D
## Base de tour défensive pour les futures scènes de combat.
@export var attack_range: float = 150.0
@export var damage: float = 15.0
@export var cooldown: float = 1.0
var cooldown_left: float = 0.0

func _process(delta: float) -> void:
    cooldown_left = maxf(0.0, cooldown_left - delta)

func can_attack() -> bool:
    return cooldown_left <= 0.0

func mark_attack() -> void:
    cooldown_left = cooldown
