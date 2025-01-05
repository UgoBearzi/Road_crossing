class Obstacle {
  int positionX, positionY, obstacleSize;
  color objectColor;
  boolean canMoveUp,canMoveDown,canMoveLeft,canMoveRight;

  Obstacle(int positionX, int positionY, int obstacleSize) {
    this.positionX = positionX;
    this.positionY = positionY;
    this.obstacleSize = obstacleSize;
    this.canMoveUp = true;
    this.canMoveDown = true;
    this.canMoveLeft = true;
    this.canMoveRight = true;
  }
 
  public void obstacleAppearance(){
    // Base del cono
    fill(150); // Grigio scuro per la base
    rect(positionX - obstacleSize / 2, positionY, obstacleSize, obstacleSize / 4);

    // Corpo del cono
    fill(255, 165, 0); // Arancione
    triangle(positionX - obstacleSize / 2, positionY, positionX + obstacleSize / 2, positionY, positionX, positionY - obstacleSize);

    // Striscia bianca del cono
    fill(255); // Bianco
    float stripeHeight = obstacleSize / 4;
    rect(positionX - obstacleSize / 4, positionY - stripeHeight, obstacleSize / 2, obstacleSize / 2);
  }
  
  public void show(){
    obstacleAppearance();
  }
  
  void checkCollision(Player player) {
    // Reset dei movimenti
    canMoveUp = true;
    canMoveDown = true;
    canMoveLeft = true;
    canMoveRight = true;
    
    // Calcola i confini del quadrato mobile e dell'ostacolo
    i squareRight = squareX + squareSize;
    float squareBottom = squareY + squareSize;
    float obstacleRight = x + size;
    float obstacleBottom = y + size;

    // Controllo collisioni su vari lati
    if (squareBottom > y && squareY < obstacleBottom && squareRight > x && squareX < obstacleRight) {
      if (squareBottom > y && squareY < y) {
        // Ostacolo sopra
        canMoveUp = false;
      }
      if (squareY < obstacleBottom && squareBottom > obstacleBottom) {
        // Ostacolo sotto
        canMoveDown = false;
      }
      if (squareRight > x && squareX < x) {
        // Ostacolo a destra
        canMoveRight = false;
      }
      if (squareX < obstacleRight && squareRight > obstacleRight) {
        // Ostacolo a sinistra
        canMoveLeft = false;
      }
    }
  }
  
  // Getter per i movimenti
  boolean canMoveUp() {
    return canMoveUp;
  }

  boolean canMoveDown() {
    return canMoveDown;
  }

  boolean canMoveLeft() {
    return canMoveLeft;
  }

  boolean canMoveRight() {
    return canMoveRight;
  }
  
}
