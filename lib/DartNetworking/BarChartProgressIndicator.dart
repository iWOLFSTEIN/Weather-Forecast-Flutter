
class BarChartProgressIndicator{
  double getProgress(int id){
    var progress;
      if (id < 600){
         progress = (id *60)/531;
        return progress;
      }
      else if (id >= 600 && id < 700){
        progress = (((id-599)/23)*10)+60;
        return progress;
      }
       else if (id >= 700 && id < 800){
        progress = (((id-699)/82)*10)+70;
        return progress;
      }
      else if (id == 800){
        return 100.0;
      }
      else if (id == 804){
        return 84.0;
      }
      else if (id== 803){
        return 88.0;
      }
      else if (id == 802){
        return 92.0;
      }
      else if (id == 801){
        return 96.0;
      }
  }
}