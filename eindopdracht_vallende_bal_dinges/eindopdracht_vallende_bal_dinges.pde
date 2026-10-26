float ballX;
float ballY;
float ballSize = 70;
float ballSpeed = 5;

float paddleW = 120;
float paddleH = 15;
float paddleY = 560;

void setup() {
  size(400, 600);
  nieuweBal();
}

void draw() {
  background(255);
  fill(0);
  noStroke();

  // de bal
  ellipse(ballX, ballY, ballSize, ballSize);

  // de paddle werkt met muis
  rect(mouseX - paddleW / 2, paddleY, paddleW, paddleH);

  // de bal valt
  ballY = ballY + ballSpeed;

  // als de bal de paddle ding aanraakt bevriest het spel compleet
  boolean opHoogtePaddle = ballY + ballSize / 2 >= paddleY;
  boolean opPaddle = abs(ballX - mouseX) < paddleW / 2 + ballSize / 4;
  if (opHoogtePaddle && opPaddle) {
    noLoop();
  }

  // als de bal valt dan gaat het spel verder
  if (ballY - ballSize / 2 > height) {
    nieuweBal();
  }
}

void nieuweBal() {
  ballX = random(ballSize, width - ballSize);
  ballY = -ballSize;
}

//eind tekst: ik vind het eigenlijk meer een spel waar je de ballen moet vermijden anders stopt het spel.
