/*********************************************************************
* 1. Game Starting Page displayed first                               *
* 2. Easy game mode created (press 1 at starting page to show)        *
* 3. Hard game mode created (press 2 at starting page to show)        *
* 4. Credit page made (press 3 at starting page to show)              *
* 5. For easy mode   - score displayed in the upper left              *
*                    - life displayed in the upper right              *
*                    - diffriculty of Mode displayed lower left       *
*                    - press P to pause                               *
*                    - number of block decreased to 16(4*4)           *
* 6. For hard mode   - score displayed in the upper left              *
*                    - life displayed in the upper right              *
*                    - diffriculty of Mode displayed lower left       *
*                    - press P to pause                               *
*                    - number of block increased to 49(7*7)           *
*                    - add accerlation to ball speed                  *
* 7. for'pause' page - press C to continue game                       *
*                    - press Q to Quit playing and show starting page *
* 8. Game Success page made with score and click to go to startpage   *
* 9. Game Failure page made with score and click to go to startpage   *
*                                                                     *
* 30 May 2019                                                         *
* by CHO KEUN HEE                                                     *
**********************************************************************/

//Basic variable
int gameMode = 0;
float ballX;  
float ballY;  
float ballWidth = 8;  
float ballHeight = 8; 
float speedX;  
float speedY;  
float paddleX;  
float paddleY;  
float paddleWidth = 70;  
float paddleHeight = 20; 
int block[][] = new int[7][7];  
float blockWidth = 55;  
float blockHeight = 25; 
int count = 0; 
PFont f;
int scoreDisp = 0;
int life = 2;
//==========================================================

//Setup
void setup(){
  size(400, 500);
  noStroke();
  colorMode(HSB, 100, 100, 100);
  textAlign(CENTER);
  gameInit();
}

//GameMode
void draw(){
  background(0);
  if (gameMode == 0){
    StartPage();
  } else if(gameMode == 1){
    IntroPage();
  } else if(gameMode == 2){
    gameLv1();
  } else if(gameMode == 3){
    gameLv2();
  } else if(gameMode == 4){
    gameWaiting();
  } else if(gameMode == 5){
    gameContinue();
  } else if(gameMode == 6){
    gameLose();
  } else if(gameMode == 7){
    gameWin();
  } else if(gameMode == 8){
    gamePasued_1();
  } else if(gameMode == 9){
    gamePasued_2();
  } else if(gameMode == 10){
    Start();
  } else if(gameMode == 11){
    Start_2();
  }
}

// GameInit
void gameInit(){
  gameMode = 0;
  ballX = 200;
  ballY = 300;
  speedX = 3;
  speedY = 2;
  paddleX = 150;
  paddleY = 400;
  life = 2;
  scoreDisp = 0;
  for(int x = 0; x < 7; x++){
    for(int y = 0; y < 7; y++){
      block[x][y] = 1;
    }
  }
}

//=======================================================

// StartPage
void StartPage(){
//title
  textSize(30);
  fill(0, 0, 100);
  text("Block Breaking Game!", 200, 100);
//stage selection  
  textSize(20);
  fill(0, 0, 100);
  text("Select your stage", 200, 250);
//Lv1
  textSize(15);
  fill(0, 0, 100);
  text("E A S Y - press 1", 200, 300);
  //Lv2
  textSize(15);
  fill(0, 0, 100);
  text("H A R D - press 2", 200, 350);
  //Made by
  textSize(15);
  fill(0, 0, 100);
  text("Credits- press 3", 300, 450);
  //keypress
  if(keyPressed){
    if(key == '1' || key == '!'){
      gameMode = 10; //Lv1
    } else if(key == '2' || key == '@'){
      gameMode = 11; //Lv2
    } else if(key == '3' || key == '#'){
      gameMode = 1; //Intro
  }
}
}
//IntroPage
void IntroPage(){
  textSize(25);
  fill(0, 0, 100);
  text("Credits", 200, 50); 
  textSize(20);
  fill(0, 0, 100);
  text("Producer | Cho Keun Hee", 200, 100);  
  textSize(20);
  fill(0, 0, 100);
  text("Programmer | Cho Keun Hee", 200, 150);  
  textSize(20);
  fill(0, 0, 100);
  text("Designer | Cho Keun Hee", 200, 200);
  textSize(20);
  fill(0, 0, 100);
  text("Press 'M' to go to Menu", 200, 450);
  if(keyPressed){
    if(key == 'm' || key == 'M'){
      gameMode = 0;
    }
  }
  
}

