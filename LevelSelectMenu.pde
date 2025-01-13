final class LevelSelectMenu{
  Button[] levelButtons;
  
  public LevelSelectMenu(){
    this.levelButtons = new Button[4];
    for(int i = 0; i < 4; i++){
     this.levelButtons[i] = new Button(50, 50, (width/2 - 175) + (i * 100), height/2, ""+(i+1), 16); 
    }
  }
  
  public void show(){
    textAlign(CENTER);
    textSize(90);
    fill(0);
    text("Select a level", width/2, height/2-300);
    textAlign(LEFT);
    
    for(int i = 0; i < 4; i++){
      levelButtons[i].show();
    }
  }
  
  public Button getSingleLevelButton(int button){
    return levelButtons[button];
  }
  
  public int levelSelected(int level){
    if(level==0){
      for(int i = 0; i < 4; i++){
        if(getSingleLevelButton(i).getIsPressed()){
          return i+1;
        }
      }
    }else{
      return level;
    }
    return 0;
  }
  
  //it dosent use a for because it changes menu only for the first button
  public boolean anyLevelSelected(){
    if(getSingleLevelButton(0).getIsPressed()){
      return true;
    } else if(getSingleLevelButton(1).getIsPressed()){
      return true;
    }else if(getSingleLevelButton(2).getIsPressed()){
      return true;
    }else if(getSingleLevelButton(3).getIsPressed()){
      return true;
    }else{
      return false;
    }
  }
}
