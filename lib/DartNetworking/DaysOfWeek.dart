

class DaysOfWeek {

  String getDay(int id){
    if (id == 1){
      return "MON";
    }
    else if(id==2){
      return "TUE";
    }
     else if(id==3){
      return "WED";
    }
     else if(id==4){
      return "THU";
    }
     else if(id==5){
      return "FRI";
    }
     else if(id==6){
      return "SAT";
    }
     else if(id==7){
      return "SUN";
    }   
  }

 String getDayFullName(int id){
    if (id == 1){
      return "Monday";
    }
    else if(id==2){
      return "Tuesday";
    }
     else if(id==3){
      return "Wednesday";
    }
     else if(id==4){
      return "Thursday";
    }
     else if(id==5){
      return "Friday";
    }
     else if(id==6){
      return "Saturday";
    }
     else if(id==7){
      return "Sunday";
    }

    
  }
}