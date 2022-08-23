clipHeightAboveWall = 4.00 ; // mm
towerHeight=120 ;
towerDepth=70 ;
towerWidth=70 ;
wallThickness = 2.00 ; // mm
baffleThickness = 1.50 ; // mm
baffleDepth     = 35.00 ; //mm
diceOpening = 26 ;

baffle1poly = [ [0,0],[0,baffleDepth],[2*baffleThickness,baffleDepth],
                [baffleThickness,baffleDepth-2*baffleThickness],[baffleThickness,0]] ;
baffle2poly = [[0,0],[0,baffleDepth],[2*baffleThickness,baffleDepth],
               [baffleThickness,baffleDepth-2*baffleThickness],[baffleThickness,0]] ;
exitRampPoly = [[0,0],[0,64],[baffleThickness,64],[baffleThickness,0]] ;  

module genShape(shapeWidth,ShapeOutline,ShapePoints) {
        linear_extrude(shapeWidth) polygon(points=ShapeOutline, paths=ShapePoints,convexity=10) ;
}

module towerFront(towerWidth, towerHeight, wallThickness,diceOpening) {

    translate([0,diceOpening,0])cube([wallThickness,towerHeight-diceOpening, towerWidth]) ;
 
}

module towerBack(towerWidth, towerHeight, wallThickness, towerDepth) {

    translate([towerDepth-wallThickness,0,wallThickness])cube([wallThickness,towerHeight, towerWidth]) ;
 
}

module towerSideLeft(towerDepth, towerHeight, wallThickness) {
    //side plate
    cube([towerDepth, towerHeight, wallThickness]) ;
    
    //Exit ramp clips
    translate([21,8.75,0])rotate([0,0,-70])color("red") baffleClip(clipWidth=12) ;
    translate([55,21,0])rotate([0,0,-70])color("red") baffleClip(clipWidth=12) ;

    //top ramp clips     
    translate([2,110,0])rotate([0,0,60])color("orange") baffleClip(clipWidth=12) ;
    translate([20,100,0])rotate([0,0,60])color("orange") baffleClip(clipWidth=10) ;

    //middle ramp clips     
    translate([towerDepth-5,86.5,0])rotate([0,0,-60])color("white") baffleClip(clipWidth=12) ;
    translate([towerDepth-22,76.5,0])rotate([0,0,-60])color("white") baffleClip(clipWidth=10) ;

    //bottom ramp clips     
    translate([2,55,0])rotate([0,0,60])color("orange") baffleClip(clipWidth=12) ;
    translate([20,45,0])rotate([0,0,60])color("orange") baffleClip(clipWidth=10) ;

}


module towerSideRight(towerDepth, towerHeight, wallThickness) {
    //side plate
    translate([0,0,towerDepth])cube([towerDepth, towerHeight, wallThickness]) ;
    
    //Exit ramp clips
    translate([21,8.75,towerDepth])rotate([0,180,-70])color("brown") baffleClip(clipWidth=12) ;
    translate([55,21,towerDepth])rotate([0,180,-70])color("brown") baffleClip(clipWidth=12) ;

    //top ramp clips     
    translate([2,110,towerDepth])rotate([0,180,60])color("brown") baffleClip(clipWidth=12) ;
    translate([20,100,towerDepth])rotate([0,180,60])color("brown") baffleClip(clipWidth=10) ;

    //middle ramp clips     
    translate([towerDepth-5,86.5,towerDepth])rotate([0,180,-60])color("brown") baffleClip(clipWidth=12) ;
    translate([towerDepth-22,76.5,towerDepth])rotate([0,180,-60])color("brown") baffleClip(clipWidth=10) ;

    //bottom ramp clips     
    translate([2,55,towerDepth])rotate([0,180,60])color("brown") baffleClip(clipWidth=12) ;
    translate([20,45,towerDepth])rotate([0,180,60])color("brown") baffleClip(clipWidth=10) ;

}

module towerBase(towerDepth,towerWidth, wallThickness){
    translate([-2,0,-2])rotate([90,0,0])cube([towerDepth+2*wallThickness, towerWidth+2*wallThickness, wallThickness]) ;
}

module cornerClip(shapeWidth) {

   //cornerClipPoints
    x0=0 ; x1=wallThickness-0.05; x2=2*wallThickness-0.05 ; x3= 3*wallThickness; x4=x3+clipHeightAboveWall ;
    y0=0 ; y1=x2 ; y2=x4-x2;y3=x4-x1; y4=x4 ;
    cornerClipPoints = [[x0,y0],[x1,y0],[x2,y0],[x3,y0],[x2,y2],[x4,y2],[x4,y1],[x3,y1],[x0,y4],[x4,y4],[x4,y3],[x1,y3]] ;
    //                     0       1       2       3       4       5       6       7       8       9       10      11

