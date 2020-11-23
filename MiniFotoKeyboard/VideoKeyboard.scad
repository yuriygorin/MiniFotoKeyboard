
Number_of_bottons_in_row = 2;
Number_of_bottons_in_cow = 3;

KeyPad_Type = 16; // 16 - 4x4 type; 12 - 4x3 type

Bottoms_step_mm = 2.54;
Vert_distance_steps = 8 * Bottoms_step_mm;
Horz_distance_steps = 7 * Bottoms_step_mm;

translate([-3*Horz_distance_steps - 35, -Vert_distance_steps*2,0])
for (x =[1:Number_of_bottons_in_row])
    for (y =[1:Number_of_bottons_in_cow])
    { 
        translate([x*Horz_distance_steps, y*Vert_distance_steps,0])
            rotate([0, 0, 90])
                import("Tact_with_head.stl");
    }

if (KeyPad_Type == 16)
{
    translate([0, 0,0])
        rotate([90, 0, 0])
            import("KeyPad_4x4.stl");    
}

if (KeyPad_Type == 12)
{
    translate([80, 30,0])
            import("KeyPad_4x3.stl");    
}
translate([35+10+10, Vert_distance_steps,0])
    scale([20,20,20])
        import("Therm-encode-knob.stl");   
translate([35+10+10, -Vert_distance_steps,0])
    scale([20,20,20])
        import("Therm-encode-knob.stl");  
translate([35, 60,0])
    import("Knob.stl");
translate([-35, 60,0])
    import("Knob.stl");

translate([-2*Horz_distance_steps -35 -6, 35,-2])
        rotate([90, 0, 0])
    import("Breadboard.STL");
