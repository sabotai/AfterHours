

void graph(){
  
  //make the labels for each hour
  for (int i = 0; i < 24; i++){
    
    int newI = i - 12;
    if (i < 12){
     newI = i + 12; 
    } 
   text(newI, eighthW/1.1, (graphH * (float(i)/24)) + eighthH); 
  }
  
  
  beginShape();
  
  //draw sunrise dividing line
  //vertex(eighthW, eighthH);//start it in the corner
  for (int i = 0; i < sunrise.length; i++){
    //ellipse(eighthW + graphW * (float(i)/sunrise.length), eighthH + sunrise[i]*graphH, 3, 3);
    vertex(eighthW + graphW * (float(i)/sunrise.length),  eighthH + (graphH/2) + sunrise[i]*graphH);
  }
  //vertex(graphW + eighthW, eighthH);
  
  
  //draw sunset dividing line
  //beginShape();
  //vertex(eighthW, eighthH + graphH);
  for (int i = sunrise.length - 1; i > 0; i--){ // go in reverse so the shape doesnt cross itself
    vertex(eighthW + graphW * (float(i)/sunset.length), eighthH + sunset[i]*graphH - (graphH/2));
  }
  //vertex(graphW + eighthW, eighthH + graphH);
  endShape(CLOSE);
  
  if (plotTimes){
    stroke(255,0,0);
    int prevLineY = 0;
    
    for(int i = 1; i < d2Rows; i++){
      //eighthH + (graphH/2) + sunrise[i]*graphH
      float locTime = convertDec(data2[i][1] + ":" + data2[i][2]);
      int lineTimeY = int(eighthH + (graphH/2) + locTime*graphH);
      if (locTime >= 0.5){
        println("yuz");
        lineTimeY = int(eighthH - (graphH/2) + (locTime)*graphH);
      }
      if (offsetDupes && (lineTimeY == prevLineY)){
        lineTimeY+=1;
      }
      println("loctime = " + locTime + "   linetimey = " + lineTimeY);
      line(0,lineTimeY,width, lineTimeY);
      prevLineY = lineTimeY;
    }
  }
  
}