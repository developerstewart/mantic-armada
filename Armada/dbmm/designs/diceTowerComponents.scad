clipHeightAboveWall = 4.00 ; // mm
towerHeight=120 ; // mm
towerDepth=70 ; // mm
towerWidth=70 ; // mm
wallThickness = 2.00 ; // mm
baffleThickness = 1.50 ; // mm
baffleDepth     = towerDepth/2.00 ; // = 35.00 ; //mm;
baffle1BelowTop = 5 ;
diceOpening = 26 ; // mm

printOption = "C" ; // S=Sides, F=Front and Back, B=Baffles, C=Clips, T=Tray, Q=Base

baffle1poly = [ [0, 0],[baffleDepth, 0],[baffleDepth, 2*baffleThickness],
                [baffleDepth-2*baffleThickness,baffleThickness],[0, baffleThickness]] ;

baseClippoly = [ [0, 0],[baffleDepth, 0],[baffleDepth, wallThickness],
                 [0, wallThickness]] ;

module genShape(shapeWidth,ShapeOutline) {
        linear_extrude(shapeWidth) polygon(points=ShapeOutline ) ;
}

module towerFront(towerWidth, towerHeight, wallThickness,diceOpening) {

difference() {
    cube([towerWidth+2*wallThickness,towerHeight, wallThickness]) ;
    translate([5+wallThickness,-.01,-.01])cube([towerWidth-2*5, diceOpening+.02, wallThickness+.02]) ;
} 
}

module towerBack(towerWidth, towerHeight, wallThickness, towerDepth) {

    cube([towerWidth+2*wallThickness,towerHeight, wallThickness]) ;
 
}

module towerSideLeft(towerDepth, towerHeight, wallThickness) {
    //side plate
    cube([towerDepth, towerHeight, wallThickness]) ;
    //baffle clips
    translate([17.5,towerHeight-5-baffle1BelowTop-2*1.5/cos(60),0])baffleClip(clipWidth=35, rotateAngle=30) ;
    translate([17.5,towerHeight-60-baffle1BelowTop-2*1.5/cos(60),0])baffleClip(clipWidth=35, rotateAngle=30) ;
    translate([towerDepth-17.5,towerHeight-32-baffle1BelowTop-2*1.5/cos(60),0])baffleClip(clipWidth=30, rotateAngle=-30) ;
    translate([towerDepth-25,15,0])baffleClip(clipWidth=50, rotateAngle=-25) ;
}


module towerSideRight(towerDepth, towerHeight, wallThickness) {
    //side plate
    cube([towerDepth, towerHeight, wallThickness]) ;
    //baffle clips
        translate([towerDepth-17.5,towerHeight-5-baffle1BelowTop-2*1.5/cos(60),0])baffleClip(clipWidth=35, rotateAngle=-30) ;
        translate([towerDepth-17.5,towerHeight-60-baffle1BelowTop-2*1.5/cos(60),0])baffleClip(clipWidth=35, rotateAngle=-30) ;
        translate([17.5,towerHeight-32-baffle1BelowTop-2*1.5/cos(60),0])baffleClip(clipWidth=30, rotateAngle=30) ;
        translate([25,15,0])baffleClip(clipWidth=50, rotateAngle=30) ;
}

module towerBase(towerDepth,towerWidth, wallThickness){
    cornerSize=4.00 ; //mm
    cube([towerDepth+4*wallThickness, towerWidth+2*wallThickness, wallThickness]) ;
    translate([0,towerWidth-cornerSize-wallThickness,0])
        color("darkgrey") cornerClip(shapeWidth=cornerSize) ;
    translate([towerDepth-cornerSize+wallThickness,towerWidth+cornerSize,0]) rotate([0,0,-90])
        color("blue") cornerClip(shapeWidth=cornerSize) ;
    translate([cornerSize+3*wallThickness,0,0]) rotate([0,0,90])
        color("pink") cornerClip(shapeWidth=cornerSize) ;
    translate([towerDepth+4*wallThickness, cornerSize+3*wallThickness,0]) rotate([0,0,-180])
        color("yellow") cornerClip(shapeWidth=cornerSize) ;
    translate([(towerDepth+3*wallThickness-baffleDepth)/2,0.0*wallThickness,0]) 
        genShape(shapeWidth=4,ShapeOutline=baseClippoly) ;
    translate([(towerDepth+3*wallThickness-baffleDepth)/2,2.1*wallThickness,0]) 
        genShape(shapeWidth=4,ShapeOutline=baseClippoly) ;
    
