/* 24 May 2019*
 *game description*
 *by Cho Keun Hee*/



PFont f;
String s[] = {"This is a game of", "blockbreaking!!",
              "To start the game", "Please click",
              "a button of mouse.", "Good Luck!!"};
int num = 0;

void setup(){
  size(400, 500);
  noStroke();
  colorMode(HSB, 100, 100, 100);
  f = createFont("Arial", 30, true);
  textAlign(CENTER);
  fill(0, 100, 100);
}

void draw(){
  background(0);
  int size = 50;
  int line = s.length;

  if(++num > 39){
    num = 0;
  }
  int place = 300 - 10 * num;
  
  while(line > 0 && place > 50 && size > 10){
    size = place / 5;
    textFont(f, size);
    text(s[--line], width / 2, place);
    place -= size;
  }
  delay(150);
}
