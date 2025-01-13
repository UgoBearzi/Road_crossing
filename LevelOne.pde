public class LevelOne{
  Player player;
  Bush[] bush;
  Car[] car;
  Road[] road;
  Goal goal;
  
  public LevelOne(){
    this.player = new Player();
    
    this.bush = new Bush[4];
    this.bush[0] = new Bush(200, 100);
    this.bush[1] = new Bush(1000, 150);
    this.bush[2] = new Bush(300, 550);
    this.bush[3] = new Bush(1300, 550);
    
    this.car = new Car[5];
    this.car[0] = new Car(100, 800, 5, true, color(0), 1, 1);
    this.car[1] = new Car(100, 600, 5, false, color(0,255,0), 1,1);
    this.car[2] = new Car(100, 650, 5, true, color(255,0,0), 1,1);
    this.car[3] = new Car(100, 300, 10, false, color(0,255,0), 1,1);
    this.car[4] = new Car(100, 350, 10, true, color(255,0,0), 1,1);
    
    this.road = new Road[5];
    this.road[0] = new Road(800);
    this.road[1] = new Road(600);
    this.road[2] = new Road(650);
    this.road[3] = new Road(300);
    this.road[4] = new Road(350);
    this.goal = new Goal();
  }
  
  public Goal getGoal(){
    return goal;
  }
  
  public void show(){
    for(int i = 0; i<4;i++){
      bush[i].show();
    }
    
    for(int i = 0; i<5;i++){
      road[i].show();
      car[i].show();
      car[i].runOverPlayer(player);
    }
 
    goal.show();
    player.show();
    goal.reachGoal(player);
  }

}
