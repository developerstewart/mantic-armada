//
/*

Yet Another Dice Tower
**********************
Created by Stewart Stevens, August 2022
Version 2.  Add clips to link the tower front nd back to the sides; Pretty the base and tray.

This file contains all the code required to generate the 11 components that make up the tower

Yet Another Dice Tower © 2022 by Stewart Stevens is licensed under Attribution-NonCommercial-ShareAlike 4.0 International. 

To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/

*/

clipHeightAboveWall = 4.00 ; // mm
towerHeight=120 ; // mm
towerDepth=70 ; // mm
towerWidth=70 ; // mm
trayEdgeHeight= 10 ;


wallThickness = 2.00 ; // mm
baffleThickness = 1.50 ; // mm
baffleDepth     = towerDepth/2.00 ; // = 35.00 ; //mm;
baffle1BelowTop = 5 ;

brickWidth = 10.5 ;brickDepth = wallThickness; brickHeight=7;

diceOpening = 26 ; // mm

// LS, RS= Left or Right Side;  (print one of each)
// TF, TB = Tower Front or Back; (print one of each)
// B = Baffle;  (Print 3 of these)
// E = 'Exit' slope; (print one )
// C = Coping/Tower top; (print one) 
// T = Tray ; (print one)
// Q = Base (print one)

printOption = "T" ; 

baffle1poly = [ [0, 0],[baffleDepth, 0],[baffleDepth, 2*baffleThickness],
                [baffleDepth-2*baffleThickness,baffleThickness],[0, baffleThickness]] ;


baseClippoly = [ [0, 0],[towerDepth-2*wallThickness, 0],[towerDepth-2*wallThickness, wallThickness],
                 [0, wallThickness]] ;

module genShape(shapeWidth,ShapeOutline) {
        linear_extrude(shapeWidth) polygon(points=ShapeOutline ) ;
}

module brick(brickWidth, brickHeight, brickDepth) {

    cube([brickWidth, brickHeight, brickDepth ]) ;

}

module crenellations(wallLength, crennelationCount, gap) {
    
    //gap = 7.75 ; //(wallLength-(crennelationCount*brickWidth))/(crennelationCount-1) ;
    echo(str("gap=",gap)) ;
    for (crennelation = [1:1:crennelationCount]) {
        translate([(crennelation-1)*(gap+brickWidth), 0, wallThickness-baffleThickness]) 
            brick (brickWidth, brickHeight, baffleThickness) ;
    }

}

module towerFront(towerWidth, towerHeight, wallThickness,diceOpening) {

difference() {
    union() {cube([towerWidth+2*wallThickness,towerHeight, wallThickness]) ;
        translate([0,wallThickness+.5,0]) 
            cube([wallThickness, towerHeight-wallThickness-0.5, 3*wallThickness]) ;
        translate([2*wallThickness,3*wallThickness+.5,0]) 
            cube([wallThickness, 20, 3*wallThickness]) ;
        color("red")translate([2*wallThickness,towerHeight-45-3*wallThickness-.5,0]) 
            cube([wallThickness, 35, 3*wallThickness]) ;
        translate([2*wallThickness,towerHeight/2-27-.5,0]) 
            cube([wallThickness, 20, 3*wallThickness]) ;
        translate([towerWidth+1*wallThickness,wallThickness+.5,0]) 
            cube([wallThickness, towerHeight-wallThickness-0.5, 3*wallThickness]) ;
        translate([towerWidth-1*wallThickness,3*wallThickness+.5,0]) 
            cube([wallThickness, 20, 3*wallThickness]) ;
        translate([towerWidth-1*wallThickness,towerHeight-45-3*wallThickness-.5,0]) 
            cube([wallThickness, 35, 3*wallThickness]) ;
        translate([towerWidth-1*wallThickness,towerHeight/2-27-.5,0]) 
            color("blue")cube([wallThickness, 20, 3*wallThickness]) ;
    }
    translate([5+1*wallThickness,-.01,-.01])cube([towerWidth-2*5, diceOpening+.02, wallThickness+.02]) ;
    translate([-.5,-.5,-.5]) cube([wallThickness+.6,wallThickness+.6+brickHeight,wallThickness+.6+brickHeight]) ;
    translate([towerWidth+1*wallThickness-.5,-.5,-.5]) cube([wallThickness+.6,wallThickness+.6+brickHeight,wallThickness+.6+brickHeight]) ;
    } 

}

