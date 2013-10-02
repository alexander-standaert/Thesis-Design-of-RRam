#ifndef ticToc_H
#define ticToc_H

#include <iostream>
#include <time.h>

using namespace std;

clock_t tic( ) {
  return clock();
}

/*
 *  returns time between start and now, expressed in seconds
 */
double toc( clock_t start ) {
  clock_t stop = clock();
  double time = ( stop-start ) / ( (double) CLOCKS_PER_SEC );  
  return time;
}

double tocP( clock_t start ) {
  double time = toc( start );
  cout << ">>time elapsed: "<< time << "s" << endl;
  return time;
}

#endif // ticToc_H
