/**
 *
 * class to create the header file for the UWI plugins
 *
 * supports both compressed and non-compressed headers
 * ( both can be read with the same java compressed header reader )
 *
 *  Author: Stefan Cosemans ( stefan.cosemans@gmail.com )
 *  last modified: 2010-07-14
 *
 */

#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include <algorithm>
#include "ticToc.cpp"


#include "Header.h"

#include "TextIndex.cpp"



using namespace std;

int debugHeader=0;
int verboseHeader=1;

/*  Constructor {{{1
 */
Header::Header( ) {  // constructor
  clear();
} // }}}1

/*  Destructor {{{1
 */
Header::~Header() {  //destructor
  cout << "cleaning up Header" << endl;
  clear();
} // }}}1

/*  int addSignal( int simulatorIndex, string name, String unit ) {{{1
 *
 *  names(simulatorIndex) = names;
 *  units(simulatorIndex) = unit; 
 *
 *  if the (name, unit) combination is new for this header,
 *    it is added to the names, units and outputIndexForSimulatorIndex
 *    the output index is returned
 *  if the (name, unit) combination is already stored, the
 *    output index for this simulator refers to the previously stored version,
 *    the simulatorIndex is marked as duplicate, and the previously stored
 *    outputIndex is returned
 */
unsigned long
Header::addSignal( unsigned long simulatorIndex, string name, string unit ) {

  //we assume that simulatorIndex increases monotonically
  if( simulatorIndex!= names.size() ) {
    cout << "ERROR: Header::addSignal : simulatorIndex!=names.size() " << endl;
  }
  
  clock_t start=tic();  

  if( unit.length()==0 ) {
    unit = "?";
  }

  long previousOutputIndex = getPreviousOutputIndex( name, unit );
  
  names.push_back( name );  // must happen after getPreviousOutputIndex
  units.push_back( unit );
  
  int isNewSignal = (previousOutputIndex==-1);

  if( isNewSignal ) {
    outputIndexForSimulatorIndex.push_back( nextOutputIndex );
    isDuplicate.push_back( 0 );
    nextOutputIndex = nextOutputIndex+1;
    return (nextOutputIndex-1);
  } else {
    outputIndexForSimulatorIndex.push_back( previousOutputIndex );
    isDuplicate.push_back( 1 );
    return previousOutputIndex;
  }
  if( verboseHeader ) {
    cout << "time to add signal "  << simulatorIndex << ":" << endl;
    tocP( start);
  }
}  // }}}1

/* writeFlatHeader( filename, title ) {{{1
 *
 *   write a flat header file to the requested filename, using the provided title
 *   updates simulatorIndexOrder
 */
void
Header::writeFlatHeader( string filename, string title ) {
  writeFlatHeaderInternal( filename, title );
  updateOrderForFlatHeader();
} // }}}1

/* writeCompressedHeader( filename, title ) {{{1
 *
 *   write a flat header file to the requested filename, using the provided title
 *   performs compression from 
 *   (names units isDuplicate outputIndexForSimulatorIndex) 
 *     ==> ( sortedNames, sets, simulatorIndexOrder )
 *
 *   updates simulatorIndexOrder
 */
void
Header::writeCompressedHeader( string filename, string title ) {
  sortNames();
  compressNames();
  writeCompressedHeaderInternal( filename, title );
  simulatorIndexOrder = sortedSimulatorIndexOrder;
} // }}}1

/* updateOrderForFlatHeader( ) {{{1
 *    updates this.simulatorIndexOrder according to writing a flat header
 */ 
void 
Header::updateOrderForFlatHeader( ) {

  simulatorIndexOrder.clear();

  unsigned long numberOfSimulatorIndices = names.size();
  for( unsigned long i=0 ; i<numberOfSimulatorIndices ; i++ ) { //i=simulatorIndex
    if( !isSimulatorSignalDuplicate( i ) ) {
      simulatorIndexOrder.push_back( i ); 
    } 
  }
} // }}}1

