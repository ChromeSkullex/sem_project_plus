void sleep(){
  for (int i=4;(mouseY>=buttonsY[i])&&(mouseY-buttonsY[i]<=BUTTON_HEIGHT);){
    fill(0);
    rectMode(CORNER);
    rect(BUTTON_HEIGHT*2,barsY[3],barFill[3]*(BUTTON_WIDTH*4*twoThirds),BUTTON_HEIGHT);
    if(numHour>=23){//to get 8 hours of sleep, so they can wake up at 7
      Energy=1;
      checkNewDay();
            
    
  
    }
    
  break;
      }
    }
