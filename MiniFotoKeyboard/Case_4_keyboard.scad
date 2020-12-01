
// для проектирования корпуса мне не нужна прорисованная 3д модель кнопок и прочего, мне нужны координаты и размеры отверстий для кнопок.
//  найденные мной 3д модели слишком тяжелые для обработки

// Нужно ли понижуние под клавиатуру, чтоб она туда утопала или достаточно просто наклеить сверху. Такое понижение усложняет печать, так как лицевая сторона должна прилегать к печатному столу  3д принтера. А если перевернуть модель при печати, то вся внутренняя полость будет занята поддержками, задолбаюсь их удалять.


//размеры лицевой панели зависят от содержания


//пленочная клавиатура вклеивается в понижение на корпусе, шлейф через отверстие проводится внутрь.
KeyPad_Vert_size = 77; // высота клавиатуры
KeyPad_Horz_size = 69; // ширина клавиатуры
KeyPad_Z_size = 0.85;  // толщина клавиатуры
// не смог найти или измерить радиусы скругления углов клавиатуры, по этому будет квадратное отверстие под клавиатуру
KeyPad_Wire_size = 22; // ширина отверстия для шлейфа от клавы к ардуино

//Энкодеры крепятся в отверстия и фиксируются гайками. Большие и малые энкодеры не отличаются по способу крепления к корпусу.
Encoder_Hole_size_diam = 5;

//Отдельные клавиши припаиваются сначала к печатной плате, потом плата ставится на стойки внутри корпуса и фиксируется винтами. Кнопки должны торчать наружу креплениями шляпок через отверстия в корпусе. На эти крепления с наружней стороны устанавливаются шляпки кнопок.    Важно не ошибиться с высотой стоек, чтобы в отпущенном положении сама кнопка не упиралась в корпус, а в нажатом полодении хватало расстояния дляшляпки, чтоб прожать кнопку и не упереться в корпус снаружи.



difference()
{
translate([-50,-40,-2]) cube([100, 80,2]); 
cube([KeyPad_Horz_size,KeyPad_Horz_size,KeyPad_Z_size],center=true);
}