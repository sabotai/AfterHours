

float convertDec(String rawTime){
  float time[] = float(split(rawTime, ':')); //first pos = hour, second = min
  
  float deci = (time[0]/24) + (time[1]/60)/24;
  println(deci);
  return deci;
}