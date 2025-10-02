if(follow != noone){
    x_to = follow.x;
    y_to = follow.y;
}


//lerps the camera towards its target
x += (x_to - x) / cam_lerp;
y += (y_to - y) / cam_lerp;

//prevents the camera from moving outside of the room
x = clamp(x, cam_width/2, room_width - cam_width/2);
y = clamp(y, cam_height/2, room_height - cam_height/2);

//sets the camera's position with the viewport
camera_set_view_pos(view_camera[0], x - (cam_width * 0.5), y - (cam_height * 0.5));