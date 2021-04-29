//Parent behaviour, edit for children based on their script
if (nearby) {
	if alert {
				if alive{
		    script_execute(Text, id);
			counter++;
			}
			alert = false;
	}
//Branching dialogue/changing game behavior
	if chosenBranch != "" {


	    if chosenBranch == "It glows blue." {
			script_execute(Branch, id, branch1);
	    } 
	
		if chosenBranch == "It glows green." {
			script_execute(Branch, id, branch2);
	    }
	
	    if chosenBranch == "It glows yellow." {
			script_execute(Branch, id, branch3);
	    } 
	
		if chosenBranch == "Branch 4." {
			script_execute(Branch, id, branch4);
		
		}
		if chosenBranch == "Branch 4." {
			script_execute(Branch, id, branch4);
		
		}
		if chosenBranch == "Branch 4." {
			script_execute(Branch, id, branch4);
		
		}
		if chosenBranch == "Branch 4." {
			script_execute(Branch, id, branch4);
		
		}
		if chosenBranch == "Branch 4." {
			script_execute(Branch, id, branch4);
		
		}
		if chosenBranch == "Branch 4." {
			script_execute(Branch, id, branch4);
		
		}
	
	}


	if ((keyboard_check_pressed(ord("X")))) {
		if screenplay[counter][1] == "SUICIDE"{//end behaviour
			counter = 1;
			alive = !alive;
		}
	    if counter == array_length_1d(screenplay)-1 {//end behaviour
			if screenplay[counter][1] == "RESTART"{
			counter = 1;
			}

	    } else {
			if alive{//progress through script otherwise
		    script_execute(Text, id);
			counter++;
			}
		}
	}

}

if breathing script_execute(Breathe, id);

