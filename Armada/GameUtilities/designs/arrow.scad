//include <C:\Users\stewa\3D Objects\threads-scad-master\threads.scad>;

showHandle="y" ;
difference(){
    
    union() {
        linear_extrude(height=2.0){
            polygon([[-29,0],[-42,-10],[-20,-4],[24,-2.5],[24,-7.5],[41,0],[24,7.5],[24,2.5],[-20,4],[-42,10]]);
            }
        
        color("red")linear_extrude(height=3.0){polygon([[24,-4.5],[39.7,0],[40,0],[39.5,-0.5],[24,-7.5]]) ;}
        color("green")linear_extrude(height=3.0){polygon([[24, 4.5],[39.7,0],[40,0],[39.5,0.5],[24, 7.5]]) ;}
        color("blue")linear_extrude(height=3.0){polygon([[-20,0],[-29, -3.5],[39.8,-0.2],[39.8,0.2],[-29, 3.5]]) ;}
    
        if (showHandle != "N") {
          translate([0,0,2.9]) 
            cylinder(h = 6, r1 = 2.5, r2 = 1.0, center = true, $fn=60);

          translate([0,0,7.5]) 
            sphere(2.5, $fn=60);
        }
        
        
    }
    
    translate([0,0,-1.5])
        cylinder(h=3, d=1, $fn=8);
    translate([11,0,-1.5]) cylinder(h=3, d=1, $fn=8) ;

}


//translate([50,0,0])
//    metric_thread (diameter=8, pitch=1, length=4);