module towerBack(towerWidth, towerHeight, wallThickness, towerDepth) {
    difference() {
        union () {
            cube([towerWidth+2*wallThickness,towerHeight, wallThickness]) ;

            translate([0,wallThickness+.5,0]) 
                cube([wallThickness, towerHeight-wallThickness-0.5, 3*wallThickness]) ;
           translate([2*wallThickness,3*wallThickness+.5,0]) 
                color("red")cube([wallThickness, 15, 3*wallThickness]) ;
            translate([2*wallThickness,towerHeight-20-3*wallThickness-.5,0])
                color("cyan")cube([wallThickness, 20, 3*wallThickness]) ;
            translate([2*wallThickness,towerHeight/2-25-.5,0]) 
                color("blue")cube([wallThickness, 35, 3*wallThickness]) ;

            translate([towerWidth+1*wallThickness,wallThickness+.5,0]) 
                cube([wallThickness, towerHeight-wallThickness-0.5, 3*wallThickness]) ;
            translate([towerWidth-1*wallThickness,3*wallThickness+.5,0]) 
                color("red") cube([wallThickness, 15, 3*wallThickness]) ;
            translate([towerWidth-1*wallThickness,towerHeight-20-3*wallThickness-.5,0]) 
                color("cyan") cube([wallThickness, 20, 3*wallThickness]) ;
            translate([towerWidth-1*wallThickness,towerHeight/2-25-.5,0]) 
                color("blue")cube([wallThickness, 35, 3*wallThickness]) ;
        }
        translate([-.5,-.5,-.5]) cube([wallThickness+.6,wallThickness+.6+brickHeight,wallThickness+.6+brickHeight]) ;
        translate([towerWidth+1*wallThickness-.5,-.5,-.5]) cube([wallThickness+.6,wallThickness+.6+brickHeight,wallThickness+.6+brickHeight]) ;
    }
}


module towerSide(towerDepth, towerHeight, wallThickness) {
            union() {
            //baffle clips
            translate([baffleThickness,towerHeight-2*baffle1BelowTop,0])
                color("green") baffleClip(clipWidth=35, rotateAngle=30) ;
            translate([baffleThickness,towerHeight-50-baffle1BelowTop-3*baffleThickness/cos(60),0])
               color("red") baffleClip(clipWidth=35, rotateAngle=30) ;
            
            translate([towerDepth-baffleThickness-cos(30)*35,65,0])
                color("grey") baffleClip(clipWidth=35, rotateAngle=-30) ;
            translate([towerDepth-3*baffleThickness-50*cos(30),50*cos(-60)-20,0])
                color("brown") baffleClip(clipWidth=50, rotateAngle=-25) ;
        }

}
module towerSideLeft(towerDepth, towerHeight, wallThickness) {
   
        union() {
            //side plate
            cube([towerDepth, towerHeight, wallThickness]) ;
            //baffle clips
            towerSide(towerDepth, towerHeight, wallThickness) ;
        }
                
}

module towerSideRight(towerDepth, towerHeight, wallThickness) {
rotate([0,180,0])
    translate([0,0,12])
        difference() {
            union() {
            //side plate
            translate([0,0,4*baffleThickness-.001]) color("purple") cube([towerDepth, towerHeight, wallThickness]) ;
            //baffle clips
            towerSide(towerDepth, towerHeight, wallThickness) ;
        }
        translate([-.0010,-.0010,-.0010]) color("white") cube([towerDepth+.002, towerHeight+.002, wallThickness+.002]) ;
}
}

module towerBase(towerDepth,towerWidth, wallThickness, type="Q"){
    cornerSize=4.00 ; //mm
    if (type=="Q") {
        cube([towerDepth+4*wallThickness, towerWidth+2*wallThickness, wallThickness]) ;

        //translate([towerDepth+3*wallThickness-0.5,0,wallThickness-0.05])rotate([90, 0, 90])
        //      color("pink")crenellations(wallLength=towerDepth+2*wallThickness, crennelationCount=5, gap=5.375) ;

    }
    else {
        
        translate([0,0,-0.5*wallThickness])
            cube([towerDepth+4*wallThickness, 3*wallThickness, wallThickness]) ;
         
        translate([0,0,-0.5*wallThickness])
            cube([3*wallThickness, towerWidth+2*wallThickness, wallThickness]) ;

        translate([0,towerWidth-1*wallThickness,-0.5*wallThickness])
            cube([towerDepth+4*wallThickness, 3*wallThickness, wallThickness]) ;

        translate([towerDepth+1*wallThickness,0,-0.5*wallThickness])
            cube([3*wallThickness, towerWidth+2*wallThickness, wallThickness]) ;
        
    }
    //Add Corners
    translate([0,towerWidth-cornerSize-wallThickness,0])
        color("darkgrey") cornerClip(shapeWidth=cornerSize) ;
    translate([towerDepth-cornerSize+wallThickness,towerWidth+cornerSize,0]) rotate([0,0,-90])
        color("blue") cornerClip(shapeWidth=cornerSize) ;
    translate([cornerSize+3*wallThickness,0,0]) rotate([0,0,90])
        color("pink") cornerClip(shapeWidth=cornerSize) ;
    translate([towerDepth+4*wallThickness, cornerSize+3*wallThickness,0]) rotate([0,0,-180])
        color("yellow") cornerClip(shapeWidth=cornerSize) ;

