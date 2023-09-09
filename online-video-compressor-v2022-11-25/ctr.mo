
block Controller


parameter Real T = 1.0;
parameter Real p = 0.5;

OutputReal u;  // compression: 0 no compression, 1 max compression
InputReal x; // dissimilarity index = 1 - SSIM. best x = 0
InputReal xref; // 

Real OldU, a, error;


algorithm

when initial() then
	OldU := 0;
	a := 1; 
	u := 0;
	error := 0;
elsewhen sample(0,T) then
        error := pre(x) - pre(xref);
        OldU := pre(u);
        a := pre(x)/max(0.01, OldU);
	u := OldU - (p/max(0.01, a))*error;

end when;


end Controller;