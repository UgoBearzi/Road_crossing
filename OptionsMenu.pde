class OptionsMenu{
  private PImage title;
  String textMusic;
  String textSfx;
  private Textbox musicVolumeTextbox;
  private Textbox sfxVolumeTextbox;
  private Button goBackButton;
  
  public OptionsMenu(){
    this.title = loadImage("Road Crossing.png");
    this.textSfx = "sound effects volume";
    this.sfxVolumeTextbox = new Textbox(width/2, height/2-25, "sfx volume",3,true,"100");
    this.textMusic = "musics volume";
    this.musicVolumeTextbox = new Textbox(width/2, height/2+35, "music volume",3,true,"100");
    this.goBackButton = new Button(width/2, height/2+100, "Go back", 16);
  }
  
  public Textbox getSfxVolumeTextbox(){
    return sfxVolumeTextbox;
  }
  public Textbox getMusicVolumeTextbox(){
    return musicVolumeTextbox;
  }
  
  public void show(){
    image(title,width/2-195, height/2-330,390,160);
    
    textSize(16);
    textAlign(CENTER);
    fill(0);
    text(textMusic, width/2, height/2+25);
    text(textSfx, width/2, height/2-35);
    textAlign(LEFT);
    
    sfxVolumeTextbox.show();
    musicVolumeTextbox.show();
    goBackButton.show();
    
    resetVolumeIfOverLimits();
  }
  
  public boolean isGoBackButtonPressed(){
    return goBackButton.getIsPressed();
  }
  
  public int getSfxVolume(){
    return Integer.parseInt(getSfxVolumeTextbox().getText());
  }
  
  public int getMusicVolume(){
    return Integer.parseInt(getMusicVolumeTextbox().getText());
  }
  
  public void resetVolumeIfOverLimits(){
    
    //checks if the textbox is empty and replaces it with a zero
    if(getSfxVolumeTextbox().getText().equals("")){
      getSfxVolumeTextbox().setText("0");
    }
    //checks if the user has put more than 100 in the textbox and puts it at 100 if so
    if(getSfxVolume() > 100){
      getSfxVolumeTextbox().setText("100");
    //checks if the user has written a number after the zero and deletes the firsts zero
    } else if(getSfxVolume() > 0 && getSfxVolumeTextbox().getText().startsWith("0")){
      getSfxVolumeTextbox().setText(getSfxVolumeTextbox().getText().substring(1));
    }
    
    
    //checks if the textbox is empty and replaces it with a zero
    if(getMusicVolumeTextbox().getText().equals("")){
      getMusicVolumeTextbox().setText("0");
    }
    //checks if the user has put more than 100 in the textbox and puts it at 100 if so
    if(getMusicVolume() > 100){
      getMusicVolumeTextbox().setText("100");
    //checks if the user has written a number after the zero and deletes the firsts zero
    } else if(getMusicVolume() > 0 && getMusicVolumeTextbox().getText().startsWith("0")){
      getMusicVolumeTextbox().setText(getMusicVolumeTextbox().getText().substring(1));
    }
    
  }
 
}
