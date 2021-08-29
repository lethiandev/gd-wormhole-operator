extends AudioStreamPlayer

export(Array, AudioStream) var streams = []

func play(p_from = 0.0) -> void:
	stream = get_random_audio_stream()
	.play(p_from)

func get_random_audio_stream() -> AudioStream:
	var idx = randi() % streams.size()
	return streams[idx]
