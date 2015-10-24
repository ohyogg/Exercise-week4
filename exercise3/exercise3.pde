//changable variable
int interval = 20;
float speedControl = 0.01;
float aptitude = 140;
float averageYHeight = 150;
float blankH =100;

//initiate
float[] yvalues;
float speed = 0;
float spacing = width/interval;
float arrayNum = width/spacing;

//gameState
int gameState;
final int PLAY = 0;
final int END = 1;


void setup(){
  
  size(600,500);
  float spacing = width/interval;
  float arrayNum = width/spacing;
  colorMode(RGB);
  yvalues = new float[(int)arrayNum];
}

void draw(){
  
  switch(gameState){
  case PLAY:
  background(0);
  float spacing = width/interval;
  
  
  //blue  
  for(float blueX = 0; blueX<width; blueX+=spacing){
    fill(0,0,255);
    rect(blueX,0,spacing,height);
  }
  
  
  //white
      //make sin array
  speed += speedControl;
  float x = speed;
  for (int i = 0; i <= (width/spacing-2-1); i++) {
    yvalues[i] = sin(x)*aptitude;
    x+=TWO_PI/36;
    }
   
      //draw rect
  noStroke();
  fill(255);
  for(int z = 0; z <=(width/spacing-2-1); z++){
    rect(spacing+z*spacing,yvalues[z]+averageYHeight,spacing,blankH);
    }
 
 
   //boundary    
   fill(255);
   rect(0,0,spacing,height);
   rect(width-spacing,0,spacing,height);
   
   //ball
   fill(255,0,0);
   ellipse(mouseX,mouseY,20,20);
   
   for(int j =0; j<=(width/spacing-2-1); j++){
     if(( mouseX>spacing*(j+1)&&mouseX<spacing*(j+2)&&mouseY<(yvalues[j]+averageYHeight) )||
        ( mouseX>spacing*(j+1)&&mouseX<spacing*(j+2)&&mouseY>(yvalues[j]+averageYHeight+blankH) ) ){
       gameState = END;
     }
     
   }
   
   if(mouseX>width-spacing){
     gameState = END;
   }
   
   break;
   
   case END:
     
     //background(0);
     
     fill(0,255,0);
     rect(0,0,width/interval,width/interval);
     
     //hover
     if(mouseX<width/interval && mouseY<width/interval){
       fill(255,0,0);
       rect(0,0,width/interval,width/interval);
       
       if(mousePressed){
         gameState = PLAY;
       }
     }
     
   break;
  }
}


  
    
