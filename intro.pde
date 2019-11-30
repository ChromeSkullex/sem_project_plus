//this is for the intro screen at the beginning 

void intro(){
 //Welcome
 //This is your class schedule 
  //Make sure you go to class everydat and get ready for the finals in 2 weeks
  rectMode(CENTER);
  fill(48);
  noStroke();
  rect(width/2,height/2,width,height);
  textAlign(CENTER);
  textSize(50);
  fill(255);
  text("WELCOME", width/2, height/2);
  

}

void classText(){
  rect(width/2,height/2,width,height);
  text("This is your class schedule", width/2, height/2);
  
}
