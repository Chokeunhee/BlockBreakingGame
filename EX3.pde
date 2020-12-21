/* 18 May 2019*
 *block breaking by ball*
 *by Cho Keun Hee*/
 
float blockWidth = 78;
float blockHeight = 30;
float ballWidth = 7;  // ball width
float ballHeight = 7; // ball height
int block[][] = new int [5][5]; // 0;invisible, 1;visible
float ballX; // X coordinate value of the ball
float ballY;  // Y coordinate value of the ball
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
  for(int y = 0; y<5; y++){
    for(int x = 0; x<5; x++){
      block[x][y] = 1;
    }
  }
 
  ballX = 150;
  ballY = 250;
  speedX = 3;
  speedY = 3;
}

// running the game
void gamePlay(){
  blockDisp();
  ballMove();
  ballDisp();
}

void blockDisp(){
  float blockX, blockY;
  for(int y=0; y<5; y++){
    fill(15*y,100,100);
    blockY = 50 + y*(blockHeight + 2);
    for(int x=0; x<5; x++){
      blockX = x* (blockWidth+2);
      blockHitCheck(x,y,blockX,blockY);
      if(block[x][y] == 1){
        rect(blockX, blockY, blockWidth, blockHeight, 2);
      }
    }
  }
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

void blockHitCheck(int x, int y, float blockX, float blockY){
  float x1 = ballX - blockX;
  float x2 = blockX + blockWidth - ballX;
  float y1 = ballY - blockY;
  float y2 = blockY + blockHeight - ballY;
  float xMin, yMin;
  
  if(block[x][y]!=0){
    if(x1>0 && x2>0 && y1>0 && y2>0){
      block[x][y]=0;
      if(x1>x2){
        xMin = x2;
      }
      else{
        xMin = x1;
      }
      if(y1>y2){
        yMin = y2;
      }
      else{
        yMin = y1;
      }
      if(xMin < yMin){
        speedX = -speedX;
      }
      else{
        speedY = -speedY;
      }
    }
  }
}
