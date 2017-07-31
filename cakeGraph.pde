public class cakeGraph extends Graph{
  private double xcenter;
  private double ycenter;
  private double radius;
  private color c;
  private double area;    
  
  public cakeGraph(double radius,double xcenter,double ycenter,color c){
    this.xcenter=xcenter;
    this.ycenter=ycenter;
    this.radius=radius;
    this.c=c;
    this.area = Math.PI * Math.pow(radius,2);
  }
  
  public void plotBounds(){
  
  
  }
  
  public void unitMeasure(ArrayList v, ArrayList n){
    randomSeed(millis());
    stroke(c);
    fill(c);
    Collections.sort(v);
    ArrayList percentages = new ArrayList();
    ArrayList ap = new ArrayList();
    List<Float> ang = new ArrayList<Float>();
    int sum = 0;
    println("size ",v.size());
    for(int i=0;i<v.size();i++){
      sum+=(int)v.get(i);
    }
    println("somma ",sum);
    for(int i=0;i<v.size();i++){
      percentages.add((double)((double)(100*(int)v.get(i))/sum));
      ap.add((double)(area*(double)percentages.get(i))/100);
      ang.add(radians(toFloat((double)360*(double)ap.get(i)/area)));      
    }
    float tmp = 0;
    ArrayList<Float> newArr = new ArrayList<Float>();
    
    for (Float f : ang) {
      newArr.add(tmp);
      tmp+=f;
  }
    
    for(int i = 0; i<ang.size();i++){
      stroke(0);
      fill(color(random(255),random(255),random(255)));
      arc(toFloat(xcenter), toFloat(ycenter), toFloat(radius), toFloat(radius),(float)newArr.get(i),(float)newArr.get(i) + (float)ang.get(i), PIE);
    }
  }
  
  
  private float toFloat(double num){
    return Float.parseFloat(String.valueOf(num));
  }




}