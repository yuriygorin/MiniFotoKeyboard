// По середине либо есть мембранная клавиатура на 16, либо на 12, либо нет совсем мемранной клавиатуры
KeyPad_Type = 2;// 0-No Pad, 1-3x4KeyPad, 2-4x4KeyPad

KeyPad_Horz_dimentions = [0, 27,   34.5];
KeyPad_Vert_dimentions = [0, 38.5, 39  ];
KeyPad_STL_FileName    = ["","KeyPad_4x3.stl","KeyPad_4x4.stl"];
KeyPad_STL_Rotate      = [0,0,90];

translate([0,0,0])
    rotate([KeyPad_STL_Rotate[KeyPad_Type], 0, 0])
        import(KeyPad_STL_FileName[KeyPad_Type]); 
        
// Раздельные кнопки сбоку. Если кнопок нет, то и платы нет. Если от 1 до 6, то маленькая плата. Если от 7 до 9, то плата побольше.
Keys_count = 4; 

// Стратегия расстановки кнопок. 
// х х  х х  х 3  х 3  х 3  6 3  |  х 6 3  х 6 3  9 6 3 
// х 1  х 1  х 1  4 1  4 1  4 1  |  х 4 1  8 4 1  8 4 1 
// х х  х 2  х 2  х 2  5 2  5 2  |  7 5 2  7 5 2  7 5 2 

Bottoms_step_mm = 2.54;
Vert_distance_steps = 8 * Bottoms_step_mm;
Horz_distance_steps = 7 * Bottoms_step_mm;
Space = 10;
translate([-Space - KeyPad_Horz_dimentions[KeyPad_Type], 0, 0]) 
{
    if ((Keys_count <= 6) &&  (Keys_count > 0 ))
    {
        translate ([ -30/2 - Horz_distance_steps/2,  70/2,  0]) 
            rotate([90, 0, 0]) 
                import("Breadboard.STL");}
        
    if ((Keys_count <= 9) &&  (Keys_count > 6 ))
    {
        translate ([-70/2 - Horz_distance_steps/2,,  -70/2,  0]) 
            rotate([90, 0, 0]) 
                import("Breadboard_5x7.stl");}
    
    
    if (Keys_count >= 1) {translate ([                      0,                    0,  0]) rotate([0, 0, 90]) import("Tact_with_head.stl");}
    if (Keys_count >= 2) {translate ([                      0, -Vert_distance_steps,  0]) rotate([0, 0, 90]) import("Tact_with_head.stl");}
    if (Keys_count >= 3) {translate ([                      0,  Vert_distance_steps,  0]) rotate([0, 0, 90]) import("Tact_with_head.stl");}
    if (Keys_count >= 4) {translate ([   -Horz_distance_steps,                    0,  0]) rotate([0, 0, 90]) import("Tact_with_head.stl");}
    if (Keys_count >= 5) {translate ([   -Horz_distance_steps, -Vert_distance_steps,  0]) rotate([0, 0, 90]) import("Tact_with_head.stl");}
    if (Keys_count >= 6) {translate ([   -Horz_distance_steps,  Vert_distance_steps,  0]) rotate([0, 0, 90]) import("Tact_with_head.stl");}
    if (Keys_count >= 7) {translate ([ -2*Horz_distance_steps,                    0,  0]) rotate([0, 0, 90]) import("Tact_with_head.stl");}
    if (Keys_count >= 8) {translate ([ -2*Horz_distance_steps, -Vert_distance_steps,  0]) rotate([0, 0, 90]) import("Tact_with_head.stl");}
    if (Keys_count >= 9) {translate ([ -2*Horz_distance_steps,  Vert_distance_steps,  0]) rotate([0, 0, 90]) import("Tact_with_head.stl");}
}    

Knob_radius = 10;

translate([ KeyPad_Horz_dimentions[KeyPad_Type], KeyPad_Vert_dimentions[KeyPad_Type] + Knob_radius + Space, 0])
    import("Knob.stl");
translate([ -KeyPad_Horz_dimentions[KeyPad_Type], KeyPad_Vert_dimentions[KeyPad_Type] + Knob_radius + Space, 0])
    import("Knob.stl");

//translate([35+10+10, Vert_distance_steps,0])
//    scale([20,20,20])
//        import("Therm-encode-knob.stl");   
//translate([35+10+10, -Vert_distance_steps,0])
//    scale([20,20,20])
//        import("Therm-encode-knob.stl");  

//
//translate([-2*Horz_distance_steps -35 -6, 35,-2])
//        rotate([90, 0, 0])
//    import("Breadboard.STL");
