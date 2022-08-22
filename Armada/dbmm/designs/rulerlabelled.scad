//
miniSize= 15;  // 
barker =    miniSize==15 ? 40: 60 ; //mm  per 80 paces
rulerLength=400 ; // paces
measureLength = barker*rulerLength/80 ;  //mm

label1="Bge, Bd, Bw, Hd, Pk, Sp, Nav(X), WWg, Wb, Art(I, O or X), Sh" ;
label2="Ax, EL, Kn, Ps" ;
label3="Cv, Cm, Ex" ;
label4="LH, Nav(I, O or S)" ;

label5="March Move" ;
label6="Exclusion" ;

cube([measureLength,40*barker/40,2.4]) ;

//draw and 0.5barker lines

for (thisLine = [1:1:10]) {

    if (thisLine<10) {
        translate([(0.5*thisLine*barker)-0.50, 0,0]) color("blue")cube([1,10, 3.6]) ;  // Line
        if(thisLine==2) {
                translate([(0.5*thisLine*barker)-0.50, 26*barker/40,0]) color("blue")cube([1, 3.5, 3.6]) ;                
                translate([(0.5*thisLine*barker)-0.50, 20*barker/40,0]) color("blue")cube([1, 3.5, 3.6]) ;                
                translate([(0.5*thisLine*barker)-0.50, 13.5*barker/40,0]) color("blue")cube([1, 3.5, 3.6]) ;
        }
        else if(thisLine==3) {
                translate([(0.5*thisLine*barker)-0.50, 26*barker/40,0]) color("blue")cube([1, 3.5, 3.6]) ;
                translate([(0.5*thisLine*barker)-0.50, 20*barker/40,0]) color("blue")cube([1, 3.5, 3.6]) ;                
                translate([(0.5*thisLine*barker)-0.50, 13.5*barker/40,0]) color("blue")cube([1, 3.5, 3.6]) ;
        }
        else if(thisLine==4) {
                translate([(0.5*thisLine*barker)-0.50, 26.5*barker/40,0]) color("blue")cube([1, 4.5, 3.6]) ;
                translate([(0.5*thisLine*barker)-0.50, 20*barker/40,0]) color("blue")cube([1, 3.5, 3.6]) ;
                
                translate([(0.5*thisLine*barker)-0.50, 13.5*barker/40,0]) color("blue")cube([1, 3.5, 3.6]) ;
        }
        else if (thisLine==5) {
                translate([(0.5*thisLine*barker)-0.50, 20*barker/40,0]) color("blue")cube([1, 10, 3.6]) ;
                
                translate([(0.5*thisLine*barker)-0.50, 13.5*barker/40,0]) color("blue")cube([1, 3.5, 3.6]) ;
        }
        else if (thisLine==6) {
                translate([(0.5*thisLine*barker)-0.50, 20*barker/40,0]) color("blue")cube([1, 10, 3.6]) ;
                
                translate([(0.5*thisLine*barker)-0.50, 13.5*barker/40,0]) color("blue")cube([1, 8.5, 3.6]) ;
       }
        else if (thisLine==7) {
            translate([(0.5*thisLine*barker)-0.50, 15*barker/40,0]) color("blue")cube([1, barker-15, 3.6]) ;
        }
        else if (thisLine>=8) {
            translate([(0.5*thisLine*barker)-0.50, 0*barker/40,0]) color("blue")cube([1, barker, 3.6]) ;
        }    
        
        translate([(0.5*thisLine*barker)-0.50, 36*barker/40,0]) color("blue")cube([1, barker-36, 3.6]) ;  // Line
    }
    translate([(0.5*thisLine*barker)-2.0, 4.2*barker/40,0]) color("red")cylinder(h=3.6,r=1.5, $fn=3) ; //arrowhead
    if (thisLine<=2) {
        translate([(0.5*thisLine*barker)-10.5, 3.0*barker/40,2.0]) 
        scale([1,1.2,1.0])color("grey")
        linear_extrude(height=1.4)text(str(thisLine*barker, "p"), font="Liberation Sans:style=Bold", size=3) ;
    }
    else {
        translate([(0.5*thisLine*barker)-12.5, 3.0*barker/40,2.0]) 
        scale([1,1.2,1.0])color("grey")
        linear_extrude(height=1.4)text(str(thisLine*barker, "p"), font="Liberation Sans:style=Bold", size=3, spacing=1.1) ;
    }
}

translate([2, 32*barker/40,2.0]) color("green")linear_extrude(height=1.4)text(label1, font="Liberation Sans:style=Bold", size=3, spacing=1.1) ;
translate([0,30*barker/40,0]) color("red")cube([2*barker-2.5,1,3.4]) ;
translate([2*barker-2, 30.4*barker/40 ,0]) color("red")cylinder(h=3.4,r=1.5, $fn=3) ; //arrowhead

translate([2, 26*barker/40,2.0]) color("green")linear_extrude(height=1.4)text(label2, font="Liberation Sans:style=Bold", size=3, spacing=1.1) ;
translate([0,24*barker/40,0]) color("red")cube([2.5*barker-2.5,1,3.4]) ;
translate([2.5*barker-2, 24.4*barker/40 ,0]) color("red")cylinder(h=3.4,r=1.5, $fn=3) ; //arrowhead

translate([2, 20*barker/40,2.0]) color("green")linear_extrude(height=1.4)text(label3, font="Liberation Sans:style=Bold", size=3, spacing=1.1) ;
translate([0,18*barker/40,0]) color("red")cube([3.0*barker-2.5,1,3.4]) ;
translate([3.0*barker-2, 18.4*barker/40 ,0]) color("red")cylinder(h=3.4,r=1.5, $fn=3) ; //arrowhead


translate([2, 14*barker/40,2.0]) color("green")
    linear_extrude(height=1.4)text(label4, font="Liberation Sans:style=Bold", size=3, spacing=1.1) ;
translate([0,12*barker/40,0]) color("red")cube([4.0*barker-2.5,1,3.4]) ;
translate([4.0*barker-2, 12.4*barker/40 ,0]) color("red")cylinder(h=3.4,r=1.5, $fn=3) ; //arrowhead

translate([measureLength-6, 10*barker/40,0]) color("green")rotate([0,0,90]) 
    linear_extrude(height=3.4)text(label5, font="Liberation Sans:style=Bold", size=3, spacing=1.1) ;
translate([measureLength-2, 11*barker/40,0]) color("green")rotate([0,0,90]) 
    linear_extrude(height=3.4)text(label6, font="Liberation Sans:style=Bold", size=3, spacing=1.1) ;
