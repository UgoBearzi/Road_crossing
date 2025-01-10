class Car{
  int startingPositionX, startingPositionY, positionX, positionY;
  int carHeight,carWidth;
  int speed;
  color carColor;

  public Car(){
    this.carWidth = 100;
    this.carHeight = 50;
    this.startingPositionX = -carWidth;
    this.startingPositionY = 800-carHeight;
    this.positionX = startingPositionX;
    this.positionY = startingPositionY;
    this.speed = 5;
    this.carColor = color(255, 104, 0);
  }
  
  public Car(int y){
    this.carWidth = 100;
    this.carHeight = 50;
    this.startingPositionX = -carWidth;
    this.startingPositionY = y-carHeight;
    this.positionX = startingPositionX;
    this.positionY = startingPositionY;
    this.speed = 5;
    this.carColor = color(255, 104, 0);
  }
  
  public void carAppearance(){
    fill(carColor);
    rect(positionX, positionY, carWidth, carHeight, 5);
    
    fill(135, 206, 250);
    rect(positionX+55, positionY+5, 20, 40, 30);
    
  }
  
  public void carMove(){
    positionX += speed;
    if(positionX > width){
      positionX = -carWidth;
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
    positionY >= player.positionY && positionY <= player.positionY + player.playerHeight)){
      player.resetPosition();
    }
  }
  
  
}
