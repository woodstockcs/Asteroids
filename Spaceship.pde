public class Spaceship extends Floater {

    public Spaceship() {
        // Call Floater's constructor to initialize corners, xCorners, yCorners
        super(3, new int[]{-8, 16, -8}, new int[]{-8, 0, 8});

        // Initialize other properties using setters
        setMyColor(255);
        setMyCenterX(100);
        setMyCenterY(100);
        setMyXspeed(0);
        setMyYspeed(0);
        setMyPointDirection(0);
    }

}
