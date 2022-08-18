// Armada 45 degree turn template

turnAngle = 45.00 ;

baseWidth=30.00 ; height=3.00 ;
armLength = 35.00;
baseDepth = 5.00 ;

points = [[0,baseDepth],[baseWidth,baseDepth]
         ,[baseWidth+armLength*sin(turnAngle), baseDepth+armLength*cos(turnAngle)]
         ,[baseWidth+armLength*sin(turnAngle)+baseDepth*cos(turnAngle), baseDepth+armLength*cos(turnAngle) - baseDepth*sin(turnAngle) ]
         ,[baseWidth+baseDepth*cos(turnAngle), baseDepth - baseDepth*sin(turnAngle) ]
         ,[baseWidth,-1.00], [0,-1.00]
] ;

difference() {
union() {
linear_extrude(height=height) polygon(points);
translate([baseWidth,0,0])mirror([1,0,0])linear_extrude(height=height) polygon(points);

translate([baseWidth/2,-4,0]) color("orange") cylinder(r=7.5,h=height) ;
}
translate([baseWidth/2,baseDepth/2-1,1.6])
linear_extrude(height=2.0)
   text("Red", font="Arial Nova:style=Bold",size=4, valign="center", halign="center");

translate([baseWidth/2+.5,-4.8,1.6])
linear_extrude(height=1.5)
   text("45°", size=6, font="Arial Nova:style=Bold", valign="center", halign="center");
}


/*
difference() {
    union() {
translate([baseWidth/2,-4,0]) color("orange") cylinder(r=7.5,h=height) ;

translate([-0.2,1.7,0])color("blue")rotate([0,0,45])translate([-2.5,0,0])cube([5,armLength,height]) ;

translate([-2.0,0,0])color("gray")cube([baseWidth+4.1,5,height]) ;

translate([baseWidth-2.55,1.75,0])
    mirror([1,0,0])
        translate([-2.9,0,0])color("pink")rotate([0,0,45])translate([-2.5,0,0])cube([5,armLength,height]) ;

}

translate([baseWidth/2,2.5,1.6])
linear_extrude(height=1.5)
   text("Red", font="Arial Nova:style=Bold",size=3, valign="center", halign="center");

translate([baseWidth/2+.5,-4.8,1.6])
linear_extrude(height=1.5)
   text("45°", size=6, font="Arial Nova:style=Bold", valign="center", halign="center");
}
//check base gap!
//translate([0,5.2,0]) cube([baseWidth,2,3]) ;
*/