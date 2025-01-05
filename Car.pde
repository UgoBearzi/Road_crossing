class Car{
  int positionY,positionX,carHeight,carWidth,move;
  color carColor;

public Car(){
    this.carWidth = 100;
    this.carHeight = 50;
    this.positionX = width/2-carWidth;
    this.positionY = height-carHeight;
    this.move = 50;
    this.carColor = color(255, 104, 0);
  }
  
  public void carAppearance(){
    fill(carColor);
  }
  
  
}
