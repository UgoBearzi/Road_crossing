class MainMenu{
  private PImage title;
  private Button startButton;
  private Button optionsButton;
  
  public MainMenu(){
    this.title = loadImage("Road Crossing.png");
    this.startButton = new Button(width/2, height/2-25, "Start", 16);
    this.optionsButton = new Button(width/2, height/2+50, "Options", 16);
  }
  
  public void show(){
    image(title,width/2-195, height/2-330,390,160);
    startButton.show();
    optionsButton.show();
  }
  
  public boolean isStartButtonPressed(){
    return startButton.getIsPressed();
  }
  
  public boolean isOptionsButtonPressed(){
    return optionsButton.getIsPressed();
  }
}
