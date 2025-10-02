if(!realr) {
    y--;
    if(y == o_y - 64)
        realr = true;
} else {
    
    x_vel = clamp(x_vel + val, -MIN_X_VEL, MIN_X_VEL);
    
    y_vel += GRAV;
    
    
    
    if(place_meeting(x + x_vel, y, obj_wall) && x_vel != 0) {
        while(place_meeting(x, y, obj_wall)) {
            x -= sign(x_vel) * .1;
        }
        
        x_vel = 0;
        val = -val;
    }
    
    x += x_vel;
    
    if(place_meeting(x, y + y_vel, obj_wall) && y_vel != 0) {
        while(place_meeting(x, y, obj_wall)) {
            y -= sign(y_vel) * .1;
        }
        
        y_vel = 0;
    }
    
    y += y_vel;
    
    if(place_meeting(x, y, obj_player)) {
        obj_player.image_yscale += 0.25;
        instance_destroy();
    }
}