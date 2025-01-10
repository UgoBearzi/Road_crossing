class Obstacle {
  int positionY,positionX,obstacleHeight,obstacleWidth;
  color carColor;

  public Obstacle(){
    this.obstacleWidth = 50;
    this.obstacleHeight = 50;
    this.positionX = width/2-obstacleWidth;
    this.positionY = height-(obstacleHeight*3);
    this.carColor = color(255, 104, 0);
  }
  
  public Obstacle(int x, int y){
    this.obstacleWidth = 50;
    this.obstacleHeight = 50;
    this.positionX = x;
    this.positionY = height-y;
    this.carColor = color(255, 104, 0);
  }
  
  public void obstacleAppearance(){
    fill(255, 100, 0);
    triangle(positionX, positionY, positionX + obstacleWidth / 2, positionY - obstacleHeight, positionX + obstacleWidth, positionY);
  
    fill(255);
    rect(positionX + obstacleWidth/4, (positionY - obstacleHeight / 2) -5, obstacleWidth/2, 10);
    
    fill(100);
    rect(positionX-5, positionY-5, obstacleWidth+10f, 10);  

  }
  
  public void stopPlayer(Player player){
    //check if in range of the obstacle
    if((player.positionX >= positionX && player.positionX <= positionX + obstacleWidth || 
    positionX >= player.positionX && positionX <= player.positionX + player.playerWidth) && 
    (player.positionY > positionY && player.positionY < positionY + obstacleHeight || 
    positionY >= player.positionY && positionY <= player.positionY + player.playerHeight)){
      
      //check collision under the obstacle
      if (player.getPositionY() + player.getPlayerHeight() >= positionY && player.getPositionY() + player.getPlayerHeight() <= positionY + obstacleHeight &&
      player.getPositionX() >= positionX && player.getPositionX() <= positionX) {
        player.setCanMoveUp(false);         
      } else {
        player.setCanMoveUp(true);
      }
      
      //check collision over the obstacle
      if (player.getPositionY() <= positionY && player.getPositionY() + player.getPlayerHeight() > positionY - (obstacleHeight*2) &&
      player.getPositionX() >= positionX && player.getPositionX() <= positionX) {
        player.setCanMoveDown(false);         
      } else {
        player.setCanMoveDown(true);
      }
    }
    

  }
  
  public void show(){
    obstacleAppearance();
  }
}
