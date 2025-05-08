extends Marker2D

@onready var spawn_point = $"/root/level1/spawn point"  # Or use relative path if in the same scene

func respawn():
	position = spawn_point.position
