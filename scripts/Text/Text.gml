function Text(argument0) {

var counter = argument0.counter;
var screenplay = argument0.screenplay;


					   //if normal dialogue
					   if (typeof(screenplay[counter][1]) == "string" ){
							var inst = instance_create_depth(screenplay[counter][0].x, screenplay[counter][0].y-64, -10000, oText);
							with (inst) {
						    actor = screenplay[counter][0]
							text = screenplay[counter][1];
					   }
						//if there's a dialogue choice
					  } else if (typeof(screenplay[counter][1]) == "array" ) {
							var inst = instance_create_depth(screenplay[counter][0].x, screenplay[counter][0].y-64, -10000, oChoice);
							with (inst) {
						    director = screenplay[0][0]
							menu = screenplay[counter][1]
							menu_items = array_length_1d(screenplay[counter][1]);
							menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items);
					   }
				   


}
}