    shape1 = [[x2,y0],[x2,y2],[x4,y2],[x4,y1],[x3,y1],[x3,y0]];
    shape2 = [[x0,y0],[x0,y4],[x4,y4],[x4,y3],[x1,y3],[x1,y0]] ;
    shape3 = [[x0,y0],[x0,y4],[x4,y4],[x4,y1],[x3,y1],[x3,y0]] ;
    union() {
        genShape(shapeWidth=shapeWidth,ShapeOutline=shape1) ;
        genShape(shapeWidth=shapeWidth,ShapeOutline=shape2) ;
        genShape(shapeWidth=shapeWidth-clipHeightAboveWall,ShapeOutline=shape3) ;
    }

}

module baffleClipNew1(clipWidth) {
    translate([0,-wallThickness,0])cube([clipWidth,wallThickness,3*baffleThickness]) ;
    translate([0,-1*(wallThickness+clipHeightAboveWall),0])cube([clipWidth,wallThickness+clipHeightAboveWall,baffleThickness ]) ;
    translate([0,-1*(wallThickness+clipHeightAboveWall),2*baffleThickness])cube([clipWidth,wallThickness+clipHeightAboveWall,baffleThickness ]) ;
    
}
module baffleClipNew2(clipWidth) {
    translate([0,0,0])cube([clipWidth,wallThickness,3*baffleThickness]) ;
    translate([0,0,0])cube([clipWidth,wallThickness+clipHeightAboveWall,baffleThickness ]) ;
    translate([0,0,2*baffleThickness])cube([clipWidth,wallThickness+clipHeightAboveWall,baffleThickness ]) ;
    
}
module baffleClip(clipWidth) {
        baffleClipPoly=[[0,0],[3*baffleThickness,0],[3*baffleThickness,clipHeightAboveWall+wallThickness],
                [2*baffleThickness+0.05,clipHeightAboveWall+wallThickness],
                [2*baffleThickness+0.05,wallThickness], [baffleThickness-0.05,wallThickness],
                [baffleThickness-0.05,clipHeightAboveWall+wallThickness], [0,clipHeightAboveWall+wallThickness]]
                ;

    rotate([90,0,0])genShape(shapeWidth=clipWidth,ShapeOutline=baffleClipPoly) ;
}

module baffle(baffleWidth,baffleOutline,ShapePoints) {
    genShape(shapeWidth=baffleWidth,ShapeOutline=baffleOutline,ShapePoints) ;
}

module exitRamp(shapeWidth,ShapeOutline) {
    translate([7,wallThickness,0])rotate([0,0,-70]) genShape(shapeWidth,ShapeOutline) ;
    //baffle(baffleWidth=70-2*wallThickness,baffleOutline=exitRampPoly) ;
}

//topBaffle

    translate([wallThickness,112,70-2*wallThickness])rotate([-180,0,60])
        baffle(baffleWidth=towerWidth-2*wallThickness,baffleOutline=baffle2poly) ;

// Middle baffle
    translate([towerDepth-wallThickness,85,-1*(towerWidth-2*wallThickness)])rotate([0,0,-180-60])color("grey")
        baffle(baffleWidth=towerWidth,baffleOutline=baffle1poly) ;

// lowest baffle
    translate([wallThickness,57,towerWidth-2*wallThickness])rotate([-180,0,60])
        baffle(baffleWidth=towerWidth,baffleOutline=baffle1poly) ;


//translate([-1.5,12,-2])rotate([90,0,0])baffleClip(clipWidth=12) ;

//translate([30,0,0])cornerClip(shapeWidth=6) ;

exitRamp(shapeWidth=towerWidth-0*wallThickness, ShapeOutline=exitRampPoly) ;
//towerBase(towerDepth,towerWidth, wallThickness) ;

//towerFront(towerWidth, towerHeight, wallThickness,diceOpening) ;

//towerBack(towerWidth, towerHeight, wallThickness, towerDepth) ;
//rotate([0,180,0])towerSideLeft(towerDepth,towerHeight, wallThickness) ;

//towerSideRight(towerDepth,towerHeight, wallThickness) ;

translate([-20,0,0])baffleClipNew1(12) ;
translate([-20,0,0])color("red")baffleClipNew2(12) ;