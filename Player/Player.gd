extends CharacterBody2D

const ACCELERATION = 500;
const MAX_SPEED = 80;
const FRICTION = 500;

@onready var animationPlayer = $AnimationPlayer;

func _physics_process(delta):
	var input_vector = Vector2.ZERO;
	
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left");
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up");
	input_vector = input_vector.normalized();
	
	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			animationPlayer.play("RunRight");
		else:
			animationPlayer.play("RunLeft");
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta);
	else:
		animationPlayer.play("IdleRight");
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta);
		
	move_and_slide();
