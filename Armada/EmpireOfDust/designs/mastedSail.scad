
shipType = "War Galley" ;


ship =  shipType == "Monolith" ? -1 :
        shipType == "War Galley" ? 1 : 
        shipType == "Khopeshii" ? 2 :
        shipType == "Dust Chaser" ? 3 :
        shipType == "Soul Hunter" ? -1 :
        shipType == "Slave Squadron"  ? 5 : -1
;  // ship = -1 for an incorrect shipType name

d = 0.50 ;
//Vessels
vessels = [0,1,2,3,4,5] ;   // 0: Monolith, 
                            // 1: War Galley, 
                            // 2: Khopeshii, 
                            // 3: Dust Chaser, 
                            // 4: Soul Hunter, 
                            // 5: Slave Squadron

sparWidths =       [0.00, 70.00, 46.00, 46.00, 0.00, 20.00] ;
heights =          [0.00, 35.00, 27.00, 27.00, 0.00, 16.00] ;
ringRadii =        [0.00,  0.40,  0.30,  0.30, 0.00,  0.20] ;
ringCounts =       [   0,    12,     8,     8,    0,     6] ;
sparRadii  =       [0.00,  1.12,  0.60,  0.60, 0.00,  0.48] ;
sparTapers =       [0.00,  0.00,  0.00,  0.00, 0.00,  0.00] ;
sailThicknesses  = [0.00,  1.25,  1.00,  1.00, 0.00,  1.00] ;
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



use <mast.scad> ;
use <sail.scad> ;
use <cartouches.scad> ;

//echo(str("Masted Sail")) ;


fullSail(shipType, ship) ;

showMast(shipType, ship) ;
