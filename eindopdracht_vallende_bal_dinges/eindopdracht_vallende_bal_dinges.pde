class Ball {
  float ballX;
  float ballY;
  float ballSize;
  float ballSpeed;

  Ball(float ballSize, float ballSpeed) {
    this.ballSize = ballSize;
    this.ballSpeed = ballSpeed;
    nieuweBal();
  }

  void beweeg() {
    ballY = ballY + ballSpeed;
  }

  void teken() {
    ellipse(ballX, ballY, ballSize, ballSize);
  }

  // zet de bal weer boven het scherm op een random plek
  void nieuweBal() {
    ballX = random(ballSize, width - ballSize);
    ballY = -ballSize;
  }

  boolean isOnderUitBeeld() {
    return ballY - ballSize / 2 > height;
  }
}

Ball b;

float paddleW = 120;
float paddleH = 15;
float paddleY = 560;

void setup() {
  size(400, 600);
  b = new Ball(70, 5);
}

void draw() {
  background(255);
  fill(0);
  noStroke();

  // de bal
  b.teken();

  // de paddle werkt met muis
  rect(mouseX - paddleW / 2, paddleY, paddleW, paddleH);

  // de bal valt
  b.beweeg();

  // als de bal de paddle raakt, stopt het spel
  boolean opHoogtePaddle = b.ballY + b.ballSize / 2 >= paddleY;
  boolean opPaddle = abs(b.ballX - mouseX) < paddleW / 2 + b.ballSize / 4;
  if (opHoogtePaddle && opPaddle) {
    noLoop();
  }

  // als de bal onderuit valt, komt er een nieuwe bal
  if (b.isOnderUitBeeld()) {
    b.nieuweBal();
  }
}
