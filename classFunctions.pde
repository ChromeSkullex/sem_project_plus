//here we set up the classses and schedule and stuff
//Have an array make a random class schedule, ranging from 8am - 8pm, no 12pm
int[] classHour = new int[3];
String[] classNames = {"MATH 151", "CSMS 201", "ECON 101"};
//grade of classes, out of 100: 0-59.9 E, 60-69.9 D, 70-79.9 C, 80-89.9 B, 90-100 A 
//grades will be determined after the final 
float[] classGrade = new float[3];
float[] classEff = new float[3];

//this hurts but I have to set up the varibles sepereatly in order for it to be updated thorughout the code. refer to updatingVaribles 
//to update all at the same time, put into a for loop and set up like 
float gradeClass1;
float gradeClass2;
float gradeClass3;

float effClass1;
float effClass2;
float effClass3;


//Pre-loading, ensuring randomness with the class demo, Only referred to ONCE
void randClass(){
  //random class periods 
  //CAN NOT EQUAL PREVIOUS CLASSES
  //if check is false, that means it is already a class hour and needs to be changed 
  boolean check = true;
  int[]tempHour = new int[3];
  
  for (int i =0; i<classHour.length; i++){
    int rand = (int)(Math.random() * (20-8+1)) + 8;
    classHour[i]=rand;
    println(classHour[i]);
  }
  //check if num is repeated 
  for (int i = 0; i<classHour.length; i++){
    for (int j = i+1;j<classHour.length;j++){
      if (classHour[i] == classHour[j]){
        int rand = (int)(Math.random() * (20-8+1)) + 8;
        classHour[j]=rand;
      }
    }
  }
  
}



//random num rounded to he hundrenth place 
float roundNum(float var){
  //float som = (float)(Math.random());
  float newS=round(var * 100.0) / 100.0;
  return newS;
  
}


//displaying class text

void displayClass(){
  rectMode(CORNER);
  //noStroke();
  fill(48);
  rect(width*.35,height*.47,300,135); 
  fill(255);
  textSize(15);
  textAlign(RIGHT);
  text(stringClassTable(), width*.60,height/2);
  
}
//cleaning up the table
String ignoreClass(int i){
  String varClass = classHour[i]+":00 --- "+classNames[i] +" | "+ classGrade[i] +" | "+ classEff[i]+"\n";
  return varClass;
}

String stringClassTable(){
  String Title ="Time | Class | Grade | Efficiency\n\n";
  return Title+ignoreClass(0)+ignoreClass(1)+ignoreClass(2);
}




//return GPA grade, only for END 
double returnGPA(){
  
 //we need credit hours, these will be static for now| 11 in total
 int credit[] = {4,4,3};
 //A -> 4, B-> 3, C->2, D->1, E->0
 int sum =0;
  for (int i=0; i<classGrade.length;i++){
    if (returnGrade(classGrade[i]) == 'A'){
      sum+=(4*credit[i]);
      
    }
    else if (returnGrade(classGrade[i]) == 'B'){
      sum+=3*credit[i];
      
    }
     else if (returnGrade(classGrade[i]) == 'C'){
      sum+=2*credit[i];
      
    }
    else if (returnGrade(classGrade[i]) == 'D'){
      sum+=1*credit[i];
      
    } 
  }
  return (sum / 11);
  
}





//return letter grade 

Character returnGrade(float num){
  if (num<60){
   return 'F'; 
    
  }
    else if (num<70){
    return 'D';
    
  }
    else if (num<80){
    return 'C';
    
  }
    else if (num<90){
    return 'B';
    
  }
  else {
    return 'A';
  }
}

void increaseEff(int classNum, float amt){
  
  if (classNum == 0){
      effClass1 = constrain(effClass1, 0, .9);
       effClass1+= amt;
  }
  else if(classNum == 1){
      effClass2 = constrain(effClass2, 0, .9);
       effClass2+= amt;
  }
    else if(classNum == 2){
         effClass3 = constrain(effClass3, 0, .9);
       effClass3+= amt;
  }

}



//see if user missed their class
void checkMissedClass(){
   int classSession =0;
  boolean checkClass = false;
  for (int i =0 ; i<classHour.length;i++){
    if (numHour == classHour[i] && dayRef<5){
      checkClass = true;
       classSession = i;
    }
  }
  
  if(checkClass){
    fill(201, 34, 22);
    text("You missed class... Class: "+classNames[classSession],textX,textY);
    textY+=TEXT_HEIGHT;
  }
  
}
