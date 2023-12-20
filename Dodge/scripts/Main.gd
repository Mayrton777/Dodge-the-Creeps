extends Node

export (PackedScene) var Enemy

var score


func _ready():
	randomize()


# cria um novo jogo zerando os pontos
func new_game():
	score = 0
	$Player.start($PositionStart.position)
	$StartTimer.start()
	$HUD.display_message("Get ready!")
	$HUD.update_score(score)
	$Music.play()


# da inicio ao jogo
func start_game():
	$EnemiesTimer.start()
	$PointTimer.start()


# finaliza o jogo
func game_over():
	$PointTimer.stop()
	$EnemiesTimer.stop()
	$HUD.display_gameover()
	$Music.stop()
	$DeathMusic.play()


# Incrementa a variavel score em 1 para a pontuação
func _on_PointTimer_timeout():
	score += 1
	$HUD.update_score(score)


# Função para o spawn de inimigos
func _on_EnemiesTimer_timeout():
	$PathEnemy/SpawnEnemy.offset = randi()
	var enemy = Enemy.instance()
	add_child(enemy)
	var direction = $PathEnemy/SpawnEnemy.rotation + PI/2
	enemy.position = $PathEnemy/SpawnEnemy.position
	direction += rand_range(-PI / 4, PI / 4)
	enemy.rotation = direction
	enemy.linear_velocity = Vector2(rand_range(enemy.min_speed, enemy.max_speed), 0)
	enemy.linear_velocity = enemy.linear_velocity.rotated(direction)

