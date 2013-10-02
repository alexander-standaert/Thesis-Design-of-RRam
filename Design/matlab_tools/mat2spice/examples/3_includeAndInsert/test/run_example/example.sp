example file showing include and insert

5 is available

 sp is available: myKey


 test_top is available: 5


// example.m2s:  top file <<<<<<<<<<<<<<<<<<

// first top include: include/firstInclude.m2s
.include 'firstInclude.sp'

// global parameters that are altered inside include/insert files 
// are altered at top level as well
After firstInclude: sp.key = keyFromFirstInclude


// second top include: include/secondInclude.m2scs
simulator lang=spice
.include 'secondInclude.scs'
simulator lang=spectre



  test_include is not available in top


// first top insert: include/firstInsert.m2s
// <<<<<<<<<<<<<<<< firstInsert.m2s <<<<<<<<<<<<<<<<<<<<<<<


 sp is available: keyFromFirstInclude in firstInsert

 test_insert is available: 5

 test_top is not available in firstInsert


// change a globally visible parameter:
// this change is applied in the calling m2s file



// >>>>>>>>>>>>>>>> firstInsert.m2s >>>>>>>>>>>>>>>>>>>>>>>

// global parameters that are altered inside include/insert files 
// are altered at top level as well
After firstInsert: sp.key = keyFromFirstInsert

// second top insert: include/firstInsert.m2s
// <<<<<<<<<<<<<<<< secondInsert.m2scs <<<<<<<<<<<<<<<<<<<<<<<

// include another file from inside an inserted file
// WARNING: wrong path in generated include/.include statement !!
include "someFile.sp"

// insert another file from inside an inserted file:
// <<< deepInclude/someFile.sp >>>

// >>>>>>>>>>>>>>>> secondInsert.m2scs >>>>>>>>>>>>>>>>>>>>>>>

  test_insert is not available in top

// top sp insert
// you can use normal spectre/spice includes, but watch the paths ...
// Either use fully qualified names, or make sure you consider the
// output folder as the starting directory to define relative paths 

// an insert can solve some issues, but at this moment,
// mat2spice warns when files other then m2s and m2scs files are included.
// What is the desired behaviour?
// <<<<<<<<<<<<<<<< spiceInclude.sp <<<<<<<<<<<<<<<<<<<<<<<

// >>>>>>>>>>>>>>>> spiceInclude.sp >>>>>>>>>>>>>>>>>>>>>>>

// example.m2s:  top file >>>>>>>>>>>>>>>>>>>>>>>>


