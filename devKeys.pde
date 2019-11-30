//all of the dev keys we need, feel free to add some

void keyPressed() {
  //Increase by 1 Day
  if (key == 'd') {
    newDay();
  } 
  
  //Trigger end Screen
  else if (key == 'e'){
    week =3;
  }
  
  //increase all Grade by 10%
    else if (key == 'g'){
    
      gradeClass1=constrain(gradeClass1, 0, 90);
      gradeClass1+=10;
      gradeClass2=constrain(gradeClass2, 0, 90);
      gradeClass2+=10;
      gradeClass3=constrain(gradeClass3, 0, 90);
      gradeClass3+=10;
    
    
  }
  
  //increase all TestEfficiency 
    else if (key == 'x'){
    
       effClass1 = constrain(effClass1, 0, .9);
       effClass1+= .1;
       effClass2 = constrain(effClass2, 0, .9);
       effClass2+= .1;
       effClass3 = constrain(effClass3, 0, .9);
       effClass3+= .1;

    
    
  }
  
}
