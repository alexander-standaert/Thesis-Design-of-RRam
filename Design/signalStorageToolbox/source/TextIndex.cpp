#include <string>
//#include <vector>
//#include <iostream>

/* TextIndex
 *
 * a helper class for sorting the names and keeping the indices attached
 *
 *
 */

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