/* long getPreviousOutputIndex( name, unit ) {{{1 
 *    return -1 if this (name,unit) combination is not yet stored in the header
 *    return the previous outputIndex for this combination if it is already
 *    stored
 *
 *  TODO: implement more efficiently (hashmap)
 */
long
Header::getPreviousOutputIndex( string name, string unit ) {
  for( unsigned long i=0 ; i<names.size() ; i++ ) {
    if( name==names.at(i) && unit==units.at(i) ) {
      return outputIndexForSimulatorIndex.at(i) ;
    }
  }
  return -1;
} // }}}1

/* clear() {{{1
 *
 *    erase all content from this CompressedHeader
 */
void
Header::clear() {
  names.clear();
  units.clear();
  outputIndexForSimulatorIndex.clear();
  isDuplicate.clear();
  sortedNames.clear();
  sortedSimulatorIndexOrder.clear();
  
  for( unsigned long i=0 ; i<sets.size() ; i++ ) {
    sets.at(i).clear();
  }
  sets.clear();

  newSortedNames.clear();
  simulatorIndexOrder.clear();

  nextOutputIndex=0;
} // }}}1

// getSignalNameForSimulatorIndex {{{1
string 
Header::getSignalNameForSimulatorIndex( unsigned long simulatorIndex ) {
  return names.at( simulatorIndex ); 
} // }}}1


// getSignalUnitForSimulatorIndex {{{1
string 
Header::getSignalUnitForSimulatorIndex( unsigned long simulatorIndex ) {
  return units.at( simulatorIndex ); 
} // }}}1

// getOutputIndexForSimulatorIndex {{{1
unsigned long
Header::getOutputIndexForSimulatorIndex( unsigned long simulatorIndex ) {
  return outputIndexForSimulatorIndex.at( simulatorIndex ); 
} // }}}1

//  isSimulatorSignalDuplicate {{{1
int
Header::isSimulatorSignalDuplicate( unsigned long simulatorIndex ) {
  return isDuplicate.at( simulatorIndex ); 
} // }}}1

// getNumberOfOutputSignals {{{1
unsigned long
Header::getNumberOfOutputSignals( ) {
  return nextOutputIndex;
} // }}}1

/* getSimulatorIndexFromOrder( orderIndex ) {{{1
 *
 * only call this after calling writeFlatHeader or writeCompressedHeader
 */
unsigned long
Header::getSimulatorIndexFromOrder( unsigned long orderIndex ) {
  return simulatorIndexOrder.at( orderIndex );
} // }}}1

/* vector< unsigned long > getSimulatorIndexOrder() {{{1
 * 
 *   get the order in which the simulatorSignals must be outputted to match the
 *   order in the header
 */
//vector< unsigned long > 
//Header::getSimulatorIndexOrder() {
//  return simulatorIndexOrder;
//} // }}}1

/* addPrefixPostfixes {{{1
 *  this prefix-postfixes combination is added to this.newSortedNames / this.sets
 *
 *  prefix     = base part of string that is equal for all full names considered
 *               full names are prefix + postfix
 *
 *  postfixes  = the list of all the postfixes that occur with the given prefix
 *  
 *  if  postfixes is empty, don't do anything (TODO: find out when this happens)
 *
 *  if postfixes contains a single element, add the prefix to newSortedNames.
 *  Don't make a new set
 *
 *  if the postfixes contains more than one element, 
 *  it is added to this.sets (if not already in there),
 *  and an entry referring to prefix+#setId is added to newSortedNames
 */  
void
Header::addPrefixPostfixes( string prefix, vector<string> postfixes ) {

  string name=prefix;
  
  // if there are no elements left in the currentSet there is nothing to do {{{2
  if( postfixes.size()==((unsigned int) 0) ) {
    cout << "addPrefixPostfixes was called with empty postfixes for prefix '"
         << prefix << "'" << endl;
    return;
  } // }}}2

  // if there is only one element in postfixes, we don't create a set {{{2
  if( postfixes.size()==((unsigned int) 1) ) {
    name.append( postfixes.at( 0 ) );
    newSortedNames.push_back( name );
    return;
  } // }}}2

  // multiple elements in postfixes, make it a set.  {{{2
  // Use an existing set if it already exists, otherwise, make a new set..
  int setIndex = addSetAndGetIndex( postfixes );
  char a[100];
  sprintf( a, "#%d", setIndex ); 
  name.append( a );   
  newSortedNames.push_back( name );
  // }}}2

} // }}}1

