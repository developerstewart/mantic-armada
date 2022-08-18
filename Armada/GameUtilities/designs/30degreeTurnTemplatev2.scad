// Armada 30 degree turn template

turnAngle = 30.00 ;

baseWidth=30.00 ; height=3.00 ;
armLength = 35.00;
baseDepth = 5.00 ;

points = [[0,baseDepth],[baseWidth,baseDepth]
         ,[baseWidth+armLength*sin(turnAngle), baseDepth+armLength*cos(turnAngle)]
         ,[baseWidth+armLength*sin(turnAngle)+baseDepth*cos(turnAngle), baseDepth+armLength*cos(turnAngle) - baseDepth*sin(turnAngle) ]
         ,[baseWidth+baseDepth*cos(turnAngle), baseDepth - baseDepth*sin(turnAngle) ]
         ,[baseWidth,-1.00], [0,-1.00]
] ;

difference() 
    {
     union() 
     {
         linear_extrude(height=height) polygon(points);
         translate([baseWidth,0,0])mirror([1,0,0])linear_extrude(height=height) polygon(points);
         // add finger tab
         translate([baseWidth/2,-4,0]) color("orange") cylinder(r=7.5,h=height) ;
     }

     translate([baseWidth/2,baseDepth/2-1,1.6])
         linear_extrude(height=2.0)
            text("Yellow", font="Arial Nova:style=Bold",size=4, valign="center", halign="center");

     translate([baseWidth/2+.5,-4.8,1.6])
         linear_extrude(height=1.5)
            text("30°", size=6, font="Arial Nova:style=Bold", valign="center", halign="center");
}
