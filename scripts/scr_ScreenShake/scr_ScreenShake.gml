function ScreenShake(_treme = 0){
    
	if(instance_exists(obj_screenShake)){	
		
		//Acessar o objeto screnshake
		with(obj_screenShake){
			if(_treme > treme){
				treme = _treme;	
			}
		}
		//obj_screenShake.treme = _treme;
	}
}