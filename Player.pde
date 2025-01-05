import java.io.*;

class Player{
  int positionY,positionX,playerHeight,playerWidth,move;
  boolean canMove;
  color playerColor;
  
  public Player(){
    this.playerWidth = 50;
    this.playerHeight = 50;
    this.positionX = width/2-playerWidth;
    this.positionY = height-playerHeight;
    this.move = 50;
    this.playerColor = color(255, 204, 0);
    this.canMove = true;
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
  
  public boolean getCanMove(){
    return canMove;
  }
  
  public void setCanMove(boolean canMove){
    this.canMove = canMove;
  }
  
  public void move(){
    
     if(keyPressed){
       switch(keyCode){
         case UP:
           if(positionY != 0 && getCanMove()){
             positionY -= move;
             setCanMove(false);
           }
           break;
         case DOWN:
           if(positionY != height-playerHeight && getCanMove()){
             positionY += move;
             setCanMove(false);
           }
           break;
         case LEFT:
           if(positionX != 0 && getCanMove()){
             positionX -= move;
             setCanMove(false);
           }
           break;
         case RIGHT:
           if(positionX != width-playerWidth && getCanMove()){
             positionX += move;
             setCanMove(false);
           }
           break;
       }
     }else{
       setCanMove(true);  
     }
   }
   
  public void moveIfObstacle(Obstacle obstacle){
    
     if(keyPressed){
       switch(keyCode){
         case UP:
           if((positionY != 0 && getCanMove()) && (positionY != obstacle.obstacleHeight-playerHeight)){
             positionY -= move;
             setCanMove(false);
           }
           break;
         case DOWN:
           if((positionY != height-playerHeight && getCanMove()) && (positionY != obstacle.obstacleHeight-playerHeight)){
             positionY += move;
             setCanMove(false);
           }
           break;
         case LEFT:
           if((positionX != 0 && getCanMove()) && (positionX != obstacle.obstacleWidth-playerWidth)){
             positionX -= move;
             setCanMove(false);
           }
           break;
         case RIGHT:
           if((positionX != width-playerWidth && getCanMove()) && (positionX != obstacle.obstacleWidth-playerWidth)){
             positionX += move;
             setCanMove(false);
           }
           break;
       }
     }else{
       setCanMove(true);  
     }
   }  
   
  public void show(){
    playerAppearance();
  }
   
   
}
