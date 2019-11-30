void socialize(){
  for (int i=1;(mouseY>=buttonsY[i])&&(mouseY-buttonsY[i]<=BUTTON_HEIGHT);){
  fill(0);
  rectMode(CORNER);
  rect(BUTTON_HEIGHT*2,barsY[3],barFill[3]*(BUTTON_WIDTH*4*twoThirds),BUTTON_HEIGHT);
  Grade-=.01;
  Happy+=.1;
  if(Grade<0){
    Grade=0;
  }
  if(Happy>1){
    Happy= 1;
    
  }
  checkNewDay();
  break;
  }
}
