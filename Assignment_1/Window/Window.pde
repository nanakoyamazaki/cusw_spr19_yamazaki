PImage img1;
PImage img2;
PGraphics maskImg;
int penSize = 30;
int x= 200;
int y= 100;

//represent mouse count
int count = 0;
PFont font;

void setup() {
  img1 = loadImage("view3.jpg");
  img2 = loadImage("view.jpg");
  maskImg = createGraphics(img1.width, img1.height);
  maskImg.beginDraw();
  maskImg.background(255);
  maskImg.endDraw();
  
  size(640,360);

  font = createFont("SourceCodePro-Regular.ttf", 12);
  textFont(font);

  strokeWeight(20);
  stroke(0, 102);
}

void draw() {
  maskImg.beginDraw();
  maskImg.stroke(0);
  maskImg.strokeWeight(penSize);
  //swipe
  if (mousePressed) {
    maskImg.line(pmouseX, pmouseY, mouseX, mouseY);
  }
  //stamp media lab logo 
  if (keyPressed) {
      maskImg.noStroke();
      maskImg.fill(0);           
      maskImg.rect(mouseX,mouseY,40,10);
      maskImg.rect(mouseX+30, mouseY+10,10,30);
      maskImg.rect(mouseX+40, mouseY+30,30,10);
      maskImg.rect(mouseX+60, mouseY+40,10,30);
      maskImg.rect(mouseX, mouseY+30,10,40);
      maskImg.rect(mouseX+10, mouseY+60,30,10);
  }
  
  maskImg.endDraw();
  img1.mask(maskImg);

  image(img2, 0, 0);
  image(img1, 0, 0);
  
  //text "Mouse Pressed" position
  text("Mouse Pressed: "+ count,25, height-40);

    int mouseSpeed = int(dist(mouseX, mouseY, pmouseX, pmouseY)*60);
    
  //text "Mouse Speed" position
    fill(255);
    text("Mouse Speed: " + mouseSpeed, 25, height-25);

}

void mousePressed() {
    count = count + 1;
}
