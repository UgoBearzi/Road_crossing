LoginMenu loginMenu;

public void setup(){
  size(1600,1000);
  loginMenu = new LoginMenu();
}

public void draw(){
  background(190);
  if(!loginMenu.getIsLoginCorrect()){
    loginMenu.show();
  }
}
