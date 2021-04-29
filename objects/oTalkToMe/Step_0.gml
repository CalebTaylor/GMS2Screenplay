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


	    if chosenBranch == "Branch 1." {
			script_execute(Branch, id, branch1);
      
      //custom behavior for branch 1 here
      
	    } 
	
		if chosenBranch == "Branch 2." {
			script_execute(Branch, id, branch2);
            
      //custom behavior for branch 1 here
      
	    }
	
	    if chosenBranch == "Branch 3." {
			script_execute(Branch, id, branch3);
            
      //custom behavior for branch 1 here
      
	    } 
	
		if chosenBranch == "Branch 4." {
			script_execute(Branch, id, branch4);
            
      //custom behavior for branch 1 here
      
		
		}
}


	if ((keyboard_check_pressed(ord("X")))) {
		if screenplay[counter][1] == "TERMINATE"{//end behaviour
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

