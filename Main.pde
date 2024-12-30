import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.*;
import processing.sound.*;

enum Menu{
  LOGINMENU,
  MAINMENU,
  OPTIONSMENU,
  LEVELSELECTMENU
}

LoginMenu loginMenu;
MainMenu mainMenu;
OptionsMenu optionsMenu;
SoundFile file;

//to avoid buttons being pressed at the same time
long startTime;
long timeBeforeMenuCanBeSeen;

Menu menus;

public void setup(){
  size(1600,1000);
  file = new SoundFile(this, "funny.mp3");
  //startTime is for knowing the start time of the programm
  startTime = System.currentTimeMillis();
  //time before a menu loads
  timeBeforeMenuCanBeSeen = 100;
  
  loginMenu = new LoginMenu();
  mainMenu = new MainMenu();
  optionsMenu = new OptionsMenu();
  
  menus = Menu.LOGINMENU;
}

//puts the start time at the current time (used to know when a button was last pressed)
public void resetStartTime(){
  startTime = System.currentTimeMillis();
}

//checks if the last time a button has been pressed is greater or equal to the delay between menus
public boolean checkIfMenuCanBeSeen(){
  return System.currentTimeMillis() - startTime >= timeBeforeMenuCanBeSeen;
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
    readUserInfo();
  }
  loginMenu.show();
}

public void mainMenuManager(){
  mainMenu.show();
  if(mainMenu.isStartButtonPressed()){
    menus = Menu.LEVELSELECTMENU;
    resetStartTime();
  }
  if(mainMenu.isOptionsButtonPressed()){
    menus = Menu.OPTIONSMENU;
    resetStartTime();
  }
}

public void optionsMenuManager(){
  optionsMenu.show();
  if(optionsMenu.isGoBackButtonPressed()){
    menus = Menu.MAINMENU;
    resetStartTime();
  }
}

public void draw(){
  background(190);
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
        break;
    }
  }else{
    cursor(WAIT);
  }
}
