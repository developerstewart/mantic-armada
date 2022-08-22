clipHeightAboveWall = 4.00 ; // mm
towerHeight=120 ;
towerDepth=70 ;
towerWidth=70 ;
wallThickness = 2.00 ; // mm
baffleThickness = 1.50 ; // mm
baffleDepth     = 35.00 ; //mm
diceOpening = 26 ;

baffle1poly = [[0,0],[0,baffleDepth],[2*baffleThickness,baffleDepth],[baffleThickness,baffleDepth-2*baffleThickness],[baffleThickness,0]] ;
baffle2poly = [[0,0],[0,baffleDepth],[2*baffleThickness,baffleDepth],
                [baffleThickness,baffleDepth-2*baffleThickness],[baffleThickness,0]] ;
exitRampPoly = [[0,0],[0,65],[1.5,65],[1.5,0]] ;  // reset 40 back to 65

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

    cube([towerDepth, towerHeight, wallThickness]) ;
    
    translate([21,8.75,0])rotate([0,0,-70])color("red") baffleClip(clipWidth=12) ;

    translate([55,21,0])rotate([0,0,-70])color("red") baffleClip(clipWidth=12) ;
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

//baffle(baffleWidth=70,baffleOutline=baffle1poly) ;

//baffle(baffleWidth=70-2*wallThickness,baffleOutline=baffle2poly) ;



//translate([-1.5,12,-2])rotate([90,0,0])baffleClip(clipWidth=12) ;

//translate([30,0,0])cornerClip(shapeWidth=6) ;

exitRamp(shapeWidth=towerWidth-0*wallThickness, ShapeOutline=exitRampPoly) ;
towerSideLeft(towerDepth,towerHeight, wallThickness) ;
towerBase(towerDepth,towerWidth, wallThickness) ;

towerFront(towerWidth, towerHeight, wallThickness,diceOpening) ;

towerBack(towerWidth, towerHeight, wallThickness, towerDepth) ;