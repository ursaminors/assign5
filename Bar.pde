class Bar{
  float x;
  float y;
  float len;
  
  void move(){
    x = mouseX;
  }
  
  void display(){
  rectMode(CENTER);
  fill(255,255,255);
  rect(x,y,len,10);
  }
  
  Bar(float len){
    this.y = height-10;
    this.len = len;
  }
}
