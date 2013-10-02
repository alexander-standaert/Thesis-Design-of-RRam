#include <string>
#include <vector>
#include <iostream>
#include <algorithm>
#include "ticToc.cpp"

#include "CompressedNames.cpp"

unsigned int* compressSignals( vector<string> names, vector<string> units, string title, 
                      string headerFileName );

using namespace std;

class TextIndex
{
public:
  string text;
  unsigned int index;
  TextIndex(string text_, unsigned int index_ );
  ~TextIndex();
};

TextIndex::TextIndex( string text_, unsigned int index_ ) {  // constructor
    text = text_ ;
    index= index_;
}
TextIndex::~TextIndex() {  //destructor
    //cout << "detroying index " << index << endl;   
}


bool myCompare ( TextIndex* text1, TextIndex* text2 ) { 
        return ( (text1->text)<(text2->text) ); 
}



/*
 *  returns order in which the names appear in the compressed header
 *  ( the body has to be written by first outputting signal r[0], then r[1], etc. )
 */
unsigned int*  
compressNames( vector<string> names, vector<string> units, string title, 
               string headerFileName ) {
  clock_t start;
 
  vector<TextIndex*> namesWithIndex;
 
  
  cout << "append units to the names" <<endl;
  start=tic();
  for( unsigned int i=0 ; i<names.size() ; i++ ) {
    names.at(i).append( " " );
    names.at(i).append( units.at(i) );
    cout << "==>'" << names.at(i) << "' '"<< units.at(i) << "'<==" << endl;
    if( units.at(i).length()==0 ) {
      names.at(i).append( "?" );
    }
  }
  tocP( start );

  cout << "expand strings with indices" <<endl;
  start=tic();
  for( unsigned int i=0 ; i<names.size() ; i++ ) {
    TextIndex* textIndex = new TextIndex( names[i], i );
    namesWithIndex.push_back( textIndex );
  }
  tocP( start);

  cout << "sorting data with index" << endl;
  start = tic();
  std::sort( namesWithIndex.begin(), namesWithIndex.end(), myCompare );
  tocP( start );

  cout << "extracting the order of waves and sorting names" << endl;
  start=tic();
  unsigned int* order = new unsigned int[ namesWithIndex.size() ];
  vector<string> sortedNames;
  for( unsigned int i=0 ; i<namesWithIndex.size() ; i++ ) {
    order[ i ] = namesWithIndex.at(i)->index;
    sortedNames.push_back( namesWithIndex.at(i)->text );
  }
  tocP( start);


  /* 
  cout << "outputting both to file" << endl;
  ofstream myfile;
  myfile.open ("sort1.txt");
  for( int i=0 ; i<names.size() ; i++ ) {
    myfile << names[i] << endl;
  }
  myfile.close();
  myfile.open ("sort2.txt");
  for( int i=0 ; i<namesWithIndex.size() ; i++ ) {
    myfile << namesWithIndex.at(i)->index << " " << namesWithIndex.at(i)->text << endl;
  }
  myfile.close();
  */

  CompressedNames* compressedNames= new CompressedNames( sortedNames );
  compressedNames->compressNames( );
  compressedNames->writeToHeader( headerFileName, title ); 


   

  // clear up data
  for( unsigned int i=0 ; i<namesWithIndex.size() ; i++ ) {
    delete namesWithIndex[i];
  } 
  namesWithIndex.clear();
  sortedNames.clear();

  delete compressedNames;

  return order;
}


/*
 *  compress the names into sets and names
 */
/*
names  = yNamesSorted;
namesX = names;
dots   = countDots( names );
maxDots = max(dots);
setsX = {};


for i=maxDots:-1:1
   fprintf("starting iteration %d\n", i);
   tic;
   [ namesX setsX ] = compressNames(  namesX, setsX, i );
   toc;
   
   savefile = sprintf( 'state_%d',  i);
   save( savefile, 'setsX', 'namesX' );
   
   length(setsX)
   length(namesX)
   
end
*/
       
