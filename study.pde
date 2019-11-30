//Student Study
void study(){
  for (int i=3;(mouseY>=buttonsY[i])&&(mouseY-buttonsY[i]<=BUTTON_HEIGHT);){
  fill(0);
  rectMode(CORNER);
  rect(BUTTON_HEIGHT*2,barsY[3],barFill[3]*(BUTTON_WIDTH*4*twoThirds),BUTTON_HEIGHT);
  Grade+=.05;
  Happy-=.2;
  if(Happy<0){
    Happy=0;
  }
  if(Grade>1){
    Grade=1;
    
  }
  checkNewDay();
  break;
  }
}
