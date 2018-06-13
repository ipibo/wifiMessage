public String convertStringToHex(String str) {
  char[] chars = str.toCharArray();
  StringBuffer hex = new StringBuffer();

  for (int i = 0; i < chars.length; i++) {
    hex.append(Integer.toHexString((int)chars[i]));
  }
  return hex.toString();
}

public String convertHexToString(String hex) {

  hex = hex.replaceAll("\\s+", "");

  StringBuilder sb = new StringBuilder();
  StringBuilder temp = new StringBuilder();

  //49204c6f7665204a617661 split into two characters 49, 20, 4c...
  println((hex.length()-1)%2);
  if ((hex.length()-1)%2 == 0) {
    for ( int i=0; i<hex.length()-1; i+=2 ) {

      //grab the hex in pairs
      String output = hex.substring(i, (i + 2));
      //convert hex to decimal
      int decimal = Integer.parseInt(output, 16);
      //convert the decimal to character
      sb.append((char)decimal);

      temp.append(decimal);
    }

    return sb.toString();
  } else {

    println((hex.length()-2)%2);
    if ((hex.length()-2)%2 == 0) {
      println("oh dit wel");
      for ( int i=0; i<hex.length()-2; i+=2 ) {
        //grab the hex in pairs
        String output = hex.substring(i, (i + 2));
        //convert hex to decimal
        int decimal = Integer.parseInt(output, 16);
        //convert the decimal to character
        sb.append((char)decimal);
        temp.append(decimal);
      }

      return sb.toString();
    } else {
      return "foutje";
    }
  }
}

int sizeOfSegment = 12;
PrintWriter output;

void setup() {  
  output = createWriter("allSubstrings.txt"); 

  String hexString = convertStringToHex("CHANGE THIS");
  
  
  char[] hexChar = hexString.toCharArray();
  int lengthOfCharArray = hexChar.length;
  int numberOfSegments;

  if (lengthOfCharArray%sizeOfSegment == 0) { //check if the segments fit nice into the charArray
    numberOfSegments = lengthOfCharArray/sizeOfSegment;
  } else {
    numberOfSegments = (lengthOfCharArray/sizeOfSegment) + 1; // if not, add another segment.
  }

  String[] subStrings = new String[numberOfSegments]; //all of the substrings
  String thisSubString = "";  
  int subStringCounter = 0;

  for (int i = 1; i < hexChar.length; i++) {

    thisSubString = thisSubString + hexChar[i-1];

    // every sizeOfSegment number of characters do this.
    if (i%sizeOfSegment == 0 ) {
      subStrings[subStringCounter] = ":/pF-"+subStringCounter+"-"+thisSubString;
      subStringCounter++;
      thisSubString = "";
    }

    //for the last character
    if (i == hexChar.length-1) { 
      int numOfWhitespace = sizeOfSegment-thisSubString.length();
      //println(numOfWhitespace);

      for (int j = 0; j < numOfWhitespace; j++) {
        if (j == 0 ) {
          thisSubString = thisSubString + "1";
        } else {
          thisSubString = thisSubString + " ";
        }
      }

      subStrings[subStringCounter] = ":/pF-"+subStringCounter+"-"+thisSubString;
      
    }
  }
  // for every String in the subStrings

  String allCombined = "";

  int smallCounter = 0;
  for ( String s : subStrings) {  
    //output.println(s); // Write the coordinate to the file
    //println(s);

    smallCounter++;
    if (smallCounter != subStrings.length) {
      allCombined = allCombined + "\"" + s + "\",";
    } else {
      allCombined = allCombined + "\"" + s + "\"";
    }
  }
  //output.println(subStrings);
  println(allCombined);
  output.println(allCombined);

  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file

  //println(convertHexToString("73686f7274206d65737361676561        "));
  exit(); // Stops the program
}

void draw() {
}
