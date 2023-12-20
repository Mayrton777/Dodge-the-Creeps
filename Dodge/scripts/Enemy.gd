extends RigidBody2D

# velocidades para os inimigos
export var min_speed = 150
export var max_speed = 300


func _ready():
	# variavel que armazenas os sprites dos inimigos
	var type_enemies = $AnimatedSprite.frames.get_animation_names()
	# cria a lista com os sprites dos inimigos
	$AnimatedSprite.animation = type_enemies[randi() % type_enemies.size()]


func enemy_visibility():
	# limpa a fila
	queue_free()
