/*
rulerLabelledIncised.scad © 2022 by Stewart Stevens is licensed under Attribution-NonCommercial-ShareAlike 4.0 International. 

To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/

*/
// rulers for use in DBMM. Based on rulerlabelled.scad which had raised labels.  This incises them

//generate the ruler
module drawRuler(measureL,rulerW,rulerT,barker,label,labelH,paces){
    
    labelZ = rulerT + labelH ;
    
    linesOnRuler = (measureL/barker) *2  ;
    // Draw 'Ruler' base
    difference() {
        union() {
            cube([measureL,rulerW,rulerT]) ;
            
        }
        // Add ruler pace length label
        translate([2, 0.5*rulerWidth,labelZ/2]) color("brown")
                linear_extrude(height=labelZ)#text(label, font="Liberation Sans:style=Bold", size=2.8, spacing=0.9) ;
            // Add tick marks
            for (thisLine = [1:1:linesOnRuler]) {
                if (thisLine < linesOnRuler) { // draw tick marks   
                    translate([(0.5*thisLine*barker)-1.00, -0.01,labelZ/2]) color("blue")
                        cube([1, 1.5, labelZ]) ;  // Line
                    translate([(0.5*thisLine*barker)-1.00, rulerW-1.5+0.01, labelZ/2]) color("blue")
                        cube([1, 1.5, labelZ]) ;  // Line
                    if (barkers==10 && thisLine> 1) { // draw tick mark across with of ruler
                        translate([(0.5*thisLine*barker)-1.00, -0.01,labelZ/2]) color("blue")
                    cube([1, rulerW+0.02, labelZ]) ;}
                }
            }                
        for (thisLine = [1:1:linesOnRuler]) {
            if (thisLine == linesOnRuler) {
                if (thisLine<=2 ) { // draw 2 digit labels
            
                        translate([(0.5*thisLine*barker)-9, 1.5,labelZ/2]) 
                        scale([1,1.0,1.0])color("brown")
                        linear_extrude(height=labelZ)text(paces, font="Liberation Sans:style=Bold", size=3) ;
                }
            else { // draw 3 digit labels
                translate([(0.5*thisLine*barker)-11, 1.5, labelZ/2]) 
                scale([1,1.0,1.0])color("brown")
                linear_extrude(height=labelZ)text(paces, font="Liberation Sans:style=Bold", size=2.8, spacing=1.1) ;
            }
        }
        }
    }
    
}

miniatureScales = [2,6,10,12,15,20,25,28] ;
miniatureElementWidths = [30, 40, 40, 40 , 40, 40, 60, 60] ;
/* [Drop down box] */
// Miniature scale
miniSize = 15;  // [2:28]
// Number of 80 pace lengths on the ruler (2,4,5,6,8,9,10)
barkers = 6 ; // [2:1:10]

/* [Slider] */
//Ruler thickness (ideally a multiple of layer height)
rulerThickness = 2.40 ; // [2:4]

//Height of labels above ruler (ideally a multiple of layer height)
labelHeight = 0.96 ; // [0.4:2.0]

// Create ruler parameters from the above 5 values
arrayRef = search(miniSize, miniatureScales)  ;

elementWidth = miniatureElementWidths[arrayRef[0]] ;
/* [Slider] */
//Ruler Width - usually 10mm or element width
rulerWidth = 10.0 ; // [10:elementWidth]

barker = elementWidth ;

measureLength = barkers*elementWidth/2 ;  //mm

// labels for each 'length' of ruler          
rulers = ["Not used"
         ,"Not used"
         ,"80p"
         ,"Not used"
         ,"160p"
         ,"200p"
         ,"240p"
         ,"Not used"
         ,"320p"
         ,"360p"
         ,"400p"
         ]    ;     
     
// Troop types to be printed on each ruler (based on move distances)
labels = [ ""
         , ""
         , "Art(S)"
         , ""
         , "Bge,Bd,Bw,Hd,Pk,Sp,WWg,Wb,Art(I,O,X),Nav(X)"
         , "Ax, El, Kn, Ps, Bge(F), Bd(F), Hd(F), Pk(F), Wb(F), Art(F)"
         , "Cv, Cm, Exp, Kn(F)"
         , ""
         , "LH, Nav(I O S)"
         , "LH(F)"
         , "March move exclusion"
         ] ;


drawRuler( measureL=measureLength
         , rulerW  =rulerWidth
         , rulerT  =rulerThickness
         , barker  =barker
         , label   =labels[barkers]
         , labelH  =labelHeight
         , paces   =rulers[barkers]
         ) 
         ; 
// Enjoy
