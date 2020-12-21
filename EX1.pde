/* 10 May 2019*
 *Display block*
 *by Cho Keun Hee*/

float blockWidth = 78;
float blockHeight = 30;

void setup(){
  size(400, 500);
  noStroke();
  colorMode(HSB, 100, 100, 100);
}

void draw(){
  background(0);
  blockDisp();
}

void blockDisp(){
  float blockX, blockY;
  for(int y=0; y<5; y++){
    fill(15*y,100,100);
    blockY = 50 + y*(blockHeight+2);
    for(int x=0; x<5; x++){
      blockX = x* (blockWidth+2);
      rect(blockX, blockY, blockWidth, blockHeight, 2);
    }
  }
}