//Start_LV1
void Start(){
  playerMove();
  playerDisp();
  blockDisp();
  ballDisp();
  lifeDisp();
  textSize(20);
  fill(0,0,100);
  text("Easy",50,480);
  textSize(15);
  fill(0, 0, 100);
  text(scoreDisp, 90, 40);
  textSize(15);
  fill(0, 0, 100);
  text("Score:", 30, 40);
  textSize(15);
  fill(0,0,100);
  text(life,350,40);
  textSize(15);
  fill(0,0,100);
  text("Life:",310, 40);
  textSize(20);
  fill(0,0,100);
  text("Click to Start",300, 480);
}   

//Start_LV2
void Start_2(){
  playerMove();
  playerDisp();
  blockDisp_2();
  ballDisp();
  lifeDisp();
  textSize(20);
  fill(0,0,100);
  text("Hard",50,480);
  textSize(15);
  fill(0, 0, 100);
  text(scoreDisp, 90, 40);
  textSize(15);
  fill(0, 0, 100);
  text("Score:", 30, 40);
  textSize(15);
  fill(0,0,100);
  text(life,350,40);
  textSize(15);
  fill(0,0,100);
  text("Life:",310, 40);
  textSize(20);
  fill(0,0,100);
  text("Click to Start",300, 480);
  
}
   
//Game Lv 1
void gameLv1(){
  playerMove();
  playerDisp();
  blockDisp();
  ballMove();
  ballDisp();
  lifeDisp();
  
  textSize(20);
  fill(0,0,100);
  text("Easy",50,480);
  
  textSize(15);
  fill(0, 0, 100);
  text(scoreDisp, 90, 40);
  
  textSize(15);
  fill(0, 0, 100);
  text("Score:", 30, 40);
  
  textSize(15);
  fill(0,0,100);
  text(life,350,40);
  
  textSize(15);
  fill(0,0,100);
  text("Life:",310, 40);
  
  textSize(20);
  fill(0,0,100);
  text("Press P to pause",300, 480);
  
  if(keyPressed){
    if(key == 'p' || key == 'P'){
      gameMode = 8; //Pause
    } 
  }
}
  
//Game Lv 2
void gameLv2(){
  playerMove();
  playerDisp();
  blockDisp_2();
  ballMove_2();
  ballDisp();
  lifeDisp();
  
  textSize(20);
  fill(0,0,100);
  text("Hard",50,480);
  
  textSize(15);
  fill(0, 0, 100);
  text(scoreDisp, 90, 40);
  
  textSize(15);
  fill(0, 0, 100);
  text("Score:", 30, 40);
  
  textSize(15);
  fill(0,0,100);
  text(life,350,40);
  
  textSize(15);
  fill(0,0,100);
  text("Life:",310, 40);
  
  textSize(20);
  fill(0,0,100);
  text("Press P to pause",300, 480);
  
  if(keyPressed){
    if(key == 'p' || key == 'P'){
      gameMode = 9; //Pause
    } 
  }
}

//GameLose
void gameLose(){
  textSize(20);
  fill(0, 0, 100);
  text("Your Score is", 200, 100);
  textSize(20);
  fill(0,0,100);
  text(scoreDisp, 200, 150);
  textSize(20);
  fill(0,0,100);
  text("GAME OVER", 200, 250);
  textSize(20);
  fill(0, 0, 100);
  text("Click to Retry", 200, 300);
}

//GameWin
void gameWin(){
  textSize(20);
  fill(0, 0, 100);
  text("Your Score is", 200, 100);
  textSize(20);
  fill(0, 0, 100);
  text(scoreDisp, 200, 150);
  textSize(20);
  fill(0, 0, 100);
  text("Congratulations!", 200, 250);
  textSize(20);
  fill(0, 0, 100);
  text("Click to Play Again", 200, 300);
  
}
  
//GameWaiting
void gameWaiting(){
  textSize(20);
  fill(1, 100, 100);
  text("Click to continue", 200, 300);
  if(mousePressed){
  gameContinue();
  }
}

//GameContinue
void gameContinue(){
  ballInit();
  life = life - 1;
}  

//GamePasued for LV1
void gamePasued_1(){
  textSize(30);
  fill(0, 0, 100);
  text("Press C to Continue", 200, 200);
  textSize(30);
  fill(0, 0, 100);
  text("Press Q to Quit Game", 200, 300);
  if(keyPressed){
    if(key == 'c' || key == 'C'){
      gameMode = 2;
    } else if(key == 'q' || key == 'Q'){
      gameInit();
      gameMode = 0;
    }
  }
}

