This folder contains an example OSTRICH model calibration setup:
- The OSTRICH toolbox is for model calibration/optimization.  See https://www.eng.buffalo.edu/~lsmatott/Ostrich/OstrichMain.html
- The hydrologic framework RAVEN is used as our hydrologic model (with GR4J model structure template).
- The setup is for calibration of a simple hydrologic model with 6 parameters. 
- The objective function is to maximize the KLING-GUPTA efficiency. 
- The calibration/optimization algorithm will be the Dynamically Dimensioned Search (DDS) algorithm (an option in OSTRICH).

How to run this example Ostrich setup on new system
---------------------------------------------------

(0) MacOS users: in addition to the instructions below, you need to download and then look at the 'Mac addendum to Demo_C1.zip'.

(1) The OSTRICH executable

    There are several executables available with this example. 

    If you found an Ostrich executable that matches your operating system, make a copy  
    in this example folder.  Rename the copied file 'Ostrich.exe'  DO NOT TRY TO RUN IT YET.

    NEXT, you need to define an appropriate Ostrich input file for your operating system.  
    The main input file for Ostrich is called 'OstIn.txt'.  This does not exist yet in this folder.
    Ostrich inputs contained in the input file are dependent on your operating system.  Operating
    System dependent instructions:
	IF you are on Windows, make a copy of 'ostIn_Windows.txt' and rename it 'ostIn.txt'
	IF you are on MacOS/Linux, make a copy of 'ostIn_unix.txt' and rename it 'ostIn.txt'

    DO NOT TRY TO RUN OSTRICH YET.

(2) The RAVEN executable

    There are several executables available with this example (see subfolder "model").
    However, it is best to find & use the Raven.exe version you are currently running on your system.
    Can also download new Raven.exe or new source code from:
         http://raven.uwaterloo.ca/Downloads.html
    When you found or created an executable suitable for you system, copy it to the 
    "model" subfolder & call it "Raven.exe". 

    MAKE SURE you can successfully execute the Raven.exe you placed in the 'model' subfolder just as you might run Raven one time 
    if you were not using Ostrich software.  e.g. in Windows this is would be:
	Raven.exe Irondequoit -o output/

    DO NOT proceed until this TEST1 is confirmed, that is Raven executes successfully.

    STRONG SUGGESTIONS in case you haven't figured these out yet (they really make things easier):
	a) If you use Windows, in Windows Explorer change the settings so that file extensions are shown (not just filename).
	b) In windows explorer, when you are in the model directory, left click on the directory bar to highlight and show the 
	   full directory path, then simply type 'cmd' and BOOM, a new command window in the right directory is created!

(3) Scripts/Batch files

    This example Ostrich setup contains two primary scripts:
    	 Ost-RAVEN.sh (Linux/MacOS) and Ost-RAVEN.bat (Windows)
	 save_best.sh (Linux/MacOS) and save_best.bat (Windows)
    Those scripts are specified as inputs in the OSTRICH program input file "ostIn.txt" (see first few lines).
    If you switch between Windows and a Unix system you have to change the file extensions
    in this OSTRICH input file. 

    MAKE SURE you can successfully execute the Ost-RAVEN .bat/.sh file in your setup (e.g., Raven runs
    successfully).  Success means Raven executed and produced new files in the subfolder called 'output'. 
    Just run it from the command line by navigating to this folder and then typing on 
    Windows system cmd prompt: 'Ost-RAVEN.bat' (or double clicking on the file).
    Note the DIAG_KLING_GUPTA value in the model/output/Irondequoit_Diagnostics.csv.
    DO NOT proceed until this TEST2 is confirmed.

    Then, TEST 3 in this paragraph is meant to confirm you know where the new model input file(s) written by Ostrich
    are placed and then properly located in the model directory. If you look at the Ostrich input file block 'FilePairs',
    you will see the location Ostrich is creating the new model input files.  In this example, Ostrich is creating one
    new file called 'Irondequoit.rvp' in the same directory as the one containing Ostrich.exe. We should double check 
    this interpretation is correct by changing this Raven input file 'Irondequoit.rvp' we have located. Try, for example, 
    increasing 'GR4J_X2' on line 22 of this 'Irondequoit.rvp' file by a factor of roughly 2, confirm you successfully
    execute the Ost-RAVEN .bat/.sh file, & there is a new value for DIAG_KLING_GUPTA.   
    DO NOT proceed until this TEST3 is confirmed.

    THEN MAKE SURE save_best .bat/.sh runs properly.  Do this by first ensuring there is no 'best' subfolder
    in this folder. Delete if it exists (it should not). Just run save_best batch file from the command line by typing
    on Windows for example: 'save_best.bat'.  Assuming TEST1, TEST2 and TEST3 were just completed (and you 
    did not delete any model outputs), you should have a new subfolder called 'best' with three files in it.
    DO NOT proceed until this TEST3 is confirmed.

