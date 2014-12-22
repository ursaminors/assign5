class Brick{
  float bX;
  float bY;
  float bSize = 20;
  boolean die = false;
  
   
   
  Brick(int x,int y){
    bX = x;
    bY = y;
  }
  
  void display(){
  fill(82,139,139);
  //stroke(82,139,139);
  rectMode(CENTER);
  rect(bX,bY,bSize*2,bSize);
  }
  
  
}
