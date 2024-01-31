class Floater
{
  private int corners;  //the number of corners, a triangular floater has 3
  private int[] xCorners;
  private int[] yCorners;
  private int myColor;
  private double myCenterX, myCenterY; //holds center coordinates
  private double myXspeed, myYspeed; //holds the speed of travel in the x and y directions
  private double myPointDirection; //holds current direction the ship is pointing in degrees

 public Floater(int corners, int[] xCorners, int[] yCorners) {
        this.corners = corners;
        this.xCorners = xCorners;
        this.yCorners = yCorners;
        // Initialize other fields with default values
        myColor = 0; // Default color
        myCenterX = 0;
        myCenterY = 0;
        myXspeed = 0;
        myYspeed = 0;
        myPointDirection = 0;
    }

    // Getters and setters for other fields
    public int getMyColor() {
        return myColor;
    }

    public void setMyColor(int myColor) {
        this.myColor = myColor;
    }

    public double getMyCenterX() {
        return myCenterX;
    }

    public void setMyCenterX(double myCenterX) {
        this.myCenterX = myCenterX;
    }

    public double getMyCenterY() {
        return myCenterY;
    }

    public void setMyCenterY(double myCenterY) {
        this.myCenterY = myCenterY;
    }

    public double getMyXspeed() {
        return myXspeed;
    }

    public void setMyXspeed(double myXspeed) {
        this.myXspeed = myXspeed;
    }

    public double getMyYspeed() {
        return myYspeed;
    }

    public void setMyYspeed(double myYspeed) {
        this.myYspeed = myYspeed;
    }

    public double getMyPointDirection() {
        return myPointDirection;
    }

    public void setMyPointDirection(double myPointDirection) {
        this.myPointDirection = myPointDirection;
    }

  //Accelerates the floater in the direction it is pointing (myPointDirection)
  public void accelerate (double dAmount)
  {
    //convert the current direction the floater is pointing to radians
    double dRadians =myPointDirection*(Math.PI/180);
    //change coordinates of direction of travel
    myXspeed += ((dAmount) * Math.cos(dRadians));
    myYspeed += ((dAmount) * Math.sin(dRadians));
  }
  public void turn (double degreesOfRotation)
  {
    //rotates the floater by a given number of degrees
    myPointDirection+=degreesOfRotation;
  }
  public void move ()   //move the floater in the current direction of travel
  {
    //change the x and y coordinates by myXspeed and myYspeed
    myCenterX += myXspeed;
    myCenterY += myYspeed;

    //wrap around screen
    if(myCenterX >width)
    {
      myCenterX = 0;
    }
    else if (myCenterX<0)
    {
      myCenterX = width;
    }
    if(myCenterY >height)
    {
      myCenterY = 0;
    }

    else if (myCenterY < 0)
    {
      myCenterY = height;
    }
  }
  public void show ()  //Draws the floater at the current position
  {
    fill(myColor);
    stroke(myColor);

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}
