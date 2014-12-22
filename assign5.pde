
Ball ball;
Bar bar;
Brick[] bList;

final int GAME_START   = 0;
final int GAME_PLAYING = 1;
final int GAME_WIN     = 2;
final int GAME_LOSE    = 3;

int status; 
int life;

void setup(){
  
  size(680,480);


  bar = new Bar(100);
  ball = new Ball(-10,-10,0,0);
  
  bList = new Brick[100];
  status = GAME_START;




}

void printText(int x,String word,int positionY){
  textAlign(CENTER, CENTER);
  textSize(x);
  fill(95,194,226);
  text(word.substring(0,word.length()),width/2,positionY);
}

void draw(){  
  
  switch(status){
    
  case GAME_START:
    background(255);
    printText(60,"PONG GAME",240);
    printText(20,"Press ENTER to Start",280);
    break;
    
  case GAME_PLAYING:
    background(0);
     

     
    bar.move();
    bar.display();  
    ball.display();
    ball.move();
    
    drawBrick();
    BrickMaker(40,10);
    drawLife();
    
    if(ball.bY>height){
      ball.bY=-10;
      life--;
    }
    
    
 
  
   for (int i=0; i<bList.length-1; i++) {
    Brick brick= bList[i];
    if (brick!= null && !brick.die
      && ball.bX+ball.bSize/2>=(brick.bX-brick.bSize)
      && ball.bX-ball.bSize/2<=(brick.bX+brick.bSize)
      && ball.bY+ball.bSize/2>=(brick.bY-brick.bSize/2)
      && ball.bY-ball.bSize/2<=(brick.bY+brick.bSize/2)
      ){
        brick.die = true;
        removeBrick(bList[i]);

        if(abs(ball.bX-brick.bX)==brick.bSize+ball.bSize/2){
          ball.xSpeed *= -1;
        }else{
        ball.ySpeed *= -1;
        }
      } 
        
     //   removeBrick(bList[i]);
    } 
   
  

   

    

    if(life==0){
    status = GAME_LOSE;
    }

    break;
    
  case GAME_WIN:
    background(255);
    printText(60,"YOU WIN!!!",240);  
    break;
  case GAME_LOSE:
    background(255);
    printText(60,"YOU LOSE",240);
    printText(20,"Press ENTER to REstart",280);
    break;
  
}
}


void drawBall(){
  ball = new Ball(bar.x,bar.y-10,random(-1,1),-2);
  ball.display();
 
  if(mouseButton == RIGHT) {
  
    ball.move();

  }
}



void BrickMaker(int num,int numInCol) {
  for (int i=0; i<num; i++){
    int col = int(i / numInCol);
    int row = int(i % numInCol); 
    int x = 120 + int((50*row));
    int y = 50 + int((30*col));
    bList[i]= new Brick(x, y);
    
  }
}

void drawBrick() {
  for (int i=0; i<bList.length-1; i++) {
    Brick brick= bList[i];
    if (brick!=null && !brick.die) { 
     brick.display();

    }
  }
}

void drawLife() {
  fill(230, 74, 96);
  text("LIFE :", 36, 440);
  for(int i=0;i<life;i++){
    ellipse(78+i*25,444,15,15);
    }
  }



void removeBrick(Brick obj) {
  obj.die = true;
  obj.bX = 1000;
  obj.bY = 1000;
}



void mouseClicked(){
if(mouseButton == RIGHT && status==GAME_PLAYING) {
    ball = new Ball(bar.x,bar.y-10,random(5),-5);


  }
}


void keyPressed() {
  if (key == ENTER) {
    switch(status) {

    case GAME_START:
      status = GAME_PLAYING;
      life=3;
      break;
    case GAME_WIN:
      status = GAME_PLAYING;
      life=3;
      break;  
    case GAME_LOSE:
      status = GAME_PLAYING;
      life=3;
      break;  
    
    }
  }
}
