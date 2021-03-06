/*

Copyright 2018 Alan Steremberg

This openscad file will create a number of brackets that can be used to connect p25 displays from aliexpress, et al.

I received two sets of displays from the same vendor with different hole spacing. So I suggest you measure your display before printing a 
lot of brackets, and try to order all the panels at once, or specify to the vendor that you want the same hole spacing if you order
in multiple batches.


*/


/*
  configuration for hole spacing
*/

// original panels
//farHole = 65;
//closeHole=19.5;
//bracketWidth=30;
//bracketHeight=75;

// 16 newer panels
farHole = 14.25;
closeHole = 70.25;
bracketWidth=30;
bracketHeight=80;


terminalHoleWidth=53;
bracketThickness=6;

screwDiameter = 4.8;
screwRadius=screwDiameter/2;


/*
//panels:
https://www.aliexpress.com/item/32x32-Indoor-RGB-3in1-Small-Pixel-Pitch-HD-P2-5-Full-Color-160mm-x-160mm-LED/32728364405.html?spm=a2g0s.9042311.0.0.3ac84c4dsWJo2M
*/


/*
  This module is used to connect 4 panels, in the middle. 
  It is the basis for the terminal holder. - basically a center bracket, that we can put captive nuts into to attach a terminal strip to wire up the power and ground.
*/
module center_bracket() {