//gamePasued for LV2
void gamePasued_2(){
  textSize(30);
  fill(0, 0, 100);
  text("Press C to Continue", 200, 200);
  textSize(30);
  fill(0, 0, 100);
  text("Press Q to Quit Game", 200, 300);
  if(keyPressed){
    if(key == 'c' || key == 'C'){
      gameMode = 3;
    } else if(key == 'q' || key == 'Q'){
      gameInit();
      gameMode = 0;
    }
  }
}
  

//=================================================

void playerMove(){
  paddleX = mouseX;
  if(paddleX + paddleWidth >= width){
    paddleX = width - paddleWidth;
   }
 }
 
void playerDisp(){
  fill(0, 0, 255);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}
  
void lifeDisp(){
    if(life == 0){
    gameMode = 6;
   }
}
  
void ballMove(){
  ballX += speedX;
  ballY += speedY;
  if(ballY >= 500 && life >= 1){  
    gameWaiting();
  }
  if(ballY >= 500 && life == 1){
    gameMode = 6;
  }
  if(ballY <= 45){  
    speedY = -speedY;    
  }
  if((ballX <= 0) || (ballX > width)){
    speedX = -speedX;
  }
  if(ballX >= paddleX && ballX <= paddleX+paddleWidth && ballY >= paddleY && ballY <= paddleY+paddleHeight){
        speedY = -speedY;
   }
}

void ballInit(){
    ballX = 200;
    ballY = 300;
    speedX = 3;
    speedY= 2;
}

void ballDisp(){
  imageMode(CENTER);
  fill(0, 0, 100);
  ellipse(ballX, ballY, ballWidth, ballHeight);
  imageMode(CORNER);
}

void blockDisp(){
  float blockX, blockY;
  count = 0;
  for(int y = 0; y < 4; y++){
    for(int x = 0; x <4; x++){
      if(block[x][y] == 1){
        fill(y * 15, 100, 100);
        blockX = 90 + x * (blockWidth + 5);
        blockY = 50 + y * (blockHeight + 5);
        blockHitCheck(x, y, blockX, blockY);
        if(block[x][y] == 1){
          count++;
          rect(blockX, blockY, blockWidth, blockHeight, 10);
        }
      }
    }
  }
  if(count == 0 ){
    gameMode = 7;  
  }
}

void blockHitCheck(int x, int y, float xx, float yy){
  if(ballX >= xx && ballX <= xx+blockWidth && ballY >= yy && ballY <= yy+blockHeight){
    block[x][y] = 0;
    speedY = -speedY;
    scoreDisp= scoreDisp+100;
  }
}

//======================================================

void ballMove_2(){
  ballX += speedX;
  ballY += speedY;
  if(ballY >= 500 && life >= 1){  
    gameWaiting();
  }
  if(ballY >= 500 && life == 1){
    gameMode = 6;
  }
  if(ballY <= 45){  
    speedY = -speedY;    
  }
  if((ballX <= 0) || (ballX > width)){
    speedX = -speedX;
  }
  if(ballX >= paddleX && ballX <= paddleX+paddleWidth && ballY >= paddleY && ballY <= paddleY+paddleHeight){
        speedY = -(speedY * 1.02);
   }
}

void blockDisp_2(){
  float blockX, blockY;
  count = 0;
  for(int y = 0; y < 7; y++){
    for(int x = 0; x <7; x++){
      if(block[x][y] == 1){
        fill(y * 15, 100, 100);
        blockX = x * (blockWidth + 2);
        blockY = 50 + y * (blockHeight + 2);
        blockHitCheck_2(x, y, blockX, blockY);
        if(block[x][y] == 1){
          count++;
          rect(blockX, blockY, blockWidth, blockHeight, 10);
        }
      }
    }
  }
  if(count == 0 ){
    gameMode = 7;  
  }
}

void blockHitCheck_2(int x, int y, float xx, float yy){
  if(ballX >= xx && ballX <= xx+blockWidth && ballY >= yy && ballY <= yy+blockHeight){
    block[x][y] = 0;
    speedY = -(speedY * 1.02);
    scoreDisp= scoreDisp+100;
  }
}

//======================================================
void mousePressed(){
  if(gameMode == 6){
    gameInit();
    gameMode = 0 ;
  } else if(gameMode == 7){
    gameInit();
    gameMode = 0;
  } else if(gameMode == 10){
    gameMode = 2;
  } else if(gameMode == 11){
    gameMode = 3;
  }
}


  
  
  
  
  
  
