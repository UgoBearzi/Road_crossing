class Road{
  int positionY,positionX,roadHeight,roadWidth;
  color roadColor;
  
  public Road(){
    this.roadWidth = width;
    this.roadHeight = 55;
    this.positionX = width/2-roadWidth;
    this.positionY = height-(roadHeight*3);
  }
  
    public Road(int y){
    this.roadWidth = width;
    this.roadHeight = 50;
    this.positionY = y-roadHeight;
    this.roadColor = color(154, 162, 173);
  }
    public void roadAppearance(){
    fill(roadColor);
    strokeWeight(2);
    rect(positionX, positionY, roadWidth, roadHeight);
    for(int i = 0; i < 16;i++){
      fill(255);
      rect(positionX+100*i, positionY+20, 50, 10);
    }
    strokeWeight(4);
  }
  
  public void show(){
    roadAppearance();
  }
}
