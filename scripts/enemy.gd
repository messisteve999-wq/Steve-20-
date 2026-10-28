extends Node2D
## Base simple pour les ennemis à intégrer à une future scène de combat.
@export var max_health: float = 100.0
@export var speed: float = 50.0
var health: float

func _ready() -> void:
    health = max_health

func take_damage(amount: float) -> void:
    health -= amount
    if health <= 0:
        queue_free()
