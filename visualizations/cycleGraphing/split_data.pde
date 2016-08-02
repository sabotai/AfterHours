//pass in an array of strings with the raw data and it returns a 2D string with the spreadsheet data
String[][] splitData(String[] _rawData, int numCols) {
 
  String[][] locData;
  locData = new String[_rawData.length][numCols - 1]; //specify how many columns in csv

  for (int i = 0; i < _rawData.length; i++) {
   String[] pieces = split(_rawData[i], ",");
   
   for (int j=0; j< numCols -1; j++) {
     locData[i][j] = pieces[j];
   }
  } 
  
  //println(data[1][0]);
  println("data split");
  return locData;
}