  difference(){
    
    union(){
        cube([bracketWidth,bracketHeight,bracketThickness],center=true);
        rotate(90)cube([bracketWidth,bracketHeight,bracketThickness],center=true);
    }
    union() {
        color("green") translate([closeHole/2,farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
        color("green") translate([-closeHole/2,farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
        color("green") translate([closeHole/2,-farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
        color("green") translate([-closeHole/2,-farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
        color("green") translate([farHole/2,closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
        color("green") translate([-farHole/2,closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
        color("green") translate([farHole/2,-closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
        color("green") translate([-farHole/2,-closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
    }
  }
}

/*
  half bracket for hooking two panels together
*/
module half_bracket() {
    halfBracketThickness=bracketThickness;
    difference(){
        union(){
    translate([0,bracketHeight/4,0]) cube([bracketWidth,bracketHeight/2,halfBracketThickness],center=true);
    rotate(90) translate([bracketWidth/4,0,0])cube([bracketWidth/2,bracketHeight,halfBracketThickness],center=true);
        }
        translate([0,-2,0]) union(){
               color("green") translate([closeHole/2,farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([-closeHole/2,farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([farHole/2,closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([-farHole/2,closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
        }
    }

}

// https://www.thingiverse.com/thing:2550079
// https://www.amazon.com/gp/product/B010UDG6NG/ref=oh_aui_detailpage_o05_s00?ie=UTF8&psc=1&tag=tv-auto-20
include <nutsnbolts/cyl_head_bolt.scad>;
include <nutsnbolts/materials.scad>;
$fn=60;
module terminal_holder(){
    difference(){
    
    union(){
    cube([bracketHeight,bracketHeight,bracketThickness],center=true);
    }
    union() {
               color("green") translate([closeHole/2,farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([-closeHole/2,farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([closeHole/2,-farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([-closeHole/2,-farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([farHole/2,closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([-farHole/2,closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([farHole/2,-closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([-farHole/2,-closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
        rotate(45) {
            translate([-bracketHeight/4-8,0,0]) {
        rotate([180,0,0]) nutcatch_parallel("M3", l=5);
        translate([0, 0, 50]) hole_through(name="M3", l=50+5, cl=0.1, h=10, hcl=0.4);
	    translate([terminalHoleWidth,0,0]) rotate([180,0,0]) nutcatch_parallel("M3", l=5);
	    translate([terminalHoleWidth,0,0]) translate([0, 0, 50]) hole_through(name="M3", l=50+5, cl=0.1, h=10, hcl=0.4);
            }
        }
    }
}

}


/*
This is a center bracket, with captive nuts for this terminal holder:
https://www.amazon.com/gp/product/B010UDG6NG/ref=oh_aui_search_detailpage?ie=UTF8&psc=1
*/

module terminal_holder2(){
    difference(){
    
    union(){
            center_bracket();
            color("red") translate([-20,-20,0])cube([10,10,bracketThickness],center=true);
            color("red") translate([20,20,0])cube([10,10,bracketThickness],center=true);
        }
    union() {
               color("green") translate([closeHole/2,farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([-closeHole/2,farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([closeHole/2,-farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([-closeHole/2,-farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([farHole/2,closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([-farHole/2,closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([farHole/2,-closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([-farHole/2,-closeHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
        rotate(45) {
            translate([-bracketHeight/4-8,0,0]) {
        rotate([180,0,0]) nutcatch_parallel("M3", l=5);
        translate([0, 0, 50]) hole_through(name="M3", l=50+5, cl=0.1, h=10, hcl=0.4);
	    translate([terminalHoleWidth,0,0]) rotate([180,0,0]) nutcatch_parallel("M3", l=5);
	    translate([terminalHoleWidth,0,0]) translate([0, 0, 50]) hole_through(name="M3", l=50+5, cl=0.1, h=10, hcl=0.4);
            }
        }
    }
}

}


/*
http://codeviewer.org/view/code:1b36 
Copyright (C) 2011 Sergio Vilches
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.
Contact: s.vilches.e@gmail.com


    ----------------------------------------------------------- 
                 Round Corners Cube (Extruded)                
      roundCornersCube(x,y,z,r) Where:                        
         - x = Xdir width                                     
         - y = Ydir width                                     
         - z = Height of the cube                             
         - r = Rounding radious                               
                                                              
      Example: roundCornerCube(10,10,2,1);                    
     *Some times it's needed to use F6 to see good results!   
 	 ----------------------------------------------------------- 
*/
// Test it!
// roundCornersCube(10,5,2,1);


module createMeniscus(h,radius) // This module creates the shape that needs to be substracted from a cube to make its corners rounded.
difference(){        //This shape is basicly the difference between a quarter of cylinder and a cube
   translate([radius/2+0.1,radius/2+0.1,0]){
      cube([radius+0.2,radius+0.1,h+0.2],center=true);         // All that 0.x numbers are to avoid "ghost boundaries" when substracting
   }

   cylinder(h=h+0.2,r=radius,$fn = 25,center=true);
}


module roundCornersCube(x,y,z,r)  // Now we just substract the shape we have created in the four corners
difference(){
   cube([x,y,z], center=true);

translate([x/2-r,y/2-r]){  // We move to the first corner (x,y)
      rotate(0){  
         createMeniscus(z,r); // And substract the meniscus
      }
   }
   translate([-x/2+r,y/2-r]){ // To the second corner (-x,y)
      rotate(90){
         createMeniscus(z,r); // But this time we have to rotate the meniscus 90 deg
      }
   }
      translate([-x/2+r,-y/2+r]){ // ... 
      rotate(180){
         createMeniscus(z,r);
      }
   }
      translate([x/2-r,-y/2+r]){
      rotate(270){
         createMeniscus(z,r);
      }
   }
}



module hanging_bracket(){
    difference(){
        union(){
            half_bracket();
            // x y z r
            translate([0,-3,0])roundCornersCube(bracketWidth,bracketWidth,bracketThickness,2);
        }
        color("green") translate([0,-8,0]) cylinder(r=screwRadius*1.5,h=20,center=true);
    }
}


/*

holds this power supply:
https://www.aliexpress.com/item/Switching-Power-Supply-350W-Slim-LED-Display-Power-Supply-5V60A-AC-Input-100-240V/32794581832.html?spm=a2g0s.9042311.0.0.3ac84c4dsWJo2M
*/

module power_supply_bracket(wide){
    powerHoleDistanceShort=100;
    powerHoldDistanceLong=143.5;
    powerBracketWidth=160;
    standoffHeight=20;
    screwHeadRadius=7;
    pwBracketWidth=bracketWidth+wide;

    difference(){
        union(){    
            cube([powerBracketWidth,pwBracketWidth,bracketThickness],center=true);
            translate([powerBracketWidth/2-8.5,0,standoffHeight/2+bracketThickness/2])cube([screwHeadRadius+10,pwBracketWidth,standoffHeight],center=true);
            translate([-powerBracketWidth/2+8.5,0,standoffHeight/2+bracketThickness/2])cube([screwHeadRadius+10,pwBracketWidth,standoffHeight],center=true);

        }
        union(){
            color("red") translate([powerHoleDistanceShort/2,0,0]) cylinder(r=screwRadius,h=50,center=true);
            color("red") translate([-powerHoleDistanceShort/2,0,0]) cylinder(r=screwRadius,h=50,center=true);
            color("red") translate([-powerHoldDistanceLong/2,0,0]) cylinder(r=screwRadius,h=50,center=true);
            color("red") translate([powerHoldDistanceLong/2,0,0]) cylinder(r=screwRadius,h=50,center=true);
            color("red") translate([-powerHoldDistanceLong/2,0,standoffHeight/2+bracketThickness/2-bracketThickness]) cylinder(r=screwHeadRadius,h=standoffHeight,center=true);
            color("red") translate([powerHoldDistanceLong/2,0,standoffHeight/2+bracketThickness/2-bracketThickness]) cylinder(r=screwHeadRadius,h=standoffHeight,center=true);
            
            
     if (wide>0)
     {
         color("red") translate([powerHoldDistanceLong/2,bracketWidth/2-screwRadius,0]) cylinder(r=screwRadius,h=50,center=true);
            color("red") translate([powerHoldDistanceLong/2,bracketWidth/2-screwRadius,standoffHeight/2+bracketThickness/2-bracketThickness]) cylinder(r=screwHeadRadius,h=standoffHeight,center=true);

            color("red") translate([powerHoldDistanceLong/2,bracketWidth/2-screwRadius,0]) cylinder(r=screwRadius,h=50,center=true);
            color("red") translate([powerHoldDistanceLong/2,bracketWidth/2-screwRadius,standoffHeight/2+bracketThickness/2-bracketThickness]) cylinder(r=screwHeadRadius,h=standoffHeight,center=true);
            
            color("red") translate([-powerHoldDistanceLong/2,bracketWidth/2-screwRadius,0]) cylinder(r=screwRadius,h=50,center=true);
            color("red") translate([-powerHoldDistanceLong/2,bracketWidth/2-screwRadius,standoffHeight/2+bracketThickness/2-bracketThickness]) cylinder(r=screwHeadRadius,h=standoffHeight,center=true);
     }
        }
    }
    
}


/*
holds this board:
http://www.novastar-led.com/product_detail.php?id=147&cid=42&pid=24
https://www.aliexpress.com/item/NOVA-MRV330-LED-Display-Receiving-Card-working-with-LED-Sending-Card-MSD300-for-led-video-wall/32764273212.html?spm=a2g0s.9042311.0.0.3ac84c4dsWJo2M
*/
module receive_board_bracket(){
    
    halfBracketThickness=bracketThickness;
    boardThickness=3;
    recvLength=145;
    recvWidth=92;
    powerBracketWidth=160;
    wide=0;
    powerHoleDistanceShort=100;
    powerHoldDistanceLong=143.5;
    standoffHeight=20;
    screwHeadRadius=7;
    pwBracketWidth=bracketWidth+wide;

    recvHoleDistanceLong=135.3;
    recvHoleDistanceShort=81.3;
    // 
    difference()
    {
        union(){    
            translate([0,recvWidth/2+bracketWidth/2,16.5])color("green")cube([recvLength,recvWidth,boardThickness],center=true);
            translate([0,14,7.5])color("yellow")cube([recvLength,5,21],center=true);
            color("blue") rotate(90) translate([bracketWidth/4,0,0])cube([bracketWidth/2,bracketHeight,halfBracketThickness],center=true);
        }
 
                translate([0,-2,0]) union(){
               color("green") translate([closeHole/2,farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
               color("green") translate([-closeHole/2,farHole/2,0]) cylinder(r=screwRadius,h=20,center=true);
                       translate([0,(recvWidth/2+bracketWidth/2)+2,15]) {
            color("red") translate([recvHoleDistanceLong/2,recvHoleDistanceShort/2,0]) cylinder(r=screwRadius,h=50,center=true);
            color("red") translate([-recvHoleDistanceLong/2,recvHoleDistanceShort/2,0]) cylinder(r=screwRadius,h=50,center=true);
            color("red") translate([recvHoleDistanceLong/2,-recvHoleDistanceShort/2,0]) cylinder(r=screwRadius,h=50,center=true);
            color("red") translate([-recvHoleDistanceLong/2,-recvHoleDistanceShort/2,0]) cylinder(r=screwRadius,h=50,center=true);

                       }
        }

    }
        
}




receive_board_bracket();
translate([200,100,0])power_supply_bracket(0);
translate([200,200,0])power_supply_bracket(10);
translate([-250,0,0])hanging_bracket();
translate([-400,0,5]) half_bracket();
//translate([150,0,0])center_bracket();
translate([-150,0,0])terminal_holder2();