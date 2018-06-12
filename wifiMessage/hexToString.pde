public String convertHexToString(String hex) {

  hex = hex.replaceAll("\\s+", "");

  StringBuilder sb = new StringBuilder();
  StringBuilder temp = new StringBuilder();

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
    return "foutje";
  }
}
