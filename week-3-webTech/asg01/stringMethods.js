//The length property returns the length of a string:
let txt = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
let length = txt.length;

/*slice() extracts a part of a string and returns the extracted part in a new string.
The method takes 2 parameters: the start position, and the end position (end not included).
This example slices out a portion of a string from position 7 to position 12 (13-1):*/
let str = "Apple, Banana, Kiwi";
let part = str.slice(7, 13);