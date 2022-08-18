
// Mantic Armada Empire of Dust Monolith Temple Holder
// This is to allow both the Monolith and Shobiks Wrath to be presented on one hull.


templeX=30.00 ; // mm
templeY=18.00 ; // mm
holderBorder = 2.00 ; //mm
SocketD=4.00 ; // Approx
magnetR=1.00 ; // I used 2mm diameter by 1 mm depth Neodymium magnets
magnetH=1.00 ; //
tolerance = 0.1 ; // mm to allow printer variations after slicing and for printing. 
$fn=60 ; // give nice rounded shapes
holderX=templeX + holderBorder*2 ; 
holderY=templeY + holderBorder*2 ; 
holderZ=16*0.12 ; //16 layers at Cura SuperQuality 0.12mm thickness

// the dimples on the bottom of the temple are offset 
// because the temple is offset on the platform on the model.
firstSocketX = 7.50 ; // mm in from the short side
secondSocketX = 20.00 ; // mm in rom the short side.

difference() {
    cube([holderX,holderY,holderZ]) ;  //draw base
    //and remove these bits
    {translate([firstSocketX+holderBorder,holderY/2,holderZ]) 
        sphere(r=SocketD/2) ;  //remove socket
    translate([secondSocketX+holderBorder,holderY/2,holderZ]) 
        sphere(r=SocketD/2) ;  //remove socket
    translate([holderBorder+firstSocketX+(secondSocketX-firstSocketX)/2,holderY/2, holderZ-magnetH-tolerance]) 
        cylinder(r=magnetR+tolerance, h=magnetH+3*tolerance) ;// remove magnet holder
    }
}
