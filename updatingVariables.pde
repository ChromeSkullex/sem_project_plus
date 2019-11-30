void updateVar(){
   //Fill for the bars, make sure it is contrain
  barFill[0]= Health;
  barFill[1]= Hunger;   
  barFill[2]= Happy;
  barFill[3]= Grade; 
  
  //updates efficiency, makes sure it is all contrain from 0 - 1
  //everyone starts with 0
  
  classEff[0]= roundNum(effClass1);
  classEff[1]= roundNum(effClass2);   
  classEff[2]= roundNum(effClass3);
  
  //updates grades, show on display 
  //everyone starts with 90
  classGrade[0]= gradeClass1;
  classGrade[1]= gradeClass2;   
  classGrade[2]= gradeClass3;
  
  
}