/* addSetAndGetIndex( postfixes ) {{{1
 *   Add the given set of postfixes to the list of sets if it is not already in there
 *   Return the index of this set used for printing #%d. This index starts at 1.
 */ 
unsigned int
Header::addSetAndGetIndex( vector<string> postfixes ) {
  for( unsigned int i=0; i<sets.size() ; i++ ) {
    if( sets.at(i)==postfixes ) {
      return i+1;
    }
  }
  sets.push_back( postfixes );
  return sets.size();
} // }}}1

/* findDots( string name ) {{{1
 *   return the indices of dots ('.') in this string
 */ 
vector<unsigned int> 
Header::findDots( string name ) {
  vector<unsigned int> dotIndices;
  for( unsigned int i=0; i<name.length() ; i++ ) {
    if( name.at(i)=='.' ) {
      dotIndices.push_back( i ); ;
    }
  }
  return dotIndices;
} // }}}1

/* countDots( string name ) {{{1
 *   return the number of dots ('.') in this string
 */ 
int 
Header::countDots( string name ) {
  int dots=0;
  for( unsigned int i=0; i<name.length() ; i++ ) {
    if( name.at(i)=='.' ) {
            dots++;
    }
  }
  return dots;
} // }}}1

/* countDots( vector<string> theseNames ) {{{1
 *   return the maximal number of dots that occurs in any of names
 */
int
Header::countDots( vector<string> theseNames ) {
  unsigned int L= theseNames.size();
  int* dots = new int[ L ];

  int maxDots=0;
  for( unsigned int i=0 ; i<L ; i++ ) {
    string name = theseNames.at(i);
    int count = countDots( name );
    dots[ i ] = count;
    maxDots = max( maxDots, count );
    //cout << "name: " << name << ", dots=" << count << endl; 
  } 

  delete[] dots;
  return maxDots;
} // }}}1

/* compressNames( unsigned int dotIndex ) {{{1
 *
 *   perform one level of compression, splitting the names in this.names in 
 *   prefix.postfix , where the . is the dot with the given dotIndex 
 *   ( dotIndex starts at 1 )
 *
 *   sets, sortedNames ==> one level deeper compressed ( sets,sortedNames )
 */
void
Header::compressNames( unsigned int dotIndex ) {
  
  string currentPrefix="";
  vector<string> postfixesForPrefix;
  string prefix;
  string postfix;

  if( debugHeader ) { // write temporary header file{{{2
    writeToHeaderDebug( "tempHeader_A_", dotIndex, "for debug only" );
  } // }}}2

  // loop over all sortedNames {{{2
  for( unsigned int i=0 ; i<sortedNames.size() ; i++ ) {

    // split in prefix-postfix {{{3
    string name = sortedNames.at( i );
    vector<unsigned int> dotIndices = findDots( name );
    if( dotIndices.size() >= dotIndex ) {
      unsigned int dotI = dotIndices.at( dotIndex-1 );
      prefix  = name.substr( 0, dotI );  //startpos, length
      postfix = name.substr( dotI ); // startpos, to end of string (includes dot)
    } else {
      prefix  = name;
      postfix = "";
    }
    dotIndices.clear(); //should not be necessary
    // }}}3

    // what to do with this entry ? {{{3
    if( prefix.compare( currentPrefix )==0 ) {
      //==>same prefix as the previous entry/entries, add postfix to postfixesForPrefix
      postfixesForPrefix.push_back( postfix );      
      if( debugHeader ) { // {{{4
        cout << "same prefix: '" << currentPrefix << "'.'" << postfix << "'" << endl;
      } // }}}4
    } else {
      //==>different prefix ; 
      if( debugHeader ) { // {{{4
        cout << "old prefix: '" << currentPrefix << "'" << endl; 
        cout << "--------------- '" << endl; 
        cout << "new prefix: '" << prefix        << "'.'" << postfix << "'" << endl;
      } // }}}4
      //====> first process current prefix+postFixes 
      this->addPrefixPostfixes( currentPrefix, postfixesForPrefix );                  
      postfixesForPrefix.clear();                
      //====> then start a new set for this entry
      postfixesForPrefix.push_back( postfix );
      currentPrefix=prefix;            
    } // }}}3
           
    if( (i % 100000) ==0 ) {  // progress monitor {{{3
      cout << i << ". number of sets=" << sets.size() 
                << "; length of newSortedNames="<< newSortedNames.size() << endl; 
    } // }}}3

  } // }}}2

  // save last currentPrefix - postfixesForPrefix {{{2
  this->addPrefixPostfixes( currentPrefix, postfixesForPrefix );
  postfixesForPrefix.clear(); //should not be needed
  // }}}2

  // transfer newSortedNames to sortedNames{{{2
  cout << ">> number of sets=" << sets.size() 
       << "; length of newSortedNames="<< newSortedNames.size() << endl; 

  sortedNames.clear();
  sortedNames = newSortedNames;
  newSortedNames.clear();
  // }}}2
 
  if( debugHeader ) { //  write temporary header file {{{2
    writeToHeaderDebug( "tempHeader_B_", dotIndex, "for debug only" );
  } // }}}2

} // }}}1

