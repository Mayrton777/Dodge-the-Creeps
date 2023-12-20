extends CanvasLayer

# sinal para começar o jogo
signal start_game


func display_message(texto):
	$MessageLabel.text = texto
	$MessageLabel.show()
	$MessageTimer.start()


func display_gameover():
	display_message("End game!")
	yield($MessageTimer, "timeout")
	
	$MessageLabel.text = "Dodge and survive the monsters!"
	$MessageLabel.show()
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()


func update_score(score):
	$ScoreLabel.text = str(score)


func StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")


func MessageTimer_timeout():
	$MessageLabel.hide()

