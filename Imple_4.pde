//variables -dp
//assume person is in dorm. with food payed off 
int numOfButtons = 5;
int numOfBars = 4;
float twoThirds = 2.0/3.0;
final float BUTTON_WIDTH = width*(4*twoThirds); //about 267
final float BUTTON_HEIGHT = height/2*(twoThirds); //33.33
final float TEXT_HEIGHT = 20;

//arrays for the buttons -dp
float [] buttonsY= {200,250,300,350,400};
String [] buttons= {"Go to Class","Socialize","Eat","Study","Sleep"};
//arrays for bars
float [] barsY= {550,600,650,700};
String [] bars= {"Health","Hunger","Happiness","Grades"};

//variable number percentage in decimal. 
float Health = .1;
float Happy = .1;
float Grade = .75;
float Hunger = .1;
float Energy = .1;

float textY = 2*twoThirds*20;
float textX = 2*twoThirds*520;
//bar fill
float[] barFill= new float[4];

PImage img;
PImage dog;

//new_hour implemented -sazhelle
int numHour =7;
int rectXClock=100;
int rectYClock=200;

//Boolean to check if random questions are running. To hide the MAIN bars

//DayWeek
int week =1;
int dayRef=0;
String day[] = {"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"};
//0 = monday, 6 = Sunday

void setup(){
  size (1024,768);
  
  while(millis()<0*1000){
    intro();
  }
  while(millis()<0*1000){
    classText();
  }

  frameRate(60);
  rectMode(CORNER);
  background();
  buttons(); 
  drawBars(); 
  //placement for actual dog pic
  dog = loadImage("true grits.png");
  img = loadImage("logo.png");
  image(img, BUTTON_HEIGHT, BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT*3); 
  image(dog, (width-BUTTON_WIDTH)/2, 2*BUTTON_HEIGHT, 300,260);
  randClass();
}

//repeatedly checks if mouse is clicked -dp
void draw(){
  //under unpdatingVaribles, just to keep it clean 
  updateVar();
    barsFill();
    mousePressed();   
    //sazhelle
    displayClock();
        //sazhelle
    displayClock(); 
    displayDay();
    //new class varible
    displayClass();
    checkEnd();
}

//creates the buttons -dp
void buttons(){
 for(int i = 0; i < numOfButtons; i++){  
   strokeWeight(3);
   rect(BUTTON_HEIGHT,buttonsY[i], BUTTON_WIDTH, BUTTON_HEIGHT,10);
   textAlign(CENTER,BOTTOM);
   textSize(30);
   text(buttons[i], BUTTON_HEIGHT+(BUTTON_WIDTH/2),buttonsY[i]+BUTTON_HEIGHT);
   }
}

//makes the layout of the game -dp
void background(){
  background(48,48,48);
  noFill();
  stroke(255,200,0);
  strokeWeight(10);
  rect(0,0,width,height);
  float(height);
  float(width);
  strokeWeight(5);
  line(0,height*twoThirds,width,height*twoThirds);
  line(width/2*twoThirds,0,width/2*twoThirds,height*twoThirds);
  line(width*twoThirds,0,width*twoThirds,height*twoThirds);
}

//sazhelle
void displayClock(){
  //text displaying the time, will be in draw since it is updating 
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text(numHour+":00", width/2,height*(.05));
}

//sazhelle
void newHour(){
 //will run inside final button functions to increase the hour by one 
 //0:00 = 12am, once hits 24:00, will reset to 0:00
  //Rectangle to reset the clock 
  rectMode(CENTER);
  fill(48);
  noStroke();
  rect(width/2,height*(.04),width*.1,height*.05);  
  numHour++;
   if(numHour>23){
   numHour=0; 
  }
}

