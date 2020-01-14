//***************************************************************************
//VERY SIMPLE DLL for InstantReality Framework: Sabine Webel - FhG
//***************************************************************************
//This simple project shows an JNI-Compatible DLL

#include <string.h>
#include <jni.h>
#include "../../ExampleJNI.h"

char _str[256];
float _color[3][3] = {{1.0,0.0,0.0},{0.0,1.0,0.0},{0.0,0.0,1.0}};
int _counter=0;

//multiply the argument by 2
int function1(int arg)
{
    return(2*arg);
}

//prepend three * to a given sourceString and return the result
char* function2(const char *sourceString)
{
    _str[0]='*';
    _str[1]='*';
    _str[2]='*';
    strcpy(&_str[3],sourceString);
    return(_str);
}

//change color values
float *switchColor()
{
    static float internal_parameters[3];
    _counter=_counter%3; 

    internal_parameters[0]=_color[_counter][0];
    internal_parameters[1]=_color[_counter][1];
    internal_parameters[2]=_color[_counter][2];

    _counter++;

    return((float*)internal_parameters);
}

//****************************
//JNI
//****************************
JNIEXPORT jint JNICALL Java_ExampleJNI_function1(JNIEnv *env, jobject obj, jint arg)
{
    jint j_retCode = function1(arg);
    return(j_retCode);
}

JNIEXPORT jstring JNICALL Java_ExampleJNI_function2(JNIEnv *env, jobject obj, jstring sourceString)
{
    const char *s = env->GetStringUTFChars(sourceString, 0); 
    const char *retCode = function2(s);
    jstring j_retCode;
    j_retCode = env->NewStringUTF(retCode);
    env->ReleaseStringUTFChars(sourceString, retCode);
    return(j_retCode);
}

JNIEXPORT jfloatArray JNICALL Java_ExampleJNI_switchColor(JNIEnv *env, jobject obj)
{
    float *retCode = switchColor();
    jfloatArray j_retCode = env->NewFloatArray(3);
    env->SetFloatArrayRegion(j_retCode, 0, 3, retCode);
    return(j_retCode);
}







