// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Breathe(argument0){
	var actor = argument0;
    var i;
    for (i = 0; i < 10000; i += 1) {
        if i == 9999 {
            if (random(100) >= 99) {
                repeat(1) {
					if layer_exists("Actors") {
						with(instance_create_layer(actor.bbox_right, actor.bbox_top, "Actors", oBreath)) {

						}
					}
                }
            }

        }
    }
}