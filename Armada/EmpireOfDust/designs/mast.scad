// mast.scad
$fn=30 ;

module showMast (shipType, ship) {
/*
ship =  shipType == "Monolith" ? -1 :
        shipType == "War Galley" ? 1 : 
        shipType == "Khopeshii" ? 2 :
        shipType == "Dust Chaser" ? 3 :
        shipType == "Soul Hunter" ? -1 :
        shipType == "Slave Squadron"  ? 5 : -1
;  // ship = -1 for an incorrect shipType name
*/
d = 0.50 ;
//Vessels
vessels = [0,1,2,3,4,5] ;   // 0: Monolith, 
                            // 1: War Galley, 
                            // 2: Khopeshii, 
                            // 3: Dust Chaser, 
                            // 4: Soul Hunter, 
                            // 5: Slave Squadron

sparWidths =       [0.00, 70.00, 46.00, 46.00, 0.00, 20.00] ;
sailInsetsOnSpar = [0.00,  2.50,  2.00,  2.00, 0.00,  0.60] ;

mastHeights =      [ 0.00, 50.00, 32.00, 41.00, 0.00, 21.00] ;
mastSteppedAt =    [ 0.00,  0.00,  0.00,  0.00, 0.00,  0.00] ;
mastRadiiBase  =   [ 0.00,  2.20,  2.20,  1.60, 0.00,  0.48] ;
mastRadiiTop   =   [ 0.00,  1.05,  0.60,  0.60, 0.00,  0.48] ;
magnetSize  =      [0.00,  3.00,  3.00,  0.00, 0.00,  0.00] ;


magnets        =   [[1.5,2],[1,1]] ; // [magnet Radius, magnet height]



module mast(mastHeight, mastBaseR, mastTopR, mastStep, magnetDiameter  ) {

    magnetR = magnetDiameter == 3 ? magnets[0][0] + 0.05 :
              magnetDiameter == 2 ? magnets[1][0] + 0.05 :
              0.00 ;

    magnetH = magnetDiameter == 3 ? magnets[0][1] + 0.05 :
              magnetDiameter == 2 ? magnets[1][1] + 0.05 :
              0.00 ;      

    if (mastStep==0) {
        difference() {
            cylinder(r1=mastBaseR, r2=mastTopR, h=mastHeight) ;
            if(magnetDiameter > 0) {
                translate([0,0,-.001]) cylinder(r=magnetR+.1,h=magnetH+.1) ;
            }
        }
    }
    else {
        difference() {
            union() {
                cylinder(r1=mastBaseR, r2=mastTopR, h=mastHeight) ;
                translate([0,0,-5.00]) cylinder(r1=mastStep/2, r2=mastStep/2,h=5.01) ;
            }
            union() {
            translate([0,0,-.001]) #cylinder(r=mastStep/2-0.2,h=magnetH+.1) ;
            translate([0,0,-5.001]) #cylinder(r=magnetR+.1,h=magnetH+6.01) ;
         
        }
        }

    }
        
}

//translate([26,-2.5,21])
//rotate([0,-90,0])
// Generate ship mast.
if (ship>0) {
    mastOffsetX = ship==1 ? 2 : 1;
    mastHeight=mastHeights[ship] ;
    mastBaseR=mastRadiiBase[ship] ;
    mastTopR=mastRadiiTop[ship] ;
    mastStep=mastSteppedAt[ship] ;
    sparWidth = sparWidths[ship] ;
    angle = atan((mastBaseR-mastTopR)/mastHeight ) ;
    translate([mastHeight-mastOffsetX,-mastBaseR-0.1,sparWidth/2-sailInsetsOnSpar[ship]])
    rotate([-angle,-90,0])
    mast(mastHeight=mastHeight, mastBaseR=mastBaseR,mastTopR=mastTopR,mastStep=mastStep,magnetDiameter=magnetSize[ship]) ;
}
else {
    echo(str("Ship Type '", shipType,  "' is not a valid masted Empire of Dust Ship Type")) ;
}
 
}
