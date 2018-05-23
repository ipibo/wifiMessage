String getTheText(String[] ssid) {

  String fullString = "";
  int allStrings = 0;
  int highest = -1; 

  for ( String s : ssid) {
    if (s != null) {
      if (s.contains("-")) {
        println(s);

        String splitted[] = s.split("-");
        if (splitted[0].equals(":/pF")) {
          if (int(splitted[1]) > highest) {
            highest = int(splitted[1]);
          }
        }
      }
    }
  }

  if (highest > -1) {
    allStrings = highest + 1;


    String[] theMessageArray = new String[allStrings];

    for ( String s : ssid) {
      String splitted[] = s.split("-");
      if (splitted[0].equals(":/pF")) {
        int number = int(splitted[1]);
        String message = splitted[2];
        theMessageArray[number] = message;
      }
      //println(theMessageArray.Contains(":/pF-1-ijne/dag/gewenst!"));
    }

    //println(theMessageArray);
    println(theMessageArray);





    for (String m : theMessageArray) {
      if (m != null) {

        String[] splittedM = m.split("/");
        String thisMessage = "";
        for (String sM : splittedM) {

          if (sM != splittedM[splittedM.length-1]) {
            thisMessage = thisMessage + sM + " ";
          } else if (sM == splittedM[splittedM.length-1]) {
            thisMessage = thisMessage + sM;
          }
        }
        fullString = fullString + thisMessage;
      }
    }


    if (fullString != "") {
      println(fullString);
      return fullString;
    } else {
      println("no message found");
      return "no message found";
    }
  } else {
    return"no message Found";
  }
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
    //System.out.println("Decimal : " + temp.toString());

    return sb.toString();
  } else {
    //return "foutje:" + hex  + "." + (hex.length()-1);
    return "foutje";
  }
}




void setup() {
  //":/pF-1-ijne/dag/gewenst!", ":/pF-1-ijne/dag/gewenst!", 
  //":/pF-0-Hallo/iedereen/een/hele/f", ":/pF-0-Hallo/iedereen/een/hele/f", ":/pF-0-Hallo/iedereen/een/hele/f", 
  //"mees en iep", "yumenator"

  String[] ssida = {

    ":/pF-0-44697420697320696e666f726", 
    ":/pF-1-d617469652064696520696b20", 
    ":/pF-2-656967656e6c696a6b206e696", 
    ":/pF-3-574207a6f752077696c6c656e", 
    ":/pF-4-20766572737072656964656", 

  };


  getTheText(ssida);

  println(convertHexToString(getTheText(ssida)));
}

void draw() {
}
