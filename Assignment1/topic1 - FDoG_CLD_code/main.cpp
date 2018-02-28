#include "imatrix.h"
#include "ETF.h"
#include "fdog.h"
#include "myvec.h"
#include "cv.h"
#include "highgui.h"
main()
{
	imatrix img;

	// We assume that you have loaded your input image into an imatrix named "img"

	int image_x = img.getRow();
	int image_y = img.getCol();
	//////////////////////////////////////////////////

	//////////////////////////////////////////////////
	ETF e;
	e.init(image_x, image_y);
	//e.set(img); // get gradients from input image
	e.set2(img); // get gradients from gradient map
	e.Smooth(4, 2);
	//////////////////////////////////////////////////////

	///////////////////////////////////////////////////
	double tao = 0.99;
	double thres = 0.7;
	GetFDoG(img, e, 1.0, 3.0, tao);
	GrayThresholding(img, thres);
	/////////////////////////////////////////////
}

