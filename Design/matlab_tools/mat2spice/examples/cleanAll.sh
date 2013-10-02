#!/bin/bash

echo cleaning basic
/bin/rm 1_basic/m2s_run.m
/bin/rm 1_basic/*.m~
/bin/rm -rf 1_basic/test

echo cleaning parameterPassing
/bin/rm 2_parameterPassing/m2s_run.m
/bin/rm 2_parameterPassing/*.m~
/bin/rm -rf 2_parameterPassing/test

echo cleaning includeAndInsert
/bin/rm 3_includeAndInsert/m2s_run.m
/bin/rm 3_includeAndInsert/*.m~
/bin/rm -rf 3_includeAndInsert/test

echo cleaning functions--inline 
/bin/rm 4_functions/inline/m2s_run.m
/bin/rm 4_functions/inline/*.m~
/bin/rm -rf 4_functions/inline/generatedFolder

echo cleaning functions--dedicatedFile
/bin/rm 4_functions/dedicatedFile/m2s_run.m
/bin/rm 4_functions/dedicatedFile/*.m~
/bin/rm -rf 4_functions/dedicatedFile/generatedFolder

