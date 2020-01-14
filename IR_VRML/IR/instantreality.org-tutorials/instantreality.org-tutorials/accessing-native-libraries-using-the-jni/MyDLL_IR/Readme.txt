*****************************************************************************
* VERY SIMPLE DLL for InstantReality Framework (Avalon): Sabine Webel - FhG *
*****************************************************************************

This example shows a very simple DLL that can be accessed inside an X3D
script node.

The DLL uses the standard JNI (Java Native Interface, 
http://java.sun.com/j2se/1.4.2/docs/guide/jni/) to export the function in
the DLL to make them accessible inside a Java class. You can find the 
JNI wrapper functions at the end of "MyDLL.cpp". Some important hints, if you 
want to build your own DLL:
- include the "jni.h", to enable JNI support
- create the JNI wrapper functions: convert input arguments and return values
  (Java Native data types <-> c/c++ data types)
- the names of the JNI warpper functions must be composed to:
		Java_<name_of_your_java_class>_<name_of_the_function>([aruments])
- include the Java header file of the Java class inside your X3D script node
  (Java header file's can be created using "javah.exe" that comes with the JDK, 
  more info in the "Readme_InstantJNI.txt")
- that's all :-)

The functions of the DLL are the same that Franco uses in his DLL. There is
one additional function, that is used inside the X3D scene to change the 
color of a sphere.
