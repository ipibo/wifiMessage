String getTheText(String[] ssid) {

  String fullString = "";
  int allStrings = 0;
  int highest = -1; 

  for ( String s : ssid) {
    if (s != null) {
      if (s.contains("-")) {
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
    }

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

}//getTheText
