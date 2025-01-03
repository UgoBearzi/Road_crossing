class Player{
  int positionX, positionY, playerWidth, playerHeight, speed;
  color playerColor;
  
  public Player(){
    this.playerWidth = 50;
    this.playerHeight = 50;
    this.positionX = width/2-playerWidth;
    this.positionY = height-playerHeight;
    this.speed = 5;
    this.playerColor = color(255,255,0);
  }
  
  public void playerAppearance(){
    fill(255, 204, 0);
    rect(positionX, positionY, playerWidth, playerHeight);

    fill(0);
    ellipse((positionX - 10) + playerWidth/2, (positionY - 8) + playerHeight/2, 5, 5);
    ellipse((positionX + 10) + playerWidth/2, (positionY - 8) + playerHeight/2, 5, 5);

    noFill(); 
    stroke(0); 
    strokeWeight(4); 
    arc(positionX + playerWidth/2, (positionY + 10) + playerHeight/2, 20, 10, 0, PI);
  }
  
  public void move(){
     if(keyPressed){
       switch(keyCode){
         case UP:
           positionY -= speed;
           break;
         case DOWN:
           positionY += speed;
           break;
         case LEFT:
           positionX -= speed;
           break;
         case RIGHT:
           positionX += speed;
           break;
       }
     }
   }
  
  public void show(){
    playerAppearance();
    move();
  }
   
   
}
