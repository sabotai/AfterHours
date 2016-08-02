

import processing.pdf.*;

Boolean plotTimes = true;
Boolean recordPDF = true;
Boolean offsetDupes = true;

String[][] data; //spreadsheet with the sunrise/sunset info
String[][] data2; //spreadsheet with the photo time/locale
int d2Rows; //currently kind of hardcoded to figure out the number of data rows

float[] sunrise = new float[366]; //366 for leap year
float[] sunset = new float[366]; //366 for leap year

int widthW = 1920;
int heightH = 1080;

int eighthW;
int eighthH;
int graphW;
int graphH;
int hour;

void setup(){
  size(1920 ,1080); //make sure it's the same as defined above
  smooth(8);
  
  if (recordPDF)
    beginRecord(PDF, "sketch2.pdf"); 
 
 
  String[] rawData;
  rawData = loadStrings("nyc_2016_sunrise_sunset_daylight.csv");
  data = splitData(rawData, 4);  //which data and how many columns
  rawData = loadStrings("photo_time_location.csv");
  d2Rows = rawData.length;
  data2 = splitData(rawData, 8);
  
  eighthW = width/8;
  eighthH = height/8;
  graphW = eighthW * 6;
  graphH = eighthH * 6;
  hour = ((height/8) * 6)/24;
  
  for(int i = 1; i < data.length; i++){
    //print("day " + i + ": ");
    sunrise[i-1] = convertDec(data[i][1]);
    sunset[i-1] = convertDec(data[i][2]);
  }
  
  
  run();
  
  
  if (recordPDF)
    endRecord();
}
void run(){
  
  fill(255);
  rect(eighthW, eighthH, graphW, graphH);
  
  fill(0);
  
  graph();
  
}

void draw(){
  run();
}

void mousePressed(){
   offsetDupes = !offsetDupes; 
}