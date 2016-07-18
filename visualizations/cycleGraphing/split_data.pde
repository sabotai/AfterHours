void splitData() {
 
 data = new String[rawData.length][3]; //specify how many columns in csv

  for (int i = 0; i < rawData.length; i++) {
   String[] pieces = split(rawData[i], ",");
   
   for (int j=0; j<3; j++) {
     data[i][j] = pieces[j];
   }
  } 
  
  //println(data[1][0]);
  println("data split");
}