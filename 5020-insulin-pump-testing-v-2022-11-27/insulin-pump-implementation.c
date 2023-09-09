#ifndef __EXT_LIB_C_INSULIN
#define __EXT_LIB_C_INSULIN

// Your code goes here
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

double insulin_pump(double r0, double r1, double r2)
{
  double y;

if (r2 < r1)
//Sugar level falling

  { return (0); }
 
 else // (r2 >= r1)

  if (fabs(r2 -r1) < 1E-6)
// Sugar level stable

   { return (0); }
    
  else // (r2 >= r1) and (r2 != r1)

   if ((r2 - r1) < (r1 - r0)) 
  // Sugar level increasing and rate of increase decreasing

  {  return (0); }
    
   else // (r2 >= r1) and (r2 != r1) and ((r2 - r1) >= (r1 - r0))
//SugarSugar level increasing and rate of increase stable or increasing

  {
    return( floor((r2 - r1)/72) );
 
    //    if (y >= 0) return(y); else return (0.1);
    
  }
 


}  /*  insulin_pump()  */


#endif
