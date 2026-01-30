---
title: "windows 10 python 3 install without errors"
date: 2018-02-05
categories: 
  - "osde"
tags: 
  - "install"
  - "python"
  - "windoz"
---

i am afraid the standard windows 10 python 3 install leads to dozens of errors such as

```
    running install_lib
    creating c:\program files\python36\Lib\site-packages\robot
    error: could not create 'c:\program files\python36\Lib\site-packages\robot': Access is denied
```

one answer is to perform a MANUAL install as ADMINISTRATOR and install it for ALL USERS

- download python
- run as admin
- click install for all users
- choose manual install
- check install path is C:\\Program Files (x86)\\Python36-32

then check your installation by running

control panel ¦ sys and security ¦ system ¦ advanced system settings ¦ sys props ¦ advanced ¦ env vars ¦ PATH

and check your system path looks like

- %SystemRoot%
- %SystemRoot%\\system32
- %SystemRoot%\\System32\\Wbem
- %SystemRoot%\\System32\\WindowsPowerShell\\v1.0\\
- %SystemDrive%\\ProgramData\\Oracle\\Java\\javapath
- %PROGRAMFILES(X86)%\\Python\\Python36-32\\
- %PROGRAMFILES(X86)%\\Python\\Python36-32\\Scripts\\

if not change it so it does and run a command prompt to verify

```
C:>PATH
PATH=C:\WINDOWS;C:\WINDOWS\system32;C:\WINDOWS\System32\Wbem;
C:\WINDOWS\System32\WindowsPowerShell\v1.0\;
C:\ProgramData\Oracle\Java\javapath;
C:\Program Files (x86)\Python36-32\;
C:\Program Files (x86)\Python36-32\Scripts\;
C:\Users\MYUSERNAME\AppData\Local\Microsoft\WindowsApps;
```

NOW you can use pip (aka pip3 on other os) to install python modules for all users by clicking command prompt and right click RUN AS ADMINISTRATOR

```
C:>\pip install robotframework
```

and you should find python modules get installed into globally available

```
C:\Program Files (x86)\Python\Python36-32\Lib\site-packages
```

however you will STILL get errors if you try to run the module normally

```
C:\Users\\MYUSERNAME>robot --version
c:\program files (x86)\python36-32\lib\runpy.py:125: 
RuntimeWarning: 'robot.run' found in sys.modules 
after import of package 'robot', 
but prior to execution of 'robot.run'; 
this may result in unpredictable behaviour
 warn(RuntimeWarning(msg))
Robot Framework 3.0.2 (Python 3.6.4 on win32)
```

 

but you can use the python run long syntax to fix this

```
C:\Users\MYUSERNAME>python -m robot --version
Robot Framework 3.0.2 (Python 3.6.4 on win32)
```

refs

https://www.askvg.com/list-of-environment-variables-in-windows-xp-vista-and-7/
