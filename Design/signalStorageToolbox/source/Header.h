#ifndef Header_H
#define Header_H

#include <string>
#include <vector>

using namespace std;

class Header
{
public:

  Header();
  ~Header();
  
  unsigned long addSignal( unsigned long simulatorIndex, string name, string unit );

  void writeFlatHeader( string filename, string title );
  void writeCompressedHeader( string filename, string title );

  void updateOrderForFlatHeader();

  void clear();

  unsigned long getNumberOfOutputSignals( ); 
  string getSignalNameForSimulatorIndex( unsigned long simulatorIndex );
  string getSignalUnitForSimulatorIndex( unsigned long simulatorIndex );
  unsigned long getOutputIndexForSimulatorIndex( unsigned long simulatorIndex );
  int isSimulatorSignalDuplicate( unsigned long simulatorIndex );
  int getNumberOfOutputSignals( unsigned long simulatorIndex );

//  vector< unsigned long > getSimulationIndexOrder( );

  unsigned long getSimulatorIndexFromOrder( unsigned long orderIndex );



private:
  unsigned long nextOutputIndex; 
  vector<string> names; 
  // names as added with addSignal( simulatorIndex, name, unit )
  // index used is simulatorIndex
  vector<string> units; 
  // units as added with addSignal( simulatorIndex, name, unit )
  // index used is simulatorIndex
  vector< long > outputIndexForSimulatorIndex; 
  // simulatorIndex is the index as passed by the simulator to the UWI interface
  // this is mapped onto the outputIndex which is used for this.names and this.units
  // in case of duplicate names, the second occurrence of a signal will point to the 
  // outputIndex assigned for the first
  // index used is simulatorIndex
  vector< int > isDuplicate; 
  // 1 if there is an earlier entry of (name,unit), 0 otherwise
  // index used is simulatorIndex
  vector<string> sortedNames;
  // when this.compressNames() is called,
  //   When sortNames() is called, it is populated with "name unit" combinations 
  //     from names and units, 
  //     sorted alphabetically
  //   during the iterative execution of the compression,
  //    sortedNames is replaced with newSortedNames during each iteration.
  //    newSortedNames will use #i's to indicate set usage as defined in this.sets
  vector< unsigned long > sortedSimulatorIndexOrder;
  // this is the precursor for simulatorIndexOrder
  // it is filled out during the sorting operation of (names,units)->sortedNames
  // it is copied to simulatorIndexOrder during writeCompressedHeader
  vector< vector<string> > sets; 
  // the sets after compression.  Filled out gradually when this.compressNames() 
  //   is called.
  // sets+sortedNames is what will be outputted to the header file
  vector<string> newSortedNames;
  // list that is cleared before each iteration of compressNames(i), and then
  // gradually filled up with the new prefixes
  
  vector< unsigned long > simulatorIndexOrder;
  // the order in which the header has listed the signals
  // it maps a sortedOutputIndex on a simulatorIndex



  long getPreviousOutputIndex( string name, string unit );
  
  void addPrefixPostfixes( string prefix, vector<string> postfixes );
  unsigned int addSetAndGetIndex( vector<string> set );

  void writeFlatHeaderInternal( string filename, string title );
  void writeCompressedHeaderInternal( string filename, string title );
  void writeToHeaderDebug( string filename, unsigned int index, string title );

  void sortNames( );
  void compressNames( unsigned int dotIndex ); 
  void compressNames( ); 

  vector<unsigned int> findDots( string name );
  int countDots( string name );
  int countDots( vector<string> names );


};

#endif // Header_H


