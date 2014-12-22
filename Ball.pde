class Ball{

    float xSpeed;
    float ySpeed;
    float bSize = 10;
    float bX;
    float bY;
    float circleDistanceX;
    
    
    void display(){
    fill(255,255,255);
    ellipse(bX,bY,bSize,bSize);
    }
    
    void move(){
    bX+=xSpeed;
    bY+=ySpeed;
    
      if(bX>width-bSize/2 || bX<bSize/2){
        xSpeed*=-1;
      }
    
      if(bY<=bSize/2){
        ySpeed*=-1;
      } 
      
      
    
    
    float bottom = bY+bSize/2;
    float bl = bar.y - bSize/2;
    float bLeft  = bar.x - bar.len/2;
    float bRight = bar.x + bar.len/2;
    if (bottom >= bl && bX>bLeft && bX<bRight){
        ySpeed *= -1;
        bY = bl - bSize/2;
    }
  }
    
    Ball(float x,float y,float speedX,float speedY){
      bX = x;
      bY = y;
      xSpeed = speedX;
      ySpeed = speedY;

    }
 
}
