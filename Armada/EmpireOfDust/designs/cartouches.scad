//Cartouche designs

$fn=30 ;

layerHeight = 0.12 ;
shipType = "Khopeshii" ;

ship =  shipType == "Monolith" ? 0 :
        shipType == "War Galley" ? 1 : 
        shipType == "Khopeshii" ? 2 :
        shipType == "Dust Chaser" ? 3 :
        shipType == "Soul Hunter" ? 4 :
        shipType == "Slave Squadron"  ? 5 : -1
;  // ship = -1 for an incorrect shpType name

d = 0.50 ;
//Vessels
vessels = [0,1,2,3,4,5] ;   // 0: Monolith, 
                            // 1: War Galley, 
                            // 2: Khopeshii, 
                            // 3: Dust Chaser, 
                            // 4: Soul Hunter, 
                            // 5: Slave Squadron

cartoucheHeights = [0.00, 22.00, 17.00, 15.00, 0.00,  0.00] ;
cartoucheWidths  = [0.00,  9.60, 07.40, 06.50, 0.00,  0.00] ;

cartoucheH = cartoucheHeights[ship] ;
cartoucheW = cartoucheWidths[ship] ;

module cartouche_frame(r, h) {
    translate([0,r,0])  
        linear_extrude(10*layerHeight) circle(r) ;
    translate([-r,r,0]) 
        linear_extrude(10*layerHeight) square([r*2.0,h-2*r],center=false) ;
    translate([0,h-1.0*r,0]) 
        linear_extrude(10*layerHeight) circle(r) ;

}

module cartoucheFrame (r, h) {
    translate([0,0,0]) 
        difference() {
            translate([0,0,0])               cartouche_frame(r=r, h=h) ;
            translate([0,0.5,4*layerHeight]) cartouche_frame(r=r-0.5, h=h-1.0) ;
        }
} 


cartoucheFrame(r=cartoucheW/2, h=cartoucheH) ;

