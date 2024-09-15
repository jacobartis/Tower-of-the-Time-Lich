extends AudioStreamPlayer2D
class_name PitchAudioStreamPlayer2D

@export var max_pitch:float = 1.3
@export var min_pitch:float = .7

func play_pitched():
	pitch_scale = randf_range(max_pitch,min_pitch)
	play()
