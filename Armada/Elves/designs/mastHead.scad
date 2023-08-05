$fn=60 ;
module mastHead(height,baseDiam,topDiam,socketDiam){
    difference(){
        cylinder(r1=baseDiam/2, r2=topDiam/2,h=height);
        cylinder(r1=socketDiam, r2=socketDiam,h=height/4);

    }
}

mastHead(15,2,1.5,1/2) ;
