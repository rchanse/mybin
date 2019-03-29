#!/usr/bin/env python

# I beleive this is an attempt to execute python pgms and put the
# output at the end of the origina module.  try this:
# 1. make a directory
# 2. put a simple python pgm is that dir as hellow.py  say
#   #!/usr/bin/env python
#   print "Hello, World."
# 3. now put this pgm  SanityCheck.py in the directory
# 4. Now execute  python SanityCheck.py
# 5. go look and the 'new'  hello.py


# original gotten from ThinkInPython   SanityCheck.py 
# I made minor changes for my taste
#: SanityCheck.py

import string, glob, os
# Do not include the following in the automatic
# tests:
exclude = ("SanityCheck.py", "BoxObserver.py",)

def visitor(arg, dirname, names):
  dir = os.getcwd()
  os.chdir(dirname)
  try:
    pyprogs = [p for p in glob.glob('*.py')      # nice use of glob.glob
               if p not in exclude ]
    if not pyprogs: return
    print '[' + os.getcwd() + ']'

    for program in pyprogs:
      print '\t', program            # note the tab 

      os.system("python %s > tmp" % program)   # execute the py pgm
                                               # output sent to tmp
      file = open(program).read()           # collect pgm source
      output = open('tmp').read()           # collect pgm output

      # Append output if it's not already there:
      #  look for string  output = '''  if not found add the output
      if file.find("output = '''") == -1 and \
        len(output) > 0:
        divider = '#<hr> ' + program +' ' + '#' * 50 + '\n'
  #     divider = divider.replace('#' , '#<hr>')
        file += divider
        file += "output = '''\n" + \
          open('tmp').read() + "'''\n"
        open(program,'w').write(file)   # here overwrite pgm source
                                        # with source plus output
  finally:
    os.chdir(dir)

if __name__ == "__main__":
  os.path.walk('.', visitor, None)
#:~
