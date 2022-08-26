//Monolith Vortex

//linear_extrude(3) circle(12, $fn=3) ;

//rotate([0,0,90]) 
{
difference() {
    union() {
    cylinder(h=3, r=12, $fn=3) ;
    }
    translate([-2.5,-15,-1.1]) #cube([0.5,25,5.2]) ;
    translate([ 0.5,-15  ,-1.1]) #cube([0.5,25,5.2]) ;
    translate([ 3.5,-15  ,-1.1])  #cube([0.5,25,5.2]) ;
    translate([ 6.5,-15  ,-1.1]) #cube([0.5,25,5.2]) ;
    //translate([ 6,-15  ,-1.1])  #cube([0.5,25,5.2]) ;
    translate([0,0,-2]) cylinder(h=6, r=9, $fn=3) ;
}

    translate([0,0,1])cylinder(h=1, r=13.5, $fn=3) ;
    }