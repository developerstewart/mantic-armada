measure_length = 8 ; // Inches
measure_scale  = 25.4 ;  // mm
l = measure_length*25.4 ; // mm
w = 2*measure_scale/5 ; // mm
x = measure_scale ;
h = 0.1 * measure_scale  ; // ruler height

fl = 1.00 ; // 1mm 'fret' length

ruler = [[0,0], [l, 0], [l, w], [0, w]] ;

color("grey")linear_extrude( h) polygon(ruler) ;

difference() {
    union() {
        color("grey")translate([-9.99,-(40-w)/2,0]) cube([10,40,h]) ;
        color("grey") translate([-9.99,w/2,0]) cylinder(h=h,r=5) ;
    }
translate([-5,w/2,h/2])rotate([0,0,-90])color("brown")linear_extrude(h+fl) text(size=5, text="Movement", halign="center", valign="center") ;
}

for(f= [measure_length:-1:1]) {  
    //build intermediate frets
    color("brown")linear_extrude(h+fl) polygon([[0+f*x-fl/2,0],[0+f*x+fl/2,0],[0+f*x+fl/2,w],[0+f*x-fl/2,w]]) ;
    // label fret
    translate([f*x-4.0,w/2,0])rotate([0,0,-90])color("brown")linear_extrude(h+fl) text(size=5, text=str(f), halign="center", valign="center") ;

}


