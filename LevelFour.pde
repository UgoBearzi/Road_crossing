public class LevelFour{
  Player player;
  Bush[] bush;
  Car[] car1;
  Car[] car2;
  Car[] car3;
  Car[] car4;
  Road[] road;
  Goal goal;
  
  public LevelFour(){
    this.player = new Player();
    
    this.bush = new Bush[5];
    this.bush[0] = new Bush(200, 100);
    this.bush[1] = new Bush(1000, 375);
    this.bush[2] = new Bush(300, 575);
    this.bush[3] = new Bush(1300, 800);
    this.bush[4] = new Bush(600, 850);
    
    this.car1 = new Car[2];
    this.car1[0] = new Car(100, 900, 15, false, color(0), 1, 1);
    this.car1[1] = new Car(100, 850, 15, true, color(0), 1, 1);
    
    this.car2 = new Car[4];
    this.car2[0] = new Car(100, 750, 9, false, color(0), 1, 6);
    this.car2[1] = new Car(100, 750, 9, false, color(0), 6, 1);
    this.car2[2] = new Car(100, 700, 11, true, color(0), 1, 10);
    this.car2[3] = new Car(100, 700, 11, true, color(0), 10, 1);
    
    this.car3 = new Car[3];
    this.car3[0] = new Car(200, 600, 10, false, color(0), 1, 1);
    this.car3[1] = new Car(200, 550, 7, true, color(0), 1, 1);
    this.car3[2] = new Car(200, 500, 10, false, color(0), 1, 1);
    
    this.car4 = new Car[2];
    this.car4[0] = new Car(50, 400, 20, true, color(0), 1, 1);
    this.car4[1] = new Car(800, 350, 3, false, color(0), 1, 1);
    
    this.road = new Road[9];
    this.road[0] = new Road(900);
    this.road[1] = new Road(850);
 
    this.road[2] = new Road(750);
    this.road[3] = new Road(700);
    
    this.road[4] = new Road(600);
    this.road[5] = new Road(550);
    this.road[6] = new Road(500);
    
    this.road[7] = new Road(400);
    this.road[8] = new Road(350);
    
    this.goal = new Goal();
  }
  
  public Goal getGoal(){
    return goal;
  }
  
  public void show(){
    for(int i = 0; i<9;i++){
      road[i].show();
    }
    
    for(int i = 0; i<2;i++){
      car1[i].show();
      car1[i].runOverPlayer(player);
    }
    
    for(int i = 0; i<4;i++){
      car2[i].show();
      car2[i].runOverPlayer(player);
    }
    
    for(int i = 0; i<3;i++){
      car3[i].show();
      car3[i].runOverPlayer(player);
    }
    
    for(int i = 0; i<2;i++){
      car4[i].show();
      car4[i].runOverPlayer(player);
    }
 
    goal.show();
    player.show();
    goal.reachGoal(player);
    
    for(int i = 0; i<5;i++){
      bush[i].show();
    }
  }

}
