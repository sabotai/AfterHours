

float convertDec(String rawTime){
  float time[] = float(split(rawTime, ':')); //first pos = hour, second = min
  println(rawTime);
  float deci = (time[0]/24) + (time[1]/60)/24;
  //println("decitime = " + deci);
  return deci;
}