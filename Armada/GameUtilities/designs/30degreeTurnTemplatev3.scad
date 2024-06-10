// Armada 30 degree turn template Reversible

turnAngle = 45.00 ;

baseWidth=31.00 ; height=3.00 ;
armLength = 35.00;
armWidth = 3.00 ;
baseDepth = 5.00 ;
yOffset = -4.0 ; sideHeight = 20.0 ;

module turnMeasure(turnAngle) {
newPoints = [
    [-baseWidth-armWidth,yOffset], [-baseWidth-armWidth,sideHeight+yOffset], [-baseWidth,sideHeight+yOffset], [-baseWidth,0], [0, 0],
    [armLength*sin(turnAngle), armLength*cos(turnAngle)], 
    [armLength*sin(turnAngle)+armWidth*cos(turnAngle), armLength*cos(turnAngle)-armWidth*sin(turnAngle)],
    [1,yOffset]
] ;

difference() 
    {
     union() 
     {
         linear_extrude(height=height) polygon(newPoints);
         //translate([baseWidth,0,0])mirror([1,0,0])linear_extrude(height=height) polygon(points);
         // add finger tab
        difference() { 
        translate([-baseWidth/2,-7.5,0]) color("orange") cylinder(r=7.1,h=height) ;
        translate([-baseWidth/2,-10,-.01]) cylinder(r=2,h=height+2, $fn=3) ;
        }
     }

     //translate([-baseWidth/2,-baseDepth/2-1,1.6])
         //linear_extrude(height=2.0)
            //text("Yellow", font="Arial Rounded MT Bold:style=Bold",size=4, valign="center", halign="center");

     translate([-baseWidth/2,-5.4,1.6])
         linear_extrude(height=1.6)
            text(str(turnAngle), size=5.5, font="Arial Rounded MT Bold:style=Bold", valign="center", halign="center");
            
}
}

module holder () {

    cylinder(r=4, h=50, $fn=6) ;
    translate([0,0,49.8]) cylinder(r=1.8,h=height, $fn=3) ;
}

turnMeasure(turnAngle) ;

translate([-10,10,0]) holder() ;
