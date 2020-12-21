/* 17 May 2019*
*Move a ball*
*by Cho keun hee*/

float ballX;  // X coordinate value of the ball
float ballY;  // Y coordinate value of the ball
float ballWidth = 7;  // ball width
float ballHeight = 7; // ball height
float speedX; //speed in X axis direction
float speedY; //speed in Y axis direction


void setup(){
  size(400, 500);
  noStroke();
  colorMode(HSB, 100, 100, 100);
  gameInit();
}

void draw(){
  background(0);
  gamePlay();
}

// initialization of the game
void gameInit(){
  ballX = 150;
  ballY = 250;
  speedX = 3;
  speedY = 3;
}

// running the game
void gamePlay(){
  ballMove();
  ballDisp();
}

// to display the ball
void ballDisp(){
  rectMode(CENTER);
  fill(0, 0, 100);
  rect(ballX, ballY, ballWidth, ballHeight);
  rectMode(CORNER);
}

//to decide move direction
void ballMove(){
  ballX += speedX;
  ballY += speedY;
  if(ballY < 0 || ballY > height){
    speedY = -speedY;
  }
  if(ballX < 0 || ballX > width){
    speedX = -speedX;
  }
}

  
  
  
  
  
  
  
  
  
  
  
