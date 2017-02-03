import os
import ycm_core

flags = [
  '-Wall',
  '-Wextra',
  '-std=c++14', #to compile files as C++
  '-fexceptions',
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
