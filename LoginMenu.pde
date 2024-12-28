final class LoginMenu{
  Textbox usernameTextbox;
  Textbox passwordTextbox;
  Button confirmButton;
  String warning;
  boolean isLoginCorrect;
  
  
  
  public LoginMenu(){
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
  
  public void show(){
    usernameTextbox.show();
    passwordTextbox.show();
    confirmButton.show();
    
    loginManager();
    textSize(16);
    textAlign(CENTER);
    fill(255, 0, 0);
    text(warning, width/2, height/2+200);
    textAlign(LEFT);
  }
  
  private boolean usernameCorrect(){
    return usernameTextbox.getText().equals("bob");
  }
  
  private boolean passwordCorrect(){
    return passwordTextbox.getText().equals("password");
  }
  
  public void loginManager(){
    if(confirmButton.getIsPressed()){
      if(usernameCorrect() && passwordCorrect()){
        setIsLoginCorrect(true);
      }else{
        warning = "get fucked";
      }
    }
  }
  
}