    //Add centres 
    //right wall   
    translate([(towerDepth-10*wallThickness-baffleDepth)/2,2.1*wallThickness,0]) 
        color("orange")genShape(shapeWidth=4,ShapeOutline=baseClippoly) ;
    translate([(towerDepth-10*wallThickness-baffleDepth)/2,0.0*wallThickness,0]) 
        color("lightgrey")genShape(shapeWidth=4,ShapeOutline=baseClippoly) ;
       translate([0,wallThickness,wallThickness-0.05])rotate([90, 0, 0])
        color("lightgrey")    crenellations(wallLength=towerDepth+4*wallThickness, crennelationCount=5,
            gap=((towerDepth+4*wallThickness)-5*brickWidth)/(4)) ;
    // left wall
    translate([(towerDepth-10*wallThickness-baffleDepth)/2,towerWidth-1.1*wallThickness,0]) 
        color("red")genShape(shapeWidth=cornerSize,ShapeOutline=baseClippoly) ;        
    translate([(towerDepth-10*wallThickness-baffleDepth)/2,towerWidth+1.0*wallThickness,0]) 
        color("palegreen")genShape(shapeWidth=4,ShapeOutline=baseClippoly) ;
    translate([0,towerWidth+2*wallThickness,wallThickness-0.05])rotate([90, 0, 0])
        color("palegreen")    crenellations(wallLength=towerDepth+4*wallThickness, crennelationCount=5,gap=6.375) ;
//backwall
    translate([towerDepth-3.1*wallThickness+10, (towerDepth-13.5*wallThickness-baffleDepth)/2,0]) 
       rotate([0,0,90]) 
       color("cyan")genShape(shapeWidth=cornerSize,ShapeOutline=baseClippoly) ;
    translate([towerWidth-1*wallThickness+10,(towerDepth-12*wallThickness-baffleDepth)/2,0]) 
        rotate([0,0,90]) 
        color("lightblue")genShape(shapeWidth=cornerSize,ShapeOutline=baseClippoly) ;
    translate([towerDepth+2*wallThickness+baffleThickness,0,wallThickness-0.05])rotate([90, 0, 90])
         color("lightblue")   crenellations(wallLength=towerDepth+2*wallThickness, crennelationCount=5,gap=5.375) ;
    
    if (type=="C") {  // add front wall
        translate([3.1*wallThickness, (towerDepth-13.5*wallThickness-baffleDepth)/2,0]) rotate([0,0,90]) 
            color("cyan")genShape(shapeWidth=cornerSize,ShapeOutline=baseClippoly) ;

        translate([1*wallThickness,(towerDepth-12*wallThickness-baffleDepth)/2,0]) rotate([0,0,90]) 
            color("blue")genShape(shapeWidth=cornerSize,ShapeOutline=baseClippoly) ;

        translate([0,0,wallThickness-0.05])rotate([90, 0, 90])
            color("blue")crenellations(wallLength=towerDepth+2*wallThickness, crennelationCount=5,gap=5.375) ;
    }        
    
    else {
        translate([0,0,wallThickness-0.05])rotate([90, 0, 90])
            color("blue") brick(brickWidth, brickHeight, baffleThickness) ;
        translate([0,towerWidth-5-wallThickness,wallThickness-0.05])rotate([90, 0, 90])
            color("blue") brick(brickWidth, brickHeight, baffleThickness) ;
    }                
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
    // Added to the sidd walls to 'hold the baffles'
    rotate([0,0,-rotateAngle])   
    union() {translate([0,0,0])cube([clipWidth,3*baffleThickness,wallThickness]) ;
    translate([0,0,0])color("red")cube([baffleThickness,baffleThickness,wallThickness+clipHeightAboveWall]) ;
    translate([0,0,0])cube([clipWidth,baffleThickness,wallThickness+clipHeightAboveWall ]) ;
    translate([0,2*baffleThickness,0])cube([clipWidth,baffleThickness,wallThickness+clipHeightAboveWall ]) ;
    }
}