    translate([(towerDepth+3*wallThickness-baffleDepth)/2,towerWidth+1.0*wallThickness,0]) 
        genShape(shapeWidth=4,ShapeOutline=baseClippoly) ;
    translate([(towerDepth+3*wallThickness-baffleDepth)/2,towerWidth-1.1*wallThickness,0]) 
        genShape(shapeWidth=4,ShapeOutline=baseClippoly) ;        

    translate([towerDepth-3.1*wallThickness+10, (towerDepth+3*wallThickness-baffleDepth)/2,0]) 
       rotate([0,0,90]) 
       color("cyan")genShape(shapeWidth=4,ShapeOutline=baseClippoly) ;
    translate([towerWidth-1*wallThickness+10,(towerDepth+3*wallThickness-baffleDepth)/2,0]) 
        rotate([0,0,90]) 
        color("blue")genShape(shapeWidth=4,ShapeOutline=baseClippoly) ;        
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

module baffleClip(clipWidth, rotateAngle) {
    rotate([0,0,-rotateAngle])
    translate([-clipWidth/2, -3*baffleThickness/2, 0])
    union() {translate([0,0,0])cube([clipWidth,3*baffleThickness,wallThickness]) ;
    translate([0,0,0])color("red")cube([baffleThickness,baffleThickness,wallThickness+clipHeightAboveWall]) ;
    translate([0,0,0])cube([clipWidth,baffleThickness,wallThickness+clipHeightAboveWall ]) ;
    translate([0,2*baffleThickness,0])cube([clipWidth,baffleThickness,wallThickness+clipHeightAboveWall ]) ;
    }
}


module baffle(baffleWidth,baffleOutline,ShapePoints) {

    cube([towerWidth, baffleDepth, baffleThickness]) ;
    translate([0,0,0]) cube([towerWidth, 2*baffleThickness, 2*baffleThickness]) ;
}

module exitRamp(shapeWidth,baffleThickness) {
    cube([60, shapeWidth, baffleThickness]) ;
 
}

if (printOption=="S") {
translate([-towerDepth-2,0,0])
towerSideLeft(towerDepth,towerHeight, wallThickness) ;

towerSideRight(towerDepth,towerHeight, wallThickness) ;
}
else if (printOption == "F") {
    translate([-towerWidth-2*wallThickness-3,0,0])towerFront(towerWidth, towerHeight, wallThickness,diceOpening) ;
    towerBack(towerWidth, towerHeight, wallThickness, towerDepth) ;
}
else if (printOption == "B") {
    color("brown") exitRamp(shapeWidth=towerWidth-0*wallThickness, baffleThickness=baffleThickness) ;
    translate([towerWidth,0,0]) color("cyan") baffle(baffleWidth=towerWidth,baffleOutline=baffle1poly) ;
    translate([towerWidth,baffleDepth+2,0]) color("white") baffle(baffleWidth=towerWidth,baffleOutline=baffle1poly) ;
    translate([towerWidth,2*baffleDepth+4,0]) color("grey") baffle(baffleWidth=towerWidth,baffleOutline=baffle1poly) ;
}
else if (printOption == "C") {
    translate([towerDepth+4*wallThickness+2,0,0]) cornerClip(shapeWidth=6) ;
    translate([towerDepth+4*wallThickness+2,15,0]) cornerClip(shapeWidth=6) ;
    translate([towerDepth+4*wallThickness+2,30,0]) cornerClip(shapeWidth=6) ;
    translate([towerDepth+4*wallThickness+2,45,0]) cornerClip(shapeWidth=6) ;
    
}
else if (printOption=="Q") {
    towerBase(towerDepth,towerWidth, wallThickness) ;
    
}
