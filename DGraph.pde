import java.util.Arrays;
import java.util.*;

color white = color(255, 255, 255);
lineGraph g;
Histogram h;
void settings() {
  size(800,600);
  //PWindow due = new PWindow();
  
}

void setup(){
  background(white);
  //g = new lineGraph((int)((width/12)*1.25), (int)(height*0.90), 2);
  //g.plotBounds();
  h = new Histogram((int)((width/12)*1.25), (int)(height*0.90), 2);
  ArrayList spam = new ArrayList();
  spam.add(1);
  spam.add(2);
  spam.add(3);
  spam.add(4);
  spam.add(5);
  spam.add(6);
  spam.add(7);
  spam.add(8);
  spam.add(9);
  spam.add(11);
  spam.add(12);
  spam.add(10);  
  ArrayList spam2 = new ArrayList();
  spam2.add(2);
  spam2.add(4);
  spam2.add(6);
  spam2.add(8);
  spam2.add(10);
  spam2.add(12);
  spam2.add(7);
  spam2.add(3);
  spam2.add(1);
  spam2.add(5);
  spam2.add(7);
  spam2.add(11); 
  h.unitMeasure(spam,spam2);
  ArrayList spam3 = new ArrayList();
  spam3.add(8);
  spam3.add(12);
  spam3.add(34);
  spam3.add(25);
  spam3.add(45);
  spam3.add(54);
  spam3.add(10);
  cakeGraph cgraph = new cakeGraph((float)(width+height)/4,(float)width/2*0.60,(float)height/2,color (2,2,255));
 }



void draw() {
  noLoop();
}