$fn=30 ;

module sailRing(sparRadius, ringRadius) {
    $fn=18 ;
    rotate_extrude() translate([sparRadius+1*ringRadius-0.001,0] ) circle(ringRadius) ;
}

module spar(sparWidth, sparRadius, sparTaper) {
    if (sparRadius-sparTaper >0 ) { 
    cylinder(r1=sparRadius, r2=sparRadius-sparTaper, h=sparWidth) ;
    }
    else {
        cylinder(r1=sparRadius, r2=sparRadius, h=sparWidth) ;
    }
    
        
}


module ringedFullSpar(sparWidth, sparRadius, sailWidth, ringCount, sailInsetOnSpar, ringRadius, interRingGap ) {
    translate([0,0,-sailInsetOnSpar]) spar(sparWidth, sparRadius,sailInsetOnSpar) ;
    
    for(ring = [0:ringCount-1]) {
        echo(str("Ring: ", ring, "; Y offset: ", ringRadius*1.50+ring*interRingGap)) ;
        translate([ringRadius,0,ringRadius*1.50+ring*interRingGap]) sailRing(sparRadius,ringRadius);
    }

}

module simpleSail(Height, sailBelly,sailWidth,sailThickness) {
d = 0.50 ;
sailHeight = Height - sailBelly ;
translate([+sailThickness/2,-sailThickness/4,0])
difference () {
difference() {
    hull() {
        translate([0,0,0])cylinder(r=sailThickness, h=sailWidth) ;
        translate([sailHeight,0,0])cylinder(r=sailBelly, h=sailWidth) ;
    }
    translate([0,0,-d])
    hull() {
        translate([0,0,0]) cylinder(r=0.001, h=sailWidth+2*d) ;
        translate([sailHeight,0,0]) cylinder(r=sailBelly-sailThickness, h=sailWidth+2*d) ;
    }
    }

    union() {
        translate([-2,-20,-d]) cube([sailHeight+sailBelly+2,20,sailWidth+2*d]) ;
        rotate([0,0,45])translate([-sailThickness-d,-d,-d]) cube([sailThickness+d,sailBelly+2,sailWidth+2*d]) ;
    }
}

}


module fullSail(shipType, ship) {

vessels = [0,1,2,3,4,5] ;   // 0: Monolith, 
                            // 1: War Galley, 
                            // 2: Khopeshii, 
                            // 3: Dust Chaser, 
                            // 4: Soul Hunter, 
                            // 5: Slave Squadron

sparWidths =       [0.00, 70.00, 46.00, 46.00, 0.00, 20.00] ;
heights =          [0.00, 35.00, 27.00, 37.00, 0.00, 16.00] ;
ringRadii =        [0.00,  0.40,  0.30,  0.30, 0.00,  0.20] ;
ringCounts =       [0,        12,     8,     8,    0,     6] ;
sparRadii  =       [0.00,  1.12,  0.60,  0.60, 0.00,  0.50] ;
sparTapers =       [0.00,  0.00,  0.00,  0.00, 0.00,  0.00] ;
sailThicknesses  = [0.00,  1.25,  1.00,  1.00, 0.00,  0.60] ;
sailInsetsOnSpar = [0.00,  2.50,  2.00,  2.00, 0.00,  0.60] ;
sailBellies =      [0.00,  8.00,  7.00,  6.00, 0.00,  5.00] ;

showPanels     =   [   0,     0,     1,     1,    0,     0] ;


sparWidth = sparWidths[ship] ;
sparRadius = sparRadii[ship] ;
sparTaper = sparTapers[ship] ;
sailThickness = sailThicknesses[ship] ;
sailInsetOnSpar = sailInsetsOnSpar[ship] ;
Height = heights[ship] ;    
ringCount = ringCounts[ship] ;
ringRadius = ringRadii[ship] ;
sailBelly = sailBellies[ship] ;

showPanel = showPanels[ship] ;

sailWidth=sparWidth - 2*sailInsetOnSpar ;
outerRingSep = sailWidth-3*ringRadius ;
sailHeight = Height - sailBelly ;
firstRingZ = sailInsetOnSpar + 3*ringRadius ;
interRingGap = outerRingSep/(ringCount-1) ;

if (ship>0) {
    echo(str("showPanel: '", showPanel)) ;
    if (showPanel == 0) {
        simpleSail(Height=Height-sailThickness/4, sailBelly=sailBelly-sailThickness/4,sailWidth=sailWidth,sailThickness=sailThickness/2) ;
        translate([0,0,0]) 
            rotate([0,0,45]) ringedFullSpar(sparWidth, sparRadius, sailWidth, ringCount, sailInsetOnSpar, ringRadius, interRingGap ) ;
        translate([Height-0.0*sailThickness,0,0]) 
            rotate([0,0,90]) ringedFullSpar(sparWidth, sparRadius, sailWidth, ringCount, sailInsetOnSpar, ringRadius, interRingGap ) ; 
    }
    else {
        panelWidth = interRingGap - 2*ringRadius ;
        
        union() {
            
            simpleSail(Height=Height-sailThickness/4, sailBelly=sailBelly-sailThickness/4,sailWidth=sailWidth,sailThickness=sailThickness/2) ;
            translate([0,0,0]) 
                rotate([0,0,45]) ringedFullSpar(sparWidth, sparRadius, sailWidth, ringCount, sailInsetOnSpar, ringRadius, interRingGap ) ;
            translate([Height-0.0*sailThickness,0,0]) 
                rotate([0,0,90]) ringedFullSpar(sparWidth, sparRadius, sailWidth, ringCount, sailInsetOnSpar, ringRadius, interRingGap ) ; 
        }
        union() {
            
            for(ring = [0:ringCount-2]) {
                offset = ring == 0 ? 0: ringRadius*1.0 ;
                
                if (ring==0) {
                    translate([0,0.0,ring*(interRingGap)+0]) 
                        simpleSail(Height=Height, sailBelly=sailBelly,sailWidth=panelWidth+2*ringRadius,sailThickness=sailThickness) ;
                }
                else if (ring==ringCount-2) {
                    translate([0,0.0,ring*(interRingGap)+ringRadius*2.0]) 
                        simpleSail(Height=Height, sailBelly=sailBelly,sailWidth=panelWidth+3*ringRadius,sailThickness=sailThickness) ;
                }else {
                    translate([0,0.0,ring*(interRingGap)+ringRadius*2.0]) 
                        simpleSail(Height=Height, sailBelly=sailBelly,sailWidth=panelWidth,sailThickness=sailThickness) ;
                
                }
            }
        }
       
    }

    
}
else {
    echo("Ship Type '", shipType, "' is not a valid Empire of DustShip Type") ;
}
 
}
