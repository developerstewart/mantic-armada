// Dice Tower
$fn = 60 ;
// Dimensions in millimetres

MaxTowerX = 70 ;
MaxTowerY = 70 ;
towerH    = 120  ;
baseZ     = 2.4 ;
maxDieSize = 25.00 ;
//
// Baffle atributes
//
baffleThickness = 1.5 ;
topBaffle       = 5.00 ;  // below top of the Tower
baffleAngle     = 60.0 ; // degrees
baffleZ         = 0.50 * MaxTowerX * cos(baffleAngle) ;
baffleX         = 0.75 * MaxTowerX * sin(baffleAngle) ;

offsetX = 1.0; offsetY = 1.0; offsetZ = 1.0 ;

module towerBase(MaxTowerX, MaxTowerY, height ) {

        cube([MaxTowerX,MaxTowerY,height]) ; //cylinder(h=height, r=MaxTowerY/2) ;
    
    }

module baffle1() {
mypoly1 = [[0,0],[0,32],[4,32],[2,28],[2,0]] ;

rotate([-90,-60,90])linear_extrude(MaxTowerX) polygon(mypoly1) ;
}


module baffle2() {

mypoly2 = [[0,0],[0,32],[2,32],[2,4],[4,0]] ;

rotate([90,-60,-90])linear_extrude(MaxTowerX) polygon(mypoly2) ;
}

module tower() {
// Draw physical base
translate([0,0,0]) towerBase(MaxTowerX, MaxTowerY, baseZ ) ;
// Draw tower exterior
difference() {
    translate([0,0,0]) towerBase(MaxTowerX, MaxTowerY, towerH ) ;

    translate([offsetX,offsetY,offsetZ]) towerBase(MaxTowerX - 2*offsetX , MaxTowerY - 2*offsetY, towerH+baseZ) ;
}

// Add top baffle
translate([MaxTowerX,0,towerH-topBaffle-0*baffleZ])       
        baffle1() ;

// Add second baffle
translate([MaxTowerX, MaxTowerY-28, towerH-topBaffle-2.5*baffleZ]) 
    //rotate([0,baffleAngle-90,0]) 
        baffle2() ;

// Add third baffle
translate([MaxTowerX,0,towerH-topBaffle-3.0*baffleZ]) 
    //rotate([0,90-baffleAngle,0])  
        baffle1() ;

// Add fourth baffles
translate([MaxTowerX, MaxTowerY-28, towerH-topBaffle-5.5*baffleZ]) 
    //rotate([0,baffleAngle-90,0]) 
        baffle2() ;
translate([MaxTowerX, MaxTowerY-56, towerH-topBaffle-6.5*baffleZ]) 
    //rotate([0,baffleAngle-90,0]) 
        baffle2() ;

}

//

module exit() {

  translate([0,5,21])rotate([0,90,0])cylinder(h=MaxTowerX+2, r=5) ;
rotate([0,0,0])cube([MaxTowerX+2,10,21]) ;   
}

difference() {
    tower() ;

    translate([-1,-5,-1])exit() ;
}

