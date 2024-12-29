import java.io.File;
import java.io.FileReader;
import java.io.IOException;

LoginMenu loginMenu;

public void setup(){
  size(1600,1000);
  loginMenu = new LoginMenu();
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
      break;
    }
  }
}

public void showLoginMenu(){
  if(loginMenu.getConfirmButton().getIsPressed()){
    readUserInfo();
  }
  if(!loginMenu.getIsLoginCorrect()){
    loginMenu.show();
  }
}

public void draw(){
  background(190);
  showLoginMenu();
}
