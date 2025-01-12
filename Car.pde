class Car{
  int startingPositionXSx,startingPositionXDx,startingPositionY, positionX, positionY;
  int carHeight,carWidth;
  int speed;
  color carColor;
  boolean doesStartRight;

  public Car(){
    this.carWidth = 100;
    this.carHeight = 50;
    this.startingPositionY = 800-carHeight;
    this.startingPositionXSx = -carWidth;
    this.startingPositionXDx = width+carWidth;
    this.positionX = startingPositionXSx;
    this.positionY = startingPositionY;
    this.speed = 5;
    this.carColor = color(255, 104, 0);
    this.doesStartRight = false;
  }
  
  public Car(int y,boolean doesStartRight){
    this.carWidth = 100;
    this.carHeight = 50;
    this.startingPositionY = y-carHeight;
    this.startingPositionXSx = -carWidth;
    this.startingPositionXDx = width+carWidth;
    this.positionY = startingPositionY;
    this.doesStartRight= doesStartRight;
    this.carColor = color(255, 104, 0);
    if(doesStartRight){
      this.positionX = startingPositionXDx;
      this.speed = -5;
    }else{
      this.positionX = startingPositionXSx;
      this.speed = 5;
    }
  }
  
  public void carAppearance(){
    fill(carColor);
    strokeWeight(2);
    rect(positionX, positionY, carWidth, carHeight, 5);
    
    fill(135, 206, 250);
    
    if(doesStartRight){
      rect(positionX+15, positionY+5, 20, 40, 30);
    }else{
      rect(positionX+55, positionY+5, 20, 40, 30);
    }
    strokeWeight(4);
  }
  
  public void carMove(){
    positionX += speed;
    if(!doesStartRight){
      if(positionX > width){
        positionX = -carWidth;
      }
    }else{
       if(positionX < -carWidth){
        positionX = width+carWidth;
      }
    }
  }
  
  public void show(){
    carAppearance();
    carMove();
  }
  
  public void runOverPlayer(Player player){
    if((player.positionX >= positionX && player.positionX <= positionX + carWidth || 
    positionX >= player.positionX && positionX <= player.positionX + player.playerWidth) && 
    (player.positionY > positionY && player.positionY < positionY + carHeight || 
    positionY >= player.positionY && positionY < player.positionY + player.playerHeight)){
      player.resetPosition();
    }
  }
  
  
}