4)  Now you are ready to see if your Ostrich executable will successfully run on your Operating System.
    Note that this will almost certainly fail if not the Windows executable and/or not a Windows operating 
    system. In contrast, this will usually work if you are using Windows. 
    
    Execute Ostrich on your system as follows:
       on Windows, type name of Ostrich executable file at command line: 'Ostrich'
       or (less preferred in this test)
       Double click on Ostrich executable in Windows explorer (Windows)
       or
       on Mac, type at command line: './Ostrich'

       If a successful run, you should see on the command line lot's of output from the program and no reported errors.
       Note when you double-click the executable in Windows Explorer, the command line window will appear and program will run
       and then it will disappear. 

   If Ostrich fails and terminates with an error, the most likely failure of Ostrich would be something like as follows:
	'MSVCR120.dll and MSVCP120.dll not found'
	In this case the fix is to install these dll files from Microsoft.  We have applied this fix for years now.
		Step 1: Click link https://www.microsoft.com/en-ca/download/details.aspx?id=40784
		Step 2: Click blue Download button.  A menu will pop up
		Step 3: Select vcredist_x64.exe and vcredist_x86.exe in the menu and download BOTH installers
		Step 4: Run both exe installers on desktop
		Step 5: Restart your computer.

    If Ostrich still fails (error) on Windows machine after the above missing dll fix, first carefully troubleshoot.  
    If you are certain the issue is the executable file itself, your only fix is to download the Ostrich source from either:
         http://www.eng.buffalo.edu/~lsmatott/Ostrich/OstrichMain.html
	OR
	 https://github.com/DOI-BOR/ostrich  (slightly newer)
    Compile, for example, serial Ostrich version by using GCC compiler.  NO further instructions here ... sorry.


   If Ostrich run fails (error) on Linux/MacOS machine, download the source from either:
         http://www.eng.buffalo.edu/~lsmatott/Ostrich/OstrichMain.html
	OR
	 https://github.com/DOI-BOR/ostrich  (slightly newer)
    Compile, for example, serial Ostrich version by using GCC compiler by:
         a) Open a command prompt & go to Ostrich source code file directory you downloaded/unzipped on your system
	 b) Enter this command:  'make GCC'     [ or maybe '$ make GCC']
         c) if gcc is not installed on your device, enter command: 'brew install gcc'   [or maybe '$ brew install gcc]
            (quick way to check if GCC installed is by entering command: 'gcc -v')
         d) After compilation is successful, you should have a file called 'OstrichGCC'

               # FOR SUPER ADVANCED USERS ONLY:
                 Compile, for example, MPI version using MPI C++ compiler by
    	             $ make MPI

	Copy 'OstrichGCC' to this folder and then rename the file to 'Ostrich.exe'.  Then try again to execute Ostrich.
        This should work ...

5)   Understand how you can reconstruct a new model (e.g., Raven) archive:  
	your 'model' subfolder files plus the raven input files saved to subfolder 'best' where the 
        files in best *replace* same files in 'model' folder. Obviously, the save_best .bat/.sh commands
	could be modified to copy entire set of model input files for each new best solution. 

6)   Recommend you inspect and understand the logic in the batch/script files you tested above (open them up).  
     Any application of Ostrich to another calibration/optimization problem requires these are
     adapted SUPER CAREFULLY to the new problem. In other words, you need to conduct equivalent testing
     in all new calibration problems you use Ostrich for (conduct TEST1 through TEST4).

7)   Eventually, read parts of the Ostrich manual to understand the various Ostrich I/O you explore. 

8)   Go ahead and delete files in this C1 demo that are not for your Operating System (assuming you won't use these).
     
    	