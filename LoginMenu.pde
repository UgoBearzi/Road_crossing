final class LoginMenu{
  private PImage title;
  private Textbox usernameTextbox;
  private Textbox passwordTextbox;
  private Button confirmButton;
  private String warning;
  private boolean isLoginCorrect;
  
  public LoginMenu(){
    this.title = loadImage("Road Crossing.png");
    this.usernameTextbox = new Textbox(width/2, height/2-50, "Username");
    this.passwordTextbox = new Textbox(width/2, height/2, "Password");
    this.confirmButton = new Button(width/2, height/2+75, "Login", 16);
    this.warning = "";
    this.isLoginCorrect = false;
  }
  
  public boolean getIsLoginCorrect(){
    return isLoginCorrect;
  }
  
  public void setIsLoginCorrect(boolean isLoginCorrect){
    this.isLoginCorrect = isLoginCorrect;
  }
  
  public Button getConfirmButton(){
    return confirmButton;
  }
  
  public Textbox getUsernameTextbox(){
    return usernameTextbox;
  }
  public Textbox getPasswordTextbox(){
    return passwordTextbox;
  }
  
  public void show(){
    image(title,width/2-195, height/2-230,390,160);
    usernameTextbox.show();
    passwordTextbox.show();
    confirmButton.show();
    
    textSize(16);
    textAlign(CENTER);
    fill(255, 0, 0);
    text(warning, width/2, height/2+200);
    textAlign(LEFT);
  }
  
  private boolean usernameCorrect(String username){
    return getUsernameTextbox().getText().equals(username);
  }
  
  private boolean passwordCorrect(String password){
    return getPasswordTextbox().getText().equals(password);
  }
  
  public void changeWarning(String input){
    this.warning = input;
  }
  
  public void loginManager(String username, String password){
    if(getConfirmButton().getIsPressed()){
      if(usernameCorrect(username) && passwordCorrect(password)){
        setIsLoginCorrect(true);
      }else{
        changeWarning("wrong username or password");
        setIsLoginCorrect(false);
      }
    }
  }
}
