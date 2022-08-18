// Dice Tower
$fn = 60 ;
MaxTowerX = 70 ;
MaxTowerY = 70 ;
towerH    = 120  ;
baseZ     = 2.4 ;
maxDieSize = 25.00 ;


offsetX = 1.0; offsetY = 1.0; offsetZ = 1.0 ;

module towerBase(MaxTowerX, MaxTowerY, height ) {

        cube([MaxTowerX,MaxTowerY,height]) ; //cylinder(h=height, r=MaxTowerY/2) ;
    
    }

module baffle() {

}



translate([0,0,0]) towerBase(MaxTowerX, MaxTowerY, baseZ ) ;

difference() {
    translate([0,0,0]) towerBase(MaxTowerX, MaxTowerY, towerH ) ;

    translate([offsetX,offsetY,offsetZ]) towerBase(MaxTowerX - 2*offsetX , MaxTowerY - 2*offsetY, towerH+baseZ) ;
}

