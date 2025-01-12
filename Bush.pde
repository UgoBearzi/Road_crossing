class Bush {
  int positionY,positionX,bushHeight,bushWidth;

  public Bush(){
    this.bushWidth = 50;
    this.bushHeight = 50;
    this.positionX = width/2-bushWidth;
    this.positionY = height-(bushHeight*3);
  }
  
  public Bush(int x, int y){
    this.bushWidth = 50;
    this.bushHeight = 50;
    this.positionX = x;
    this.positionY = height-y;
  }
  
  public void bushAppearance(){
    fill(82, 173, 29);
    noStroke();
    ellipse(positionX-25,positionY+7,bushWidth,bushHeight);
    ellipse(positionX,positionY,bushWidth+25,bushHeight+25);
    ellipse(positionX+25,positionY+7,bushWidth,bushHeight);
    stroke(0);
  }
  
  public void show(){
    bushAppearance();
  }
}
