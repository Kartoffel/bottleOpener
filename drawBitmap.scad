/**
 * drawBitmap module
 * By Niek Blankers <niek@niekproductions.com>
 *
 * @param	array		bits			Bitmap array
 * @param	decimal	cubeSpacing	
 * @param	decimal	cubeSize
 *
 * Example:
 *
	bits=[
	[1,0,0],
	[1,0,0],
	[1,1,1],
	[1,0,1],
	[1,1,1]
	];
	cubeSize = 4;
	cubeSpacing = 5;

	drawBitmap(bits, cubeSpacing, cubeSize);
 *
 */

module drawBitmap(bits, cubeSpacing, cubeSize){
	rotate(a=180, v=[1,0,0]){
		for(i=[0:len(bits)-1]){
			translate([0,i*cubeSpacing,0]){
				cube(size = bits[i][0]*cubeSize, center = true);
				translate([cubeSpacing,0,0]) cube(size = bits[i][1]*cubeSize, center = true);
				translate([2*cubeSpacing,0,0]) cube(size = bits[i][2]*cubeSize, center = true);
			}
		}
	}
}