import java.util.Collections;
import java.util.ArrayList;
import java.math.BigDecimal;

public class lineGraph extends Graph {
  private final int CONST_WIDTH = (width-(width/12));
  private final int CONST_HEIGHT = (height-height/12);
  private float dx;
  private float dy;

  public lineGraph(int x, int y, int t) {
    this.xstart = x;
    this.ystart = y;
    this.thickness = t;
  }

  public void plotBounds() {
    strokeWeight(thickness);
    fill(0);
    line(xstart, ystart, CONST_WIDTH, ystart);
    line(xstart, ystart, xstart, height-CONST_HEIGHT);
  }

  public void unitMeasure(ArrayList x, ArrayList y) throws NumberFormatException {
    Collections.sort(x);
    Collections.sort(y);
    stroke(0);
    fill(0);
    uniformX(x);
    uniformY(y);
    ArrayList a = getPoints(x, y);
    plot(a);
  }

  private int wrap(Object o) {
    if (o instanceof Integer) return 0;
    if (o instanceof Long) return 1;
    if (o instanceof Short) return 2;
    if (o instanceof Float) return 3;
    if (o instanceof Double) return 4;
    return -1;
  }

  private void uniformX(ArrayList x) {
    switch(wrap(x.get(0))) {      
    case 0 :   
      int si = 0;
      x.add((int)((int)x.get(x.size()-1)*1.40));
      //adesso disegno l'unità di misura di x
      float com = 0.0;
        for (int k = 0; k<x.size()-1; k++) {
          com += (int)x.get(k+1) - (int)x.get(k);
        }
        com = (float)com/x.size();
      int dp = (width-xstart)/(x.size()+1); //pixel tra 2 tacche
      //guardo a quanto corrisponde il minimo
      int dpx=0;
      if (dp <= CONST_WIDTH/22) {
        dpx = CONST_WIDTH/dp;
        //println(dpx2);
        int j = 0;
        for (int i=xstart+CONST_WIDTH/22; i<width-xstart; i+=CONST_WIDTH/22) {
          strokeWeight(thickness);
          textSize(12);
          fill(0);
          line(i, ystart, i, ystart-2);        
          line(i, ystart, i, ystart+2);
        }
        
        dx = (float)com;
        //com sta a WIDTH come valore sta a x;
        float a = 0.0;
        for (int i=xstart; i<width-xstart; i+=CONST_WIDTH/22) {
          text(Float.toString(round(a, 2)), i*0.9885, ystart*1.05);
          a+=com;
        }
      } else if (dp > CONST_WIDTH/3) {
        dpx = CONST_WIDTH/dp;
        int j = 0;
        for (int i=xstart; i<width-xstart; i+=CONST_WIDTH/3) {
          strokeWeight(thickness);
          textSize(20);
          fill(0);
          line(i, ystart, i, ystart-2);        
          line(i, ystart, i, ystart+2);
        }
        for (int k = xstart+dp; k<width-xstart; k+=dp) {
          if ((k-xstart)%dpx==0) text(Integer.toString((int)x.get(j)), k, ystart);
          j++;
        }
      } else {
        dx = com ;
        int j = 0;
        for (int i=xstart+dp; i<width-xstart; i+=dp) {
          fill(0);
          strokeWeight(thickness);
          textSize(20);
          text(Integer.toString((int)x.get(j)), i*0.9888, ystart*1.05);
          line(i, ystart, i, ystart-2);        
          line(i, ystart, i, ystart+2);
          j++;
        }
      }

      break;

    case 1 :
      long sl = 0;
      for (int i=x.size()-1; i>0; i--) {
        sl+=(long)x.get(i)-(long)x.get(i-1);
      }
      break;

    case 2 : 
      short ss = 0;
      for (int i=x.size()-1; i>0; i--) {
        ss+=(short)x.get(i)-(short)x.get(i-1);
      }
      break;

    case 3 : 
      float sf = 0.0;
      for (int i=x.size()-1; i>0; i--) {
        sf+=(float)x.get(i)-(float)x.get(i-1);
      }
      break;

    case 4 : 
      double sd = 0.0;
      for (int i=x.size()-1; i>0; i--) {
        sd+=(double)x.get(i)-(double)x.get(i-1);
      }
      break;

    default :
      throw new NumberFormatException("Sorry, problem with the x axis' values");
    }
  }

