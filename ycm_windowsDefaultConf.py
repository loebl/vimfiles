import os
import ycm_core

flags = [
  '-Wall',
  '-Wextra',
  '-std=c++14', #to compile files as C++
  '-fexceptions',
  #includes:
  '-ID:/projekte/ext/include',
  '-ID:/projekte/ext/include/freetype2',
#  '-IC:/devel/mingw/lib/gcc/mingw32/5.3.0/include/c++/mingw32',
#  '-IC:/devel/mingw/lib/gcc/mingw32/5.3.0/include/c++',
#  '-IC:/devel/mingw/include',
  '-IC:/Program Files (x86)/Microsoft Visual Studio 14.0/VC/include',
  '-IC:/Program Files (x86)/Windows Kits/8.1/Include/shared',
  '-IC:/Program Files (x86)/Windows Kits/8.1/Include/um',
  '-IC:/Program Files (x86)/Windows Kits/8.1/Include/winrt',
]

def FlagsForFile( filename, **kwargs ):
  extension = os.path.splitext( filename)[ 1 ]
  if extension in [ '.cu' ]:
    flags.append('-xcuda')
  else:
    flags.append('-xc++')

  return {
    'flags': flags,
    'do_cache': True
  }
