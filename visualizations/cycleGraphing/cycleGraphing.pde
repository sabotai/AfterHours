
String[] rawData;
String[][] data;


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
  rawData = loadStrings("nyc_2016_sunrise_sunset_daylight.csv");
  splitData(); 
  
  
   eighthW = width/8;
   eighthH = height/8;
   graphW = eighthW * 6;
graphH = eighthH * 6;
  hour = ((height/8) * 6)/24;
  
  for(int i = 1; i < data.length; i++){
    print("day " + i + ": ");
    sunrise[i-1] = convertDec(data[i][1]);
    sunset[i-1] = convertDec(data[i][2]);
  }
}

void draw(){
  
  fill(255);
  rect(eighthW, eighthH, graphW, graphH);
  
  fill(0);
  
  graph();
  
  
}