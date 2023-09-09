
block Plant


parameter Real T = 1.0;

InputReal a;   // 
InputReal u;  // compression: 0 no compression
OutputReal x; // dissimilarity index = 1 - SSIM. best x = 0

algorithm

when initial() then
	x := 0;

elsewhen sample(0,T) then
 
       x := a*u;
  
end when;


end Plant;