final class Textbox extends Button{
   private boolean isWriting, isKeyBeingPressed,isOnlyNumbers;
   private String text;
   private int maxCharacters;
   
   public Textbox(int x, int y, String label, int maxCharacters,boolean isOnlyNumbers){
    this.width = 200;
    this.height = 25;
    this.x = x - width / 2;
    this.y = y;
    this.label = label;
    this.textColor = color(50);
    this.isWriting = false;
    this.isKeyBeingPressed = false;
    this.text = "";
    this.maxCharacters= maxCharacters;
    this.isOnlyNumbers = isOnlyNumbers;
  }
  
  public Textbox(int x, int y, String label, int maxCharacters,boolean isOnlyNumbers,String text){
    this.width = 100;
    this.height = 25;
    this.x = x - width / 2;
    this.y = y;
    this.label = label;
    this.textColor = color(50);
    this.isWriting = false;
    this.isKeyBeingPressed = false;
    this.text = text;
    this.maxCharacters= maxCharacters;
    this.isOnlyNumbers = isOnlyNumbers;
  }
  
  public boolean getIsWriting(){
    return isWriting;
  }
  
  public void setIsWriting(boolean isWriting){
    this.isWriting = isWriting;
  }
  
  public boolean getIsKeyBeingPressed(){
    return isKeyBeingPressed;
  }
  
  public void setIsKeyBeingPressed(boolean isKeyBeingPressed){
    this.isKeyBeingPressed = isKeyBeingPressed;
  }
  
  public void setText(String text){
    this.text = text;
  }
  
  public String getText(){
    return text;
  }
  
  public void setMaxCharacters(int maxCharacters){
    this.maxCharacters = maxCharacters;
  }
  
  public int getMaxCharacters(){
     return maxCharacters;
  }
  
  public void setIsOnlyNumbers(boolean isOnlyNumbers){
    this.isOnlyNumbers = isOnlyNumbers;
  }
  
  public boolean getIsOnlyNumbers(){
     return isOnlyNumbers;
  }
  
  public void show(){
    buttonStatus();
    changeColor();
    fill(currentColor);
    rect(x, y, width, height);
    
    if(text.equals("")){
      textFont(font, fontSize);
      fill(textColor);
      text(label, x + 5, (y + height / 2) + fontSize / 3);
    }
    
    changeText();
    fill(0);
    text(text, x + 5, (y + height / 2) + fontSize / 3);
  }
  
  public void buttonStatus(){
    if(!mousePressed){
      setIsPressed(false);
    }

    if(mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height){
      setIsOver(true);
      if(mousePressed){
        setIsPressed(true);
        setIsWriting(true);
      }
    }else{
      setIsOver(false);
      if(mousePressed){
        setIsPressed(false);
        setIsWriting(false);
      }
    }
    
    if(keyPressed){
      if(key == ENTER){
        setIsWriting(false);
      }
    }
  }
  
  private void addCharacter(){
    if(getIsKeyBeingPressed() && text.length()<=maxCharacters-1){
      this.text += key;
      setIsKeyBeingPressed(false);
    }
  }
  
  private void deleteCharacter(){
    if(getIsKeyBeingPressed()){
      this.text = text.substring(0, text.length() - 1);
      setIsKeyBeingPressed(false);
    }
  }
  
  public void changeText(){
    
    if(keyPressed && getIsWriting()){
      if(getIsOnlyNumbers()){
        if((key >= '0' && key <= '9')){
          addCharacter();
        } else if(key == BACKSPACE && text.length() > 0){
          deleteCharacter();
        }
      }else{
        if((key >= '0' && key <= '9') || (key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')){
          addCharacter();
        } else if(key == BACKSPACE && text.length() > 0){
          deleteCharacter();
        }
      }
    }else{
      setIsKeyBeingPressed(true);
    }
  }
  
  public String toString(){
    return text;
  }
}
