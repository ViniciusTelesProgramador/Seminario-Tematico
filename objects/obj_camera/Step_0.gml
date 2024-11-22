/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(instance_exists(Obj_Player)){

	var _target = Obj_Player;
	
	x = lerp(x,_target.x, 0.75);
	y = lerp(y,_target.y,0.75);

	

}

camera_set_view_border(view_camera[0],340,120)