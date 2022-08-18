// Shared data for Armada Empire of Dust ships

// <EoDParameters.scad> 


sailMask = [[0,0],[1.5,0],[6,18.5],[4.5,26],[3,18.5],[0,18.5],[-3,18.5],[-4.5,26],[-6,18.5],[-1.5,0],
            [ 2.0,13.5],[ 4.0,15.5],[ 2.0,15.0],
            [-2.0,13.5],[-4.0,15.5],[-2.0,15.0]] ;
sailMaskPaths = [[0,1,2,3,4,5,6,7,8,9], [10,11,12], [13,14,15]] ;

sailManeRight = [[ 2.5,1],[ 4.0,1.5],[ 11.0,8],[ 12.0,9.5],[ 5.5,6],[ 12.0,10.5],[ 11.0,12.5],[ 6.0,10],[ 10.5,13.5],[ 7.0,18.5]] ;
sailManeLeft =  [[-2.5,1],[-4.0,1.5],[-11.0,8],[-12.0,9.5],[-5.5,6],[-12.0,10.5],[-11.0,12.5],[-6.0,10],[-10.5,13.5],[-7.0,18.5]] ;

ship =  shipType == "Monolith" ? 0 :
        shipType == "War Galley" ? 1 : 
        shipType == "Khopeshii" ? 2 :
        shipType == "Dust Chaser" ? 3 :
        shipType == "Soul Hunter" ? 4 :
        shipType == "Slave Squadron"  ? 5 : -1
;  // ship = -1 for an incorrect shipType name

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
ringCounts =       [0,       12,     8,     8,    0,     6] ;
sparRadii  =       [0.00,  1.12,  0.60,  0.60, 0.00,  0.48] ;
sparTapers =       [0.00,  0.00,  0.00,  0.00, 0.00,  0.00] ;
sailThicknesses =  [0.00,  1.25,  1.00,  1.00, 0.00,  0.80] ;
sailInsetsOnSpar = [0.00,  2.50,  2.00,  2.00, 0.00,  0.60] ;
sailBellies =      [0.00,  8.00,  7.00,  6.00, 0.00,  5.00] ;
mastHeights =      [0.00, 49.00, 27.00, 27.00, 0.00, 16.00] ;
mastRadiiBase  =   [0.00,  2.20,  0.60,  0.60, 0.00,  0.48] ;
mastRadiiTop   =   [0.00,  1.05,  0.60,  0.60, 0.00,  0.48] ;


sparWidth = sparWidths[ship] ;
sparRadius = sparRadii[ship] ;
sparTaper = sparTapers[ship] ;
sailThickness = sailThicknesses[ship] ;
sailInsetOnSpar = sailInsetsOnSpar[ship] ;
Height = heights[ship] ;    
ringCount = ringCounts[ship] ;
ringRadius = ringRadii[ship] ;
sailBelly = sailBellies[ship] ;
mastHeight= mastHeights[ship] ;
mastBaseR = mastRadiiBase[ship] ;
mastTopR  = mastRadiiTop[ship]  ;

sailWidth=sparWidth - 2*sailInsetOnSpar ;
outerRingSep = sailWidth-3*ringRadius ;
sailHeight = Height - sailBelly ;
firstRingZ = sailInsetOnSpar + 3*ringRadius ;
interRingGap = outerRingSep/(ringCount-1) ;

