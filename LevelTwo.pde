public class LevelTwo{
  Player player;
  Bush[] bush;
  Car car1;
  Car car2;
  Car[] car3;
  Car[] car4;
  Road[] road;
  Goal goal;
  
  public LevelTwo(){
    this.player = new Player();
    
    this.car1 = new Car(100, 850, 7, true, color(70), 1, 1);
    this.car2 = new Car(250, 650, 5, false, color(0), 1, 1);
    this.car3 = new Car[3];
    this.car3[0] = new Car(100, 400, 7, true, color(70, 36, 191), 1, 6);
    this.car3[1] = new Car(100, 400, 7, true, color(70, 36, 191), 6, 1);
    this.car3[2] = new Car(100, 450, 9, false, color(36, 145, 191), 1, 1);
    this.car4 = new Car[4];
    this.car4[0] = new Car(100, 250, 5, true, color(163, 44, 38), 1, 10);
    this.car4[1] = new Car(100, 250, 5, true, color(163, 44, 38), 4, 7);
    this.car4[2] = new Car(100, 250, 5, true, color(163, 44, 38), 7, 4);
    this.car4[3] = new Car(100, 250, 5, true, color(163, 44, 38), 10, 1);
    
    this.road = new Road[5];
    this.road[0] = new Road(850);
    this.road[1] = new Road(650);
    this.road[2] = new Road(400);
    this.road[3] = new Road(450);
    this.road[4] = new Road(250);
    this.goal = new Goal();
  }
  
  public Goal getGoal(){
    return goal;
  }
  
  public void show(){
    for(int i = 0; i<5;i++){
      road[i].show();
    }
    
    car1.show();
    car1.runOverPlayer(player);
    
    car2.show();
    car2.runOverPlayer(player);
    
    for(int i = 0; i<3;i++){
      car3[i].show();
      car3[i].runOverPlayer(player);
    }
    
    for(int i = 0; i<4;i++){
      car4[i].show();
      car4[i].runOverPlayer(player);
    }
    
    goal.show();
    player.show();
    goal.reachGoal(player);
  }

}
