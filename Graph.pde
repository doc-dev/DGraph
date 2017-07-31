public abstract class Graph {
  protected int xstart;
  protected int ystart;
  protected int thickness;
  protected int xlength;
  protected int ylength;
  protected ArrayList xvalues;
  protected ArrayList yvalues;


  public abstract void plotBounds();
  
  public abstract void unitMeasure(ArrayList x, ArrayList y);
}