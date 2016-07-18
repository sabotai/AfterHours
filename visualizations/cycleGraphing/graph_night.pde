

void graph(){
  
  for (int i = 0; i < 24; i++){
    
    int newI = i - 12;
    if (i < 12){
     newI = i + 12; 
    } 
   text(newI, eighthW/1.1, (graphH * (float(i)/24)) + eighthH); 
  }
  
  
  //draw sunrise dividing line
  beginShape();
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
  
}