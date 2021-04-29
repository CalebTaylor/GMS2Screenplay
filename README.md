# "Screenplay"
A native, script-driven, branching dialogue/narrative system for GMS:2

I wanted to make a script-driven, branching-capable dialogue system with the ability to easily trigger in-game changes in real time. I wanted to optimize the script-to-game pipeline as much as possible while using native GMS:2 code and functionality with no outside libraries or dependencies.

The screenplay's syntax behind the whole system looks something like this, placed in the actor object's creation code:

```
branch1 = [
	[oTalkToMe95, "Very well. This is branch 1."],
	[oPlayer, "You're sure this is branch 1?"],
	[oTalkToMe95, "I'm sure it's branch 1."],
	[oTalkToMe95, "Wait, one more branch to test."],
	[oPlayer, ["Branch 3.", "Branch 4."]],
	[oTalkToMe95, "Let's come back to branch 1."],
]

branch2 = [
	[oTalkToMe95, "Cool. Branch 2 it is."],
	[oPlayer, "I've never been to branch 2."],
	[oTalkToMe95, "Enjoy it, we're joining trunk soon."],
	[oTalkToMe95, "Wait, one more branch to test."],
	[oPlayer, ["Branch 3.", "Branch 4."]],
	[oTalkToMe95, "Let's come back to branch 2."],
]

branch3 = [
	[oTalkToMe95, "Are you kidding? Branch 3 works?"],
	[oPlayer, "This looks like branch 3 doesn't it?"],
	[oTalkToMe95, "I guess so"],
	[oPlayer, "Let's leave branch 3, then."]
]

branch4 = [
	[oTalkToMe95, "Dude, branch 4."],
	[oPlayer, "I know."],
	[oTalkToMe95, "Let's test custom end behavior."],
	[oPlayer, "TERMINATE"]
]

screenplay = [
    [oTalkToMe95],
    [oTalkToMe95, "Let's test auto-advance for a moment."],
    [oPlayer, "And object switching?"],
    [oTalkToMe95, "Sure, that too."],
    [oTalkToMe95, "Now let's test branching. Which branch do you want?"],
    [oPlayer, ["Branch 1.", "Branch 2."]],
    [oTalkToMe95, "Well, hope you enjoyed whatever branch that was."],
    [oPlayer, "I did, thank you."],
    [oTalkToMe95, "We'll get variable changes soon."],
    [oPlayer, "Sounds good."],
    [oTalkToMe95, "Did you like the second batch of branches?"],
    [oPlayer, "Yeah man."],
    [oTalkToMe95, "Lets see if this works till the end."],
    [oTalkToMe95, "RESTART"]
]


counter = 1;
chosenBranch = "";
alive = true;
alert = true;
vision = 150;
breathing = false;
```
For a breakdown of the syntax of the following line:

"[oTalkToMe95, "Wait, one more branch to test."],"

The first item, the object, refers to the actor saying the line. This is passed to the "oText" object to indicate which object to draw the textbox over. The second item, the string, is the line being spoken. If there are two or more strings, the oChoice object is drawn allowing the player to select a dialogue option. This will then trigger the branching script. The branch variables, declared above as branch1, branch2, etc. are used to join with the trunk variable screenplay.

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