module towerTray(towerHeight, towerWidth, towerDepth) {
    
    //floor
    color("pink")cube([towerHeight, towerWidth+2*wallThickness, wallThickness]) ;
    //left side
    translate([0,0,0]) color("darkgrey")
        cube([towerHeight, baffleThickness, wallThickness+trayEdgeHeight]) ;
    translate([-15,-wallThickness+.001,0]) color("lightgrey")
        cube([25, wallThickness, wallThickness+trayEdgeHeight]) ;
    translate([0,wallThickness,wallThickness+trayEdgeHeight-2])rotate([90,0,0])
        color("darkgrey") crenellations(wallLength=towerHeight+2*wallThickness, crennelationCount=7,gap=7.417) ;
    translate([0,1,wallThickness+trayEdgeHeight-2])rotate([90,0,0])
        color("darkgrey") crenellations(wallLength=towerHeight+2*wallThickness, crennelationCount=7,gap=7.417) ;
        //right side
    translate([0,towerWidth+1*wallThickness-.001,0]) color("darkgreen")
        cube([towerHeight, wallThickness, wallThickness+trayEdgeHeight]) ;
    translate([-15,towerWidth+2*wallThickness-.001,0]) color("lightgreen")
        cube([25, wallThickness, wallThickness+trayEdgeHeight]) ;
    translate([0,towerWidth+2*wallThickness-.001,wallThickness+trayEdgeHeight-2])rotate([90,0,0])
        color("darkgreen") crenellations(wallLength=towerHeight+2*wallThickness, crennelationCount=7,gap=7.417) ;
    translate([0,towerWidth+2*wallThickness+1,wallThickness+trayEdgeHeight-2])rotate([90,0,0])
        color("lightgreen") crenellations(wallLength=towerHeight+2*wallThickness, crennelationCount=7,gap=7.417) ;
    
    //end wall
    translate([towerHeight-baffleThickness,0,0]) color("lightblue")
        cube([baffleThickness, towerWidth+2*baffleThickness, wallThickness+trayEdgeHeight]) ;
    translate([towerHeight-baffleThickness-0.5,0,wallThickness+trayEdgeHeight-2]) rotate([90,0,90])
        color("lightblue")crenellations(wallLength=towerWidth+2*wallThickness, crennelationCount=5,gap=5.3125) ;
    translate([towerHeight-1,0,wallThickness+trayEdgeHeight-2]) rotate([90,0,90])
        color("lightblue")crenellations(wallLength=towerWidth+2*wallThickness, crennelationCount=5,gap=5.3125) ;

}


module baffle(baffleWidth,baffleOutline,ShapePoints) {
   
    cube([towerWidth-2*wallThickness, baffleDepth, baffleThickness]) ;
    translate([0,0,0]) cube([towerWidth-2*wallThickness, 2*baffleThickness, 2*baffleThickness]) ;
}

module exitRamp(shapeLength=53, shapeWidth,baffleThickness) {
    cube([shapeLength, shapeWidth, baffleThickness]) ; //Original value of 60 was too long to fit
 
}

if (printOption=="LS") {
        towerSideLeft(towerDepth,towerHeight, wallThickness) ;
}
else if (printOption=="RS") {
        
        towerSideRight(towerDepth,towerHeight, wallThickness) ;
}
else if (printOption == "TF") {
    towerFront(towerWidth, towerHeight, wallThickness,diceOpening) ;   
}
else if (printOption == "TB") {
    towerBack(towerWidth, towerHeight, wallThickness, towerDepth) ;
}
else if (printOption == "B") {
     color("grey") baffle(baffleWidth=towerWidth-2*wallThickness,baffleOutline=baffle1poly) ;
}
else if (printOption == "E") {
    color("brown") exitRamp(shapeWidth=towerWidth-2*wallThickness, baffleThickness=baffleThickness) ;
 }
 else if (printOption == "C") {
    
    towerBase(towerDepth,towerWidth, wallThickness, "C") ;  
    
}
else if (printOption=="Q") {
    towerBase(towerDepth,towerWidth, wallThickness, "Q") ;
    
}
else if (printOption == "T") {
    towerTray(towerHeight, towerWidth, towerDepth)  ;
}
else echo(str("printOption value '", printOption,"' is not valid.")) ;

