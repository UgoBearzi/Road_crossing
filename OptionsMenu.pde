class OptionsMenu{
  private PImage title;
  private Button goBackButton;
  
  public OptionsMenu(){
    this.title = loadImage("Road Crossing.png");
    this.goBackButton = new Button(width/2, height/2+75, "Go back", 16);
  }
  
  public void show(){
    image(title,width/2-195, height/2-330,390,160);
    goBackButton.show();
  }
  
  public boolean isGoBackButtonPressed(){
    return goBackButton.getIsPressed();
  }
 
}
