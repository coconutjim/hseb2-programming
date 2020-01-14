*****************************************************************************
* VERY SIMPLE DLL for InstantReality Framework (Avalon): Sabine Webel - FhG *
*****************************************************************************

This example shows how to use a Java class inside a X3D script node.

IMPORTANT: - don't wonder about the directory Microsoft.VC80.CRT to the directory
		--> This is necessary, because I compiled the DLL using Visual 
		    Studio 8 with SP1, and the current release of InstantPlayer 
		    is compiled without SP1). So Microsoft.VC80.CRT must be in 
		    the same directory than the DLL you want to access

	   - JRE (Java Runtime Environment) or JDK should be installed on 
	     your computer. You need the right permissions in your Java 
	     security policy. If you already have a Java policy file
	     ( .java.policy, located in C:\Documents and settings\{currentUser} ),
	     add the following lines and replace DIRECTORY with the directory,
	     where InstantJNI.class is located):

	     grant codeBase "file:///DIRECTORY" {
  		permission java.security.AllPermission;
	     };

	     If you don't have a .java.policy, copy the file you find in 
	     the directory JavaPolicy in C:\Documents and settings\{currentUser} 
             and replace DIRECTORY with the directory,
	     where InstantJNI.class is located

You can execute the scene by loading InstantJNI.x3d or InstantJNI.wrl 
respectively in the InstantPlayer (if it's installed :-). You can download 
InstantPlayer from http://www.instantreality.org/downloads/.
If you open the console (Menu: Window->Console), you see the return values 
coming from the DLL. By clicking onto the blue sphere rendered in the 
renderview, the color of the sphere will change (color values come also 
from the DLL).

If you want to build your own Java class, here some hints:

- Write your class using the standard X3D Java language bindings 
  (http://www.web3d.org/x3d/specifications/ISO-IEC-19777-2-X3DLanguageBindings-Java/)

- You can find a tutorial for using X3D language bindings on
  http://www.instantreality.org/documentation/tutorial/scripting-java/

- import java.util.*

- add instantreality.jar (located in C:\Program Files\Instant Player\bin) to your build path

- declare the Java Native methods

- load the DLL

- code whatever you want :-)



- compile the Java code

- create a Java header file (using javah.exe that comes with the JDK)

- include this header file in your DLL (see Readme.txt in MyDLL_IR)

- copy the DLL to the directory, where your Java class is located

You can find an example and more information about accessing native 
DLLs using JNI here: 
http://java.sun.com/developer/onlineTraining/Programming/JDCBook/jniexamp.html
