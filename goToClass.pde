void goToClass(){
   boolean checkClass = false;
  int classSession =0;
  
  for (int i =0 ; i<classHour.length;i++){
    if (numHour == classHour[i] && dayRef<5){
      checkClass = true;
      classSession = i;
    }
  }
  
  println(checkClass +", "+ classSession);
  
  
  for (int i=0;(mouseY>=buttonsY[i])&&(mouseY-buttonsY[i]<=BUTTON_HEIGHT);){
    
  fill(0);
  rectMode(CORNER);
  rect(BUTTON_HEIGHT*2,barsY[3],barFill[3]*(BUTTON_WIDTH*4*twoThirds),BUTTON_HEIGHT);
  
  if (checkClass){
    fill(255);
    text("Your grade increased by " +nf(Grade,1,1)+ "% and happiness decreased by "+nf(Happy,1,1)+"%.",textX,textY);
         textY+=TEXT_HEIGHT;
         newHour();
        increaseEff(classSession, .1);
        Grade+=.1;
        Happy-=.1;
        if(Happy<0){
          Happy=0;
        }
        if(Grade>1){
          Grade=1;
          
        }
  }
  else {
    //you cannot go to class if it's not in session 
    fill(255);
    text("you cannot go to class since it's not in session",textX,textY);
         textY+=TEXT_HEIGHT;
  }
  
  
  
  checkNewDay();
  break;
  }
}
