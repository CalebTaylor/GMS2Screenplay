# "Screenplay"
##A native, script-driven, branching dialogue/narrative system for GMS:2

I wanted to make a script-driven, branching-capable dialogue system with the ability to easily trigger in-game changes in real time. I wanted to optimize the script-to-game pipeline as much as possible while using native GMS:2 code and functionality with no outside libraries or dependencies.


This is the function behind the branching, labled under Scripts/Dialogue/Branch:
```
function Branch(identification, branch){
var tempArray = identification.screenplay;
var tempArrayEnd = [];


		array_copy(tempArrayEnd, 0, identification.screenplay, identification.counter, array_length_1d(identification.screenplay));
		array_copy(tempArray, identification.counter, branch, 0, array_length_1d(branch));
		array_copy(tempArray, identification.counter + array_length_1d(branch), tempArrayEnd, 0, array_length_1d(tempArrayEnd));
		
	identification.screenplay = tempArray;
	identification.chosenBranch = "";

}

```
This script takes the trunk dialogue option, the indicated branch, and stitches them together at the correct/current point in the screenplay. This constructs a larger array of strings, now with the branch and its lines, choices, and end behaviour included.

Then in the object that handles the choices being made, this if-statement handles the changing of game state, branching, and any other behavior you want to define. Here's an example, found in the Objects/Dialogue/oTalkToMe:

```
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

```
