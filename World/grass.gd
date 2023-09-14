extends Node2D

func create_grass_effect():
	var grassEffectScene = load("res://Effects/grass_effect.tscn");
	var grassEffect = grassEffectScene.instantiate();
	
	var main = get_tree().current_scene;
	
	grassEffect.global_position = global_position;
	
	main.add_child(grassEffect);

func _on_hurtbox_area_entered(area):
	create_grass_effect();	
	queue_free();