  private void uniformY(ArrayList y) {

    switch(wrap(y.get(0))) {      
    case 0 :   
      int si = 0;
      y.add((int)((int)y.get(y.size()-1)*1.10));


      //adesso disegno l'unità di misura di x
      int dp = (height-ystart)/(y.size()+1); //pixel tra 2 tacche
      //guardo a quanto corrisponde il minimo
      int dpx=0;
      if (dp <= CONST_HEIGHT/16) {
        dpx = CONST_HEIGHT/dp;
        for (int j=ystart-CONST_HEIGHT/16; j>CONST_HEIGHT/16; j-=CONST_HEIGHT/16) {
          line(xstart, j, xstart-2, j);
          line(xstart, j, xstart+2, j);
        }
        float com = 0.0;
        for (int k = 0; k<y.size()-1; k++) {
          com += (int)y.get(k+1) - (int)y.get(k);
        }        
        com = (float)com/y.size();
        dy = com;
        //com sta a WIDTH come valore sta a x;
        float a = 0.0;
        for (int i=ystart; i>height-CONST_HEIGHT; i-=CONST_HEIGHT/16) {
          text(Float.toString(round(a, 2)), xstart*0.15, i*1.0002);
          a+=com;
        }
      } else if (dp > CONST_HEIGHT/4) {
        int h=0;
        dpx = CONST_HEIGHT/dp;
        for (int j=ystart; j<height-ystart; j+=CONST_HEIGHT/4) {
          line(xstart, j, xstart-2, j);
          line(xstart, j, xstart+2, j);
        }
        for (int k = ystart; k<height-ystart; k+=dp) {
          if ((k-ystart)%dpx==0) text(Integer.toString((int)y.get(h)), xstart, k);
          h++;
        }
      } else {
        dy = dp;
        int j = 0;
        println(ystart-dp);
        println(CONST_HEIGHT);
        for (int i=ystart-dp; i>CONST_HEIGHT; i-=dp) {
          println("i  ", i);
          strokeWeight(thickness);
          textSize(20);
          fill(0);
          text(Integer.toString((int)y.get(j)), i, ystart);
          line(i, ystart, i, ystart-2);        
          line(i, ystart, i, ystart+2);
          j++;
        }
      }
      break;

    case 1 :
      long sl = 0;
      for (int i=y.size()-1; i>0; i--) {
        sl+=(long)y.get(i)-(long)y.get(i-1);
      }
      break;

    case 2 : 
      short ss = 0;
      for (int i=y.size()-1; i>0; i--) {
        ss+=(short)y.get(i)-(short)y.get(i-1);
      }
      break;

    case 3 : 
      float sf = 0.0;
      for (int i=y.size()-1; i>0; i--) {
        sf+=(float)y.get(i)-(float)y.get(i-1);
      }
      break;

    case 4 : 
      double sd = 0.0;
      for (int i=y.size()-1; i>0; i--) {
        sd+=(double)y.get(i)-(double)y.get(i-1);
      }
      break;

    default :
      throw new NumberFormatException("Sorry, problem with the y axis' values");
    }
  }

  private ArrayList getPoints(ArrayList x, ArrayList y) {
    ArrayList points = new ArrayList();
    for (int i=0; i<x.size(); i++) {
      points.add(new Point((int)x.get(i), (int)y.get(i)));
    }
    return points;
  }

  private void plot(ArrayList a) {
    //per la y : com sta a costante come elemento sta  a boh
    //per la x (apposto) : 
    strokeWeight(10);
    println(dx, dy);
    stroke(0);
    fill(0);
    for (int i=0; i<a.size(); i++) {           
      point((xstart)+((CONST_WIDTH/22)*(((Point)a.get(i)).getX()))/dx, (ystart)-((CONST_HEIGHT/16)*(((Point)a.get(i)).getY()))/dy);
    }
    for(int j=0; j<a.size()-1;j++){
      stroke(color(0,0,255));
      strokeWeight(3);
      line((xstart)+((CONST_WIDTH/22)*(((Point)a.get(j)).getX()))/dx, (ystart)-((CONST_HEIGHT/16)*(((Point)a.get(j)).getY()))/dy,(xstart)+((CONST_WIDTH/22)*(((Point)a.get(j+1)).getX()))/dx, (ystart)-((CONST_HEIGHT/16)*(((Point)a.get(j+1)).getY()))/dy);
    }
  }

  private float round(float d, int decimalPlace) {
    BigDecimal bd = new BigDecimal(Float.toString(d));
    bd = bd.setScale(decimalPlace, BigDecimal.ROUND_HALF_UP);
    return bd.floatValue();
  }
}