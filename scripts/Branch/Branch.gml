function Branch(identification, branch){
var tempArray = identification.screenplay;
var tempArrayEnd = [];


		array_copy(tempArrayEnd, 0, identification.screenplay, identification.counter, array_length_1d(identification.screenplay));
		array_copy(tempArray, identification.counter, branch, 0, array_length_1d(branch));
		array_copy(tempArray, identification.counter + array_length_1d(branch), tempArrayEnd, 0, array_length_1d(tempArrayEnd));
		
	identification.screenplay = tempArray;
	identification.chosenBranch = "";

}