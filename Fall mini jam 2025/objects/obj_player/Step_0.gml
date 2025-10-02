var hor_mov = keyboard_check(ord("D")) - keyboard_check(ord("A"));


jump = keyboard_check_pressed(vk_space);

if(hor_mov == 0)
    x_vel -= sign(x_vel);
x_vel = clamp(x_vel + hor_mov, -MIN_X_VEL, MIN_X_VEL);

y_vel += GRAV - JUMP_FORCE * jump;

var _qinst = instance_place(x, y, obj_qblock);
if(place_meeting(x, y + 1, obj_qblock) && _qinst.bbox_bottom + _qinst.y < bbox_top + y) {
    with(_qinst) {
        instance_create_depth(x + 32, y + 64, depth - 1, obj_mushroom)
    }
}



if(place_meeting(x + x_vel, y, obj_wall) && x_vel != 0) {
    while(place_meeting(x, y, obj_wall)) {
        x -= sign(x_vel) * .1;
    }
    
    x_vel = 0;
}

x += x_vel;

if(place_meeting(x, y + y_vel, obj_wall) && y_vel != 0) {
    while(place_meeting(x, y, obj_wall)) {
        y -= sign(y_vel) * .1;
    }
    
    y_vel = 0;
}

y += y_vel;