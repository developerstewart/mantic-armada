measure_length = 8 ; // Inches
l = measure_length*25.4 ; // mm
w = 1*25.4 ; // 1" width
h = 0.1 * 25.4  ; // ruler height

fl = 1.00 ; // 1mm 'fret' length

ruler = [[0,0], [l, 0], [l, w], [0, w]] ;

linear_extrude( h) polygon(ruler) ;

linear_extrude(h+fl) polygon([[0,0],[0+fl,0],[0+fl,w],[0,w]]) ; //starting fret

translate([5,w/2,0])linear_extrude(h+fl) text(size=5, text="0", halign="center", valign="center", direction="ttb") ;

for(f= [7:-1:1]) {  //build intermediate frets
    linear_extrude(h+fl) polygon([[0+f*w-fl/2,0],[0+f*w+fl/2,0],[0+f*w+fl/2,w],[0+f*w-fl/2,w]]) ;
    translate([5+f*w,w/2,0])linear_extrude(h+fl) text(size=5, text=str(f), halign="center", valign="center", direction="ttb") ;

}
    linear_extrude(h+fl) polygon([[l,0],[l-fl,0],[l-fl,w],[l,w]]) ; //ending fret
    translate([l-3,w/2,0])linear_extrude(h+fl) text(size=5, text="8", halign="center", valign="center", direction="ttb") ;


