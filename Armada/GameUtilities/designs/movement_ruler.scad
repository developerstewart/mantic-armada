measure_length = 5 ; // Inches
measure_scale  = 25.4 ;  // mm
l = measure_length*25.4 ; // mm
w = 2*measure_scale/5 ; // 1" width
x = measure_scale ;
h = 0.1 * measure_scale  ; // ruler height

fl = 1.00 ; // 1mm 'fret' length

ruler = [[0,0], [l, 0], [l, w], [0, w]] ;

color("black")linear_extrude( h) polygon(ruler) ;

//linear_extrude(h+fl) polygon([[0,0],[0+fl,0],[0+fl,w],[0,w]]) ; //starting fret

color("black")translate([-9.99,-(40-w)/2,0]) cube([10,40,h]) ;
translate([-5,w/2,0])rotate([0,0,-90])color("brown")linear_extrude(h+fl) text(size=5, text="Movement", halign="center", valign="center") ;

//translate([5,w/2,0])linear_extrude(h+fl) text(size=5, text="0", halign="center", valign="center", direction="ttb") ;

for(f= [measure_length:-1:1]) {  
    //build intermediate frets
    color("brown")linear_extrude(h+fl) polygon([[0+f*x-fl/2,0],[0+f*x+fl/2,0],[0+f*x+fl/2,w],[0+f*x-fl/2,w]]) ;
    // label fret
    translate([f*x-4.0,w/2,0])rotate([0,0,-90])color("brown")linear_extrude(h+fl) text(size=5, text=str(f), halign="center", valign="center") ;

}
    //linear_extrude(h+fl) polygon([[l,0],[l-fl,0],[l-fl,w],[l,w]]) ; //ending fret
    //translate([l-3,w/2,0])linear_extrude(h+fl) text(size=5, text=str(measure_length), halign="center", valign="center", direction="ttb") ;


