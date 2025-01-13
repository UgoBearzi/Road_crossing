class Goal{
  int positionX, positionY,goalHeight,goalWidth;
  color goalColorWhite,goalColorBlack;
  boolean hasReachedGoal;

  public Goal(){
    this.goalWidth = 1600;
    this.goalHeight = 50;
    this.positionX = 0;
    this.positionY = goalHeight;
    this.goalColorWhite = color(255);
    this.goalColorBlack = color(0);
    this.hasReachedGoal = false;
  }
  
  public void setHasReachedGoal(boolean hasReachedGoal){
    this.hasReachedGoal = hasReachedGoal;
  }
  
  public boolean getHasReachedGoal(){
    return hasReachedGoal;
  }
  
  public void goalAppearance() {
    int numColumns = 64;
    int numRows = 4;
    float squareWidth = goalWidth / numColumns;
    float squareHeight = goalHeight / numRows;

    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numColumns; j++) {
        if ((i + j) % 2 == 0) {
          fill(goalColorWhite);
        } else {
          fill(goalColorBlack);
        }
        rect(positionX + j * squareWidth, positionY + i * squareHeight, squareWidth, squareHeight);
      }
    }
     stroke(4);
  }
  
  //when player reaches goal, set hasReachedGoal to true
  public void reachGoal(Player player){
    if(player.positionY > positionY && player.positionY < positionY + goalHeight || 
    positionY >= player.positionY && positionY < player.positionY + player.playerHeight){
      setHasReachedGoal(true);
    }
  }
  
  public void show(){
    goalAppearance();
   }
}
