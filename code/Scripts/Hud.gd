extends Control

func _process(_delta):
	$Player_Health.text = str(Global.player_health)