/* compressNames( ) {{{1
 *
 *   sort names,units,isDuplicate,outputIndexForSimulatorIndex 
 *     sortedNames ==> compressed ( sortedNames, sets )
 *
 */
void
Header::compressNames( ) {

  sets.clear();

  // count dots {{{2
  cout << "Counting dots" << endl;
  clock_t start=tic();
  int maxDots = countDots( names );
  tocP( start);
  // }}}2

  // perform compression iterations {{{2
  // i indicates that we split prefix-postfix on the i-th dot (dot index starts at 1)
  for( unsigned int i=maxDots ; i>=1 ; i-- ) {
    cout << "starting iteration for dot position " << i << endl;
    start=tic();
    compressNames( i );
    tocP( start );

    if( debugHeader ) {  // debug output{{{3
      cout << "=================================================" << endl;
      cout << "=================================================" << endl;
      cout << "=================================================" << endl;
      for( unsigned long k=0 ; k<sets.size() ; k++ ) {
        cout << endl << "set "<<k<<":"<<endl;
        for( unsigned long l=0 ; l<sets.at(k).size() ; l++ ) {
          cout << sets.at(k).at(l) << " " ;
        }
      }
      cout << endl << "==================== sortedNames"<<endl;
      for( unsigned long k=0 ; k<sortedNames.size() ; k++ ) {
        cout << k << ". '"<< sortedNames.at(k) << "'" <<endl;
      }
    } // }}}3
    
  } // }}}2

} // }}}1

/* writeCompressedHeaderInternal( string filename, string title ) {{{1
 *
 *    write the compressed header to the provided filename
 *    using the specified title
 *    
 *    starts from ( sortedNames, sets )
 */ 

void 
Header::writeCompressedHeaderInternal( string filename, string title ) {
  ofstream myfile;
  myfile.open( filename.c_str() );
  myfile << title << endl;
  myfile << "[" << endl;
    for( unsigned int k=0 ; k<sets.size() ; k++ ) {
      myfile << "#" << (k+1) << " ";
      for( unsigned int l=0 ; l<sets.at(k).size() ; l++ ) {
        if( l!=0 ) {
          myfile << ", ";
        }
        myfile << sets.at(k).at(l) ;
      }
      myfile << endl;
    }
    for( unsigned int k=0 ; k<sortedNames.size() ; k++ ) {
      myfile << k << " " << sortedNames.at(k) << endl;
    }
  myfile << "]" << endl;
  myfile.close();
  
} // }}}1

/* writeFlatHeaderInternal( string filename, string title ) {{{1
 *
 *    write the flat header to the provided filename
 *    Using the specified title
 *
 */ 
