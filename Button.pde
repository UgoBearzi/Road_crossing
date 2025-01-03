class Button{
  protected int x, y, width, height;
  protected PFont font;
  protected String label;
  protected int fontSize;
  protected color currentColor, buttonColor, pressedColor, highlightColor;
  protected color textColor;
  protected boolean isPressed, isOver;
  
  public Button(){
    this.width = 200;
    this.height = 50;
    this.x = 1600 - width / 2;
    this.y = 100;
    this.font = createFont("Arial", 16, true);
    this.fontSize = 16;
    this.label = "";
    this.buttonColor = color(100,100,100);
    this.pressedColor = color(50,50,50);
    this.highlightColor = color(150,150,150);
    this.textColor = color(0);
    this.currentColor = buttonColor;
  }
  
  public Button(int x, int y, String label, int fontSize){
    this.width = 200;
    this.height = 50;
    this.x = x - width / 2;
    this.y = y;
    this.font = createFont("Arial", 16, true);
    this.fontSize = fontSize;
    this.label = label;
    this.buttonColor = color(100,100,100);
    this.pressedColor = color(50,50,50);
    this.highlightColor = color(150,150,150);
    this.textColor = color(0);
    this.currentColor = buttonColor;
  }
  
  public Button(int width, int height, int x, int y, String label, int fontSize){
    this.width = width;
    this.height = height;
    this.x = x;
    this.y = y;
    this.font = createFont("Arial", 16, true);
    this.fontSize = fontSize;
    this.label = label;
    this.buttonColor = color(100,100,100);
    this.pressedColor = color(50,50,50);
    this.highlightColor = color(150,150,150);
    this.textColor = color(0);
    this.currentColor = buttonColor;
  }
  
  public boolean getIsPressed(){
    return isPressed;
  }
  
  public void setIsPressed(boolean isPressed){
    this.isPressed = isPressed;
  }
  
  public boolean getIsOver(){
    return isOver;
  }
  
  public void setIsOver(boolean isOver){
    this.isOver = isOver;
  }

  public void show(){
    buttonStatus();
    changeColor();
    
    changeMouseToHand();
    
    fill(currentColor);
    rect(x, y, width, height);
    textFont(font, fontSize);
    fill(textColor);
    text(label, x + 5, (y + height / 2) + fontSize / 3);
  }

  public void buttonStatus(){
    if(!mousePressed){
      setIsPressed(false);
    }

    if(mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height){
      setIsOver(true);
      if(mousePressed){
        setIsPressed(true);
      }
    }else{
      setIsOver(false);
    }
    
  }
  
  public void changeMouseToHand(){
    if(getIsOver()){
      cursor(HAND);
    }else{
      cursor(ARROW);
    }
  }
  
  public void changeColor(){
    if(getIsPressed() && getIsOver()){
      this.currentColor = pressedColor;
    }else if(!getIsPressed() && getIsOver()){
      this.currentColor = highlightColor;
    }else{
      this.currentColor = buttonColor;
    }
  }
  
}
