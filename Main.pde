import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.*;
import processing.sound.*;

//enums
enum Menu{
  LOGINMENU,
  MAINMENU,
  OPTIONSMENU,
  LEVELSELECTMENU,
  LEVEL
}
Menu menus;

//Sound selection for easier sound access
enum SoundSelection{
  MOUSECLICK
}

Player player;
Obstacle obstacle;

//menus
LoginMenu loginMenu;
MainMenu mainMenu;
OptionsMenu optionsMenu;
LevelSelectMenu levelMenu;


//to avoid buttons being pressed at the same time
long startTime,timeBeforeMenuCanBeSeen;


//sounds
SoundFile clickSound;
SoundFile music;

public void setupSounds(){
  clickSound = new SoundFile(this, "click.mp3");
  music = new SoundFile(this, "funny.mp3");
  music.loop();
}

public void setup(){
  size(1600,1000);
  
  //startTime is for knowing the start time of the programm
  startTime = System.currentTimeMillis();
  //time before a menu loads
  timeBeforeMenuCanBeSeen = 100;
  
  loginMenu = new LoginMenu();
  mainMenu = new MainMenu();
  optionsMenu = new OptionsMenu();
  levelMenu = new LevelSelectMenu();
  
  menus = Menu.LOGINMENU;
  
  player = new Player();
  obstacle = new Obstacle();
  
  setupSounds();
}

//puts the start time at the current time (used to know when a button was last pressed)
public void resetStartTime(){
  startTime = System.currentTimeMillis();
}

//checks if the last time a button has been pressed is greater or equal to the delay between menus
public boolean checkIfMenuCanBeSeen(){
  return System.currentTimeMillis() - startTime >= timeBeforeMenuCanBeSeen;
}

public void playSound(SoundSelection selection){
  switch(selection){
    case MOUSECLICK:
      clickSound.play();
      break;
    default:
      break;
  }
}

public void readUserInfo(){
  new File("Users").mkdirs();
  String folderPath = dataPath("Users");
  File folder = new File(folderPath);
  File[] arrayOfFiles = folder.listFiles();
  BufferedReader reader;
  for(int i = 0; i < arrayOfFiles.length; i++){
    try{
      reader = createReader(arrayOfFiles[i]);
      String username = reader.readLine();
      String password = reader.readLine();
      loginMenu.loginManager(username,password);
      reader.close();
    }catch(IOException e){
      e.printStackTrace();
    }
    if(loginMenu.getIsLoginCorrect()){
      menus = Menu.MAINMENU;
      resetStartTime();
      break;
    }
  }
}

public void loginMenuManager(){
  if(loginMenu.getConfirmButton().getIsPressed()){
    playSound(SoundSelection.MOUSECLICK);
    readUserInfo();
  }
  loginMenu.show();
}

public void mainMenuManager(){
  mainMenu.show();
  if(mainMenu.isStartButtonPressed()){
    playSound(SoundSelection.MOUSECLICK);
    menus = Menu.LEVELSELECTMENU;
    resetStartTime();
  }
  if(mainMenu.isOptionsButtonPressed()){
    playSound(SoundSelection.MOUSECLICK);
    menus = Menu.OPTIONSMENU;
    resetStartTime();
  }
}

public void optionsMenuManager(){
  optionsMenu.show();
  if(optionsMenu.isGoBackButtonPressed()){
    playSound(SoundSelection.MOUSECLICK);
    menus = Menu.MAINMENU;
    resetStartTime();
  }
}

public void levelSelectMenuManager(){
  levelMenu.show();
  if(levelMenu.anyLevelSelected()){
    menus = Menu.LEVEL;
    resetStartTime();
  }
}

public void audioManager(){
  clickSound.amp(optionsMenu.getSfxVolume() / 100f);
  music.amp(optionsMenu.getMusicVolume() / 100f);
}

public void levelManager(){
  
  
  switch(levelMenu.levelSelected()){
      case 1:
        player.show();
        obstacle.show();
        player.moveIfObstacle(obstacle);
        break;
      case 2:
        text("2", width/2, height/2+200);
        break;
      case 3:
        text("3", width/2, height/2+200);
        break;
      case 4:
        text("4", width/2, height/2+200);
        break;
      case 5:
        text("5", width/2, height/2+200);
        break;
       default:
         break;
    }
}

public void menuManager(){
  if(checkIfMenuCanBeSeen()){
    cursor(ARROW);
    switch(menus){
      case LOGINMENU:
        loginMenuManager();
        break;
      case MAINMENU:
        mainMenuManager();
        break;
      case OPTIONSMENU:
        optionsMenuManager();
        break;
      case LEVELSELECTMENU:
        levelSelectMenuManager();
        break;
      case LEVEL:
        levelManager();
        break;
    }
  }else{
    cursor(WAIT);
  }
}



public void draw(){
  background(190);
  menuManager();
  levelManager();
  audioManager();
  
}