void 
Header::writeFlatHeaderInternal( string filename, string title ) {

  ofstream myfile;
  myfile.open( filename.c_str() );
	myfile << title << endl;
  myfile << "[" << endl;

  unsigned long numberOfSimulatorIndices = names.size();
  for( unsigned long i=0 ; i<numberOfSimulatorIndices ; i++ ) { //i=simulatorIndex
    if( !isSimulatorSignalDuplicate( i ) ) {
      myfile << getOutputIndexForSimulatorIndex(i) 
             << " " << names.at(i) 
             << " " << units.at(i) << endl;
    } else {
        // nothing to doe
    }
  }
  myfile << "]" << endl;
  myfile.close();

} // }}}1

/* writeToHeaderDebug( string filename, unsigned int index, string title ) {{{1
 *    Write the current state of this CompressedHeader object to the given 
 *    filename$<index>$.
 *
 *  only called from inside compressNames()
 */ 
void 
Header::writeToHeaderDebug( string filename, unsigned int index, string title ) {
  char indexString[100];
  sprintf( indexString, "%d", index );   // shift in the output notation 
  string fullname = filename.append( indexString );
  writeCompressedHeaderInternal( fullname, title );
}// }}}1

/*  sortNames() {{{1
 *
 *  sort "name + unit" and fill out sortedSimulatorIndexOrder
 *  duplicates are skipped
 *  store the order of sorted signalnames in sortedSimulatorIndexOrder.
 *    It is transferred to simulatorIndexOrder when the header is written with
 *    writeCompressedHeader();
 *    
 */
void
Header::sortNames( ) {
  
  vector<TextIndex*> namesWithIndex;
  
  cout << "construct non-duplicate names+units+simulatorIndex list" <<endl; 
  clock_t start=tic();
  unsigned long numberOfSimulatorIndices = names.size();
  for( unsigned long i=0 ; i<numberOfSimulatorIndices ; i++ ) { //i=simulatorIndex
    if( !isSimulatorSignalDuplicate( i ) ) {
      string extendedName = names.at( i );
      extendedName.append( " " );
      extendedName.append( units.at( i ) );

      TextIndex* textIndex = new TextIndex( extendedName, i ); // name, simulatorIndex
      namesWithIndex.push_back( textIndex );
    } else {
      // skip the duplicates
    }
  }
  tocP( start );

  cout << "sorting data with index" << endl;
  start = tic();
  std::sort( namesWithIndex.begin(), namesWithIndex.end(), myCompare );
  tocP( start );

  cout << "extracting the order of waves and sorting names" << endl;
  start=tic();
  for( unsigned int i=0 ; i<namesWithIndex.size() ; i++ ) {
    sortedSimulatorIndexOrder.push_back( namesWithIndex.at(i)->index );
    sortedNames.push_back( namesWithIndex.at(i)->text );
  }
  tocP( start );

  if( debugHeader ) {
    cout << "outputting both to file" << endl;
    ofstream myfile;
    myfile.open ("sort1.txt");
    for( unsigned long i=0 ; i<names.size() ; i++ ) {
      myfile << names[i] << endl;
    }
    myfile.close();
    myfile.open ("sort2.txt");
    for( unsigned long i=0 ; i<namesWithIndex.size() ; i++ ) {
      myfile << namesWithIndex.at(i)->index << " " << namesWithIndex.at(i)->text << endl;
    }
    myfile.close();
  }

//  CompressedNames* compressedNames= new CompressedNames( sortedNames );
//  compressedNames->compressNames( );
//  compressedNames->writeToHeader( headerFileName, title ); 

  if(debugHeader) {cout << "clear up namesWithIndex data" << endl ; }
  for( unsigned int i=0 ; i<namesWithIndex.size() ; i++ ) {
    delete namesWithIndex[i]; 
    // TODO: might be that the strings have become property of sortedNames 
  } 
  namesWithIndex.clear();
  if(debugHeader) {cout << "namesWithIndex data cleared" << endl ; }
  //sortedNames.clear();

} // }}}1



