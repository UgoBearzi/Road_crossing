class OptionsMenu{
  private PImage title;
  String textMusic;
  String textSfx;
  private Textbox musicVolume;
  private Textbox sfxVolume;
  private Button goBackButton;
  
  public OptionsMenu(){
    this.title = loadImage("Road Crossing.png");
    this.textSfx = "sound effects volume";
    this.sfxVolume = new Textbox(width/2, height/2-25, "sfx volume",3,true,"100");
    this.textMusic = "musics volume";
    this.musicVolume = new Textbox(width/2, height/2+35, "music volume",3,true,"100");
    this.goBackButton = new Button(width/2, height/2+100, "Go back", 16);
  }
  
  public void show(){
    image(title,width/2-195, height/2-330,390,160);
    
    textSize(16);
    textAlign(CENTER);
    fill(0);
    text(textMusic, width/2, height/2+25);
    text(textSfx, width/2, height/2-35);
    textAlign(LEFT);
    
    sfxVolume.show();
    musicVolume.show();
    goBackButton.show();
  }
  
  public boolean isGoBackButtonPressed(){
    return goBackButton.getIsPressed();
  }
 
}
