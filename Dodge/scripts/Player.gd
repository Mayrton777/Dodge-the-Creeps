extends Area2D

# velocidade do jogador
export var speed = 400
# variavel para armazenar o tamanho da tela
var screen_size

signal hit


func _ready():
	# função para esconder o jogador
	hide()
	# pega a variavel e faz ela ser do tamanho da get_viewport(que e definito nas propriedades do projeto)
	screen_size = get_viewport_rect().size


func _process(delta):
	var velocity = Vector2.ZERO
	# entrada para movimentar o player para a direita
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	# entrada para movimentar o player para a esquerda
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	# entrada para movimentar o player para baixo
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	# entrada para movimentar o player para cima
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	# verifica se a velocidade e maior que zero
	if velocity.length() > 0:
		# se sim atualiza a velocidade
		velocity = velocity.normalized() * speed
		# executa a animação
		$AnimatedSprite.play()
		$Trail.emitting = true
	else:
		# para a animação
		$AnimatedSprite.stop()
		$Trail.emitting = false
	# animações
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = velocity.x < 0
		$AnimatedSprite.flip_v = false
		
	if velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0
	
	
	
	# atualiza a posição do personagem
	position += velocity * delta
	# limitando a borda da tela
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disable", true)

