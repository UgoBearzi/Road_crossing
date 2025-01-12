import java.io.*;

class Player{
  int startingPositionX, startingPositionY, positionX,positionY;
  int playerHeight,playerWidth;
  int move;
  
  boolean canMove, canMoveUp, canMoveDown, canMoveLeft, canMoveRight;
  color playerColor;
  
  public Player(){
    this.playerWidth = 50;
    this.playerHeight = 50;
    this.startingPositionX = width/2-playerWidth;
    this.startingPositionY = height-playerHeight;
    this.positionX = startingPositionX;
    this.positionY = startingPositionY;
    this.move = 50;
    this.playerColor = color(255, 204, 0);
    this.canMove = true;
    this.canMoveUp = true;
    this.canMoveDown = true;
    this.canMoveLeft = true;
    this.canMoveRight = true;
  }
  
  public void playerAppearance(){
    fill(playerColor);
    rect(positionX, positionY, playerWidth, playerHeight);

    fill(0);
    ellipse((positionX - 10) + playerWidth/2, (positionY - 8) + playerHeight/2, 5, 5);
    ellipse((positionX + 10) + playerWidth/2, (positionY - 8) + playerHeight/2, 5, 5);

    noFill(); 
    stroke(0); 
    strokeWeight(4); 
    arc(positionX + playerWidth/2, (positionY + 10) + playerHeight/2, 20, 10, 0, PI);
  }
  
  public void setPositionX(int positionX){
    this.positionX = positionX;
  }
  
  public int getPositionX(){
    return positionX;
  }
  
  public void setPositionY(int positionY){
    this.positionY = positionY;
  }
  
  public int getPositionY(){
    return positionY;
  }
  
  public void setPlayerWidth(int playerWidth){
    this.playerWidth = playerWidth;
  }
  
  public int getPlayerWidth(){
    return playerWidth;
  }
  
  public void setPlayerHeight(int playerHeight){
    this.playerHeight = playerHeight;
  }
  
  public int getPlayerHeight(){
    return playerHeight;
  }
  
  public boolean getCanMove(){
    return canMove;
  }
  
  public void setCanMove(boolean canMove){
    this.canMove = canMove;
  }
  
  public boolean getCanMoveUp(){
    return canMoveUp;
  }
  
  public void setCanMoveUp(boolean canMoveUp){
    this.canMoveUp = canMoveUp;
  }
  
  public boolean getCanMoveDown(){
    return canMoveDown;
  }
  
  public void setCanMoveDown(boolean canMoveDown){
    this.canMoveDown = canMoveDown;
  }
  
  public boolean getCanMoveLeft(){
    return canMoveLeft;
  }
  
  public void setCanMoveLeft(boolean canMoveLeft){
    this.canMoveLeft = canMoveLeft;
  }
  
  public boolean getCanMoveRight(){
    return canMoveRight;
  }
  
  public void setCanMoveRight(boolean canMoveRight){
    this.canMoveRight = canMoveRight;
  }
  
  public void move(){
    
     if(keyPressed){
       switch(keyCode){
         case UP:
           if(getPositionY() != 0 && getCanMove() && getCanMoveUp()){
             positionY -= move;
             setCanMove(false);
           }
           break;
         case DOWN:
           if(getPositionY() != height-getPlayerHeight() && getCanMove() && getCanMoveDown()){
             positionY += move;
             setCanMove(false);
           }
           break;
         case LEFT:
           if(getPositionX() != 0 && getCanMove() && getCanMoveLeft()){
             positionX -= move;
             setCanMove(false);
           }
           break;
         case RIGHT:
           if(getPositionX() != width-getPlayerWidth() && getCanMove() && getCanMoveRight()){
             positionX += move;
             setCanMove(false);
           }
           break;
       }
     }else{
       setCanMove(true);  
     }
   }
   
   public void test(Obstacle obstacle){
    
     if(keyPressed){
       switch(keyCode){
         case UP:
           if(((positionY > obstacle.positionY || positionY < obstacle.positionY - obstacle.obstacleHeight) || 
           !(positionX >= obstacle.positionX && positionX < obstacle.positionX + obstacle.obstacleWidth)) && 
           getCanMove()){
             positionY -= move;
             setCanMove(false);
           }
           break;
         case DOWN:
           if(((positionY > obstacle.positionY || positionY < obstacle.obstacleHeight) || 
           !(positionX >= obstacle.positionX && positionX < obstacle.positionX + obstacle.obstacleWidth)) && 
           getCanMove()){
             positionY += move;
             setCanMove(false);
           }
           break;
         case LEFT:
           if(((positionX > obstacle.positionX + obstacle.obstacleWidth || positionX < obstacle.positionX) || 
           !(positionY >= obstacle.positionY - obstacle.obstacleHeight && positionY < obstacle.positionY)) && 
           getCanMove()){
             positionX -= move;
             setCanMove(false);
           }
           break;
         case RIGHT:
           if(((positionX < obstacle.positionX - obstacle.obstacleWidth || positionX > obstacle.positionX ) || 
           !(positionY >= obstacle.positionY - obstacle.obstacleHeight && positionY < obstacle.positionY)) && 
           getCanMove()){
             positionX += move;
             setCanMove(false);
           }
           break;
       }
     }else{
       setCanMove(true);
     }
   }
   
  public void setCanMoveAll(){
    setCanMoveUp(true);
    setCanMoveDown(true);
    setCanMoveLeft(true);
    setCanMoveRight(true);
  }
   
  public void show(){
    playerAppearance();
    move();
  }
  
  public void resetPosition(){
    setPositionX(startingPositionX);
    setPositionY(startingPositionY);
  }
   
   
}
