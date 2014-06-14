/**
 * Coin bottle opener
 * Designed by Niek Blankers <niek@niekproductions.com>
 * 
 * Set fill to 90-100% for best results.
 * Insert coin during printing!
 * 
 */
include <drawBitmap.scad>;


/**
 * 50 euro cent coin:
 * Diameter: 24.5
 * Thickness: 2.5
 * 
 * 5 euro cent coin:
 * Diameter: 21.5
 * Thickness: 1.9
 */

coinDiameter = 21.5;
coinThickness = 1.9;
coinOffset = 6;
coinAngle = 0;

width=40;
length=70;
height=7;

frontWidth=45;

roundRadius=3;

edgeWidth=5;

openingWidth=width-(edgeWidth*2);
openingLength=13+coinDiameter/2-coinOffset;
openingHeight=height;
frontOpeningWidth=openingWidth+5;

backWidth = 15;
frontLength = openingLength+edgeWidth+coinDiameter/2-10;

chainHole = backWidth-4; //Keychain hole diameter

// For the Bitmap
bits=[
	[1,0,0],
	[1,0,0],
	[1,1,1],
	[1,0,1],
	[1,1,1]
];

cubeSize = 4;
cubeSpacing = 5;


module handle(){
	difference(){
		hull(){
				translate([-(frontWidth-width)/2,0,0]) roundedRect([frontWidth,frontLength/2,height], roundRadius);
				translate([0,frontLength/2,0]) roundedRect([width,frontLength/2,height], roundRadius);
				translate([width/2,length-backWidth,height/2]) cylinder(h=height, d=backWidth, center=true);
		}
		translate([width/2 + cubeSpacing,frontLength + (length-frontLength)/((length-frontLength)/cubeSize),height+1]) rotate(a=[0,0,180]) drawBitmap(bits, cubeSpacing, cubeSize);
	}
}

module logo(){
	
}

module opener(){

	difference(){

		handle();

		translate([(width/2)-(openingWidth/2),edgeWidth,-1]) hull(){
			translate([-(frontOpeningWidth-openingWidth)/2,0,0]) roundedRect([frontOpeningWidth,openingLength/2,openingHeight+2], roundRadius);
			translate([0,openingLength/2,0]) roundedRect([openingWidth,openingLength/2,openingHeight+2], roundRadius);
		}

		#translate([width/2,edgeWidth+openingLength+coinOffset,height/2]) rotate(a=-coinAngle,v=[1,0,0]){
			cylinder(h = coinThickness, d = coinDiameter, center = true);
		}

		translate([width/2,length-backWidth,height/2]) scale([1.0,0.8,1.0]) cylinder(h=height+1, d=chainHole, center=true);

	}	

}

opener();



module roundedRect(size, radius) { // from http://www.thingiverse.com/thing:9347/#comments
	x = size[0];
	y = size[1];
	z = size[2];
	
	linear_extrude(height=z)
		hull() {
			translate([radius, radius, 0])
			circle(r=radius);
	
			translate([x - radius, radius, 0])
			circle(r=radius);
	
			translate([x - radius, y - radius, 0])
			circle(r=radius);
	
			translate([radius, y - radius, 0])
			circle(r=radius);
	}
}