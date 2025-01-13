public class LevelThree{
  Player player;
  Bush[] bush;
  Car car1;
  Car[] car2;
  Car[] car3;
  Car[] car4;
  Road[] road;
  Goal goal;
  
  public LevelThree(){
    this.player = new Player();
    
    this.car1 = new Car(100, 850, 13, false, color(90, 7, 138), 1, 1);
    
    this.car2 = new Car[4];
    this.car2[0] = new Car(150, 700, 7, true, color(0, 162, 250), 6, 1);
    this.car2[1] = new Car(150, 700, 7, true, color(71, 137, 173), 1, 6);
    this.car2[2] = new Car(100, 650, 9, false, color(0, 33, 219), 1, 8);
    this.car2[3] = new Car(100, 650, 9, false, color(66, 238, 255), 8, 1);
    
    this.car3 = new Car[6];
    this.car3[0] = new Car(50, 400, 10, true, color(249, 207, 255), 1, 8);
    this.car3[1] = new Car(50, 400, 10, true, color(255), 4, 4);
    this.car3[2] = new Car(50, 400, 10, true, color(125, 229, 255), 8, 1);
    this.car3[3] = new Car(100, 350, 7, false, color(249, 207, 255), 1, 10);
    this.car3[4] = new Car(100, 350, 7, false, color(255), 5, 5);
    this.car3[5] = new Car(100, 350, 7, false, color(125, 229, 255), 10, 1);
    
    this.car4 = new Car[2];
    this.car4[0] = new Car(400, 250, 7, true, color(209, 4, 4), 1, 10);
    this.car4[1] = new Car(400, 250, 7, true, color(0, 176, 18), 10, 1);
    
    this.bush = new Bush[6];
    this.bush[0] = new Bush(200, 100);
    this.bush[1] = new Bush(1400, 100);
    this.bush[2] = new Bush(300, 500);
    this.bush[3] = new Bush(1300, 500);
    this.bush[4] = new Bush(400, 725);
    this.bush[5] = new Bush(1200, 725);
    
    this.road = new Road[6];
    this.road[0] = new Road(850);
    this.road[1] = new Road(700);
    this.road[2] = new Road(650);
    this.road[3] = new Road(400);
    this.road[4] = new Road(350);
    this.road[5] = new Road(250);
    this.goal = new Goal();
  }
  
  public Goal getGoal(){
    return goal;
  }
  
  public void show(){
    for(int i = 0; i<6;i++){
      road[i].show();
    }
    
    car1.show();
    car1.runOverPlayer(player);
    
    for(int i = 0; i<4;i++){
      car2[i].show();
      car2[i].runOverPlayer(player);
    }
    
    for(int i = 0; i<6; i++){
      car3[i].show();
      car3[i].runOverPlayer(player);
    }
    
    for(int i = 0; i<2; i++){
      car4[i].show();
      car4[i].runOverPlayer(player);
    }
    
    goal.show();
    player.show();
    goal.reachGoal(player);
    
    for(int i = 0; i<6;i++){
      bush[i].show();
    }
  }

}