//when button is clicked, it does a thing -dp
void mouseClicked (){
 for(int i = 0; i < numOfButtons; i++){ 
   if ((mouseY>=buttonsY[0])&&((mouseX-BUTTON_HEIGHT<=BUTTON_WIDTH) && (mouseY-buttonsY[i]<=BUTTON_HEIGHT))){
         rightText();
        //input algorithms here and/or separate functions for each choice
        //sazhelle new hour
       
       if((mouseY>=buttonsY[0])&&(mouseY-buttonsY[0]<=BUTTON_HEIGHT)){
         goToClass();
        }
       if((mouseY>=buttonsY[1])&&(mouseY-buttonsY[1]<=BUTTON_HEIGHT)){
         checkMissedClass();
         newHour();
         socialize();
        }
       if((mouseY>=buttonsY[2])&&(mouseY-buttonsY[2]<=BUTTON_HEIGHT)){
          checkMissedClass(); 
         newHour();
         eat();
        }
        if((mouseY>=buttonsY[3])&&(mouseY-buttonsY[3]<=BUTTON_HEIGHT)){
         checkMissedClass();
          newHour();
          study();
        } 
        if((mouseY>=buttonsY[4])&&(mouseY-buttonsY[4]<=BUTTON_HEIGHT)){
          checkMissedClass();
          newHour();
          sleep();
        }
        break;
       }
    }
}

//condensed drawBars and text into one function -dp
void drawBars(){
  
  for(int i = 0; i < numOfBars; i++){   
   fill(48);
   rect(BUTTON_HEIGHT*2,barsY[i],BUTTON_WIDTH*4*twoThirds,BUTTON_HEIGHT); 
   fill(255);
   text (bars[i],width-(BUTTON_WIDTH/3),barsY[i]+BUTTON_HEIGHT);
  }
}

//Fill for inside 
void barsFill(){
  
  
 for(int i = 0; i < numOfBars; i++){   
   
   barFill[i] = constrain(barFill[i], 0,1);
   rectMode(CORNER);
   fill(48);
   rect(BUTTON_HEIGHT*2,barsY[i],1*(BUTTON_WIDTH*4*twoThirds),BUTTON_HEIGHT);
   fill(255,200,0);
   rect(BUTTON_HEIGHT*2,barsY[i],barFill[i]*(BUTTON_WIDTH*4*twoThirds),BUTTON_HEIGHT);
   stroke(255,200,0);
 }
}

//sazhelle 
//Chance Function
float chance(){
 float num = (float)Math.random() * 100;
 return num;
}

void rightText(){
 for(int i = 0; i < numOfButtons; i++){ 
   if ((mouseY>=buttonsY[0])&&((mouseX-BUTTON_HEIGHT<=BUTTON_WIDTH) && (mouseY-buttonsY[i]<=BUTTON_HEIGHT))){
     textSize(10);
     textAlign(LEFT);
         if((mouseY>=buttonsY[0])&&(mouseY-buttonsY[0]<=BUTTON_HEIGHT)){
         //refer to goToClass
         break;
        }
       if((mouseY>=buttonsY[1])&&(mouseY-buttonsY[1]<=BUTTON_HEIGHT)){
         text("Your happiness increased by " +nf(Happy,1,1)+"%.",textX,textY);
         textY+=TEXT_HEIGHT;
         break;
        }
       if((mouseY>=buttonsY[2])&&(mouseY-buttonsY[2]<=BUTTON_HEIGHT)){
         text("Your hunger increased by " +nf(Grade,1,1)+ "% and happiness increased by "+nf(Happy,1,1)+"%.",textX,textY);
         textY+=TEXT_HEIGHT;
         break;
        }
        if((mouseY>=buttonsY[3])&&(mouseY-buttonsY[3]<=BUTTON_HEIGHT)){
            text("Your grade increased by " +nf(Grade,1,1)+ "% and happiness decreased by "+nf(Happy,1,1)+"%.",textX,textY);
         break;
        } 
        if((mouseY>=buttonsY[4])&&(mouseY-buttonsY[4]<=BUTTON_HEIGHT)){
         text("Your health increased by " +nf(Health,1,1)+ "% and happiness increased by "+nf(Happy,1,1)+"%.",textX,textY);
         textY+=TEXT_HEIGHT;
         break;
        }
    }
  }
}
