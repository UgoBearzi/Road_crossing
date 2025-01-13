class Car{
  int startingPositionX,startingPositionY, positionX, positionY, endingPositionX;
  int carHeight,carWidth;
  int speed;
  color carColor;
  boolean doesStartRight;

  public Car(){
    this.carWidth = 100;
    this.carHeight = 50;
    this.startingPositionY = 800-carHeight;
    this.startingPositionX = -carWidth;
    this.positionX = startingPositionX;
    this.positionY = startingPositionY;
    this.endingPositionX = width+carWidth;
    this.speed = 5;
    this.carColor = color(255, 104, 0);
    this.doesStartRight = false;
  }
  
  public Car(int carWidth, int y,int speed, boolean doesStartRight, color carColor,int startingPositionMultiplier, int lastPositionMultiplier){
    this.carWidth = carWidth;
    this.carHeight = 50;
    this.startingPositionY = y-carHeight;
    this.positionY = startingPositionY;
    this.doesStartRight= doesStartRight;
    this.carColor = carColor;
    
    if(doesStartRight){
      this.startingPositionX = width+(carWidth*startingPositionMultiplier);
      this.speed = -speed;
      this.endingPositionX = -(carWidth*lastPositionMultiplier);
    }else{
      this.startingPositionX = -(carWidth*startingPositionMultiplier);
      this.speed = speed;
      this.endingPositionX = width+(carWidth*lastPositionMultiplier);
    }
    
    this.positionX = startingPositionX;
  }
  
  public void carAppearance(){
    fill(carColor);
    strokeWeight(2);
    rect(positionX, positionY, carWidth, carHeight, 5);
    
    fill(135, 206, 250);
    
    if(doesStartRight){
      rect(positionX+(carWidth/5), positionY+5, 20, 40, 30);
    }else{
      rect(positionX+(carWidth/1.50f), positionY+5, 20, 40, 30);
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
