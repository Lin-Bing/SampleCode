//
//  main.cpp
//  JavaScriptCoreDemo
//
//  Created by linbing on 2019/10/30.
//  Copyright © 2019 fuyou. All rights reserved.
//

#include <iostream>
#include <JavaScriptCore/JavaScript.h>
#include <JavaScriptCore/JSStringRefCF.h>
#include <CoreFoundation/CoreFoundation.h>
#include <thread>

using namespace std;

/******************** Native call JS *******************/
void native_call_js() {
    
    /*
     JS脚本
     
     // 全局函数
     var factorial = function (n) {
     if (n < 0) return;
     if (n == 0) return 1;
     return n * factorial(n-1);
     };
     
     // 构造函数
     var Person = function () {
        this.age = 18;
        this.sayHello = function(name) {
            return "hello " + name;
        }
     };
     
     // 全局变量
     var myName = "fuyou";
     var p = new Person();
     */
    
    const char *script = "var factorial = function (n) {\
                            if (n < 0) return;\
                            if (n == 0) return 1;\
                            return n * factorial(n-1);\
                          };\
                          var Person = function () {\
                            this.age = 18;\
                            this.sayHello = function(name) {\
                                return \"hello \" + name;\
                            }\
                          };\
                          var myName = \"fuyou\";\
                          var p = new Person();";
    

    JSStringRef scriptStrRef = JSStringCreateWithUTF8CString(script);
    
    // 创建JS Context用于执行JS脚本
    JSContextGroupRef group = JSContextGroupCreate();
    JSGlobalContextRef ctx = JSGlobalContextCreateInGroup(group, NULL);
    JSObjectRef globalObj = JSContextGetGlobalObject(ctx);
    
    JSEvaluateScript(ctx, scriptStrRef, NULL, NULL, 1, NULL);
    JSStringRelease(scriptStrRef);
    
    /*
     1. 获取全局变量 myName
     */
    JSStringRef myName = JSStringCreateWithUTF8CString("myName");
    JSValueRef myNameValue = JSObjectGetProperty(ctx, globalObj, myName, NULL);
    JSStringRef myNameStr = JSValueToStringCopy(ctx, myNameValue, NULL);
    CFStringRef myNameCfStr = JSStringCopyCFString(kCFAllocatorSystemDefault, myNameStr);
    // CFStringRef转string
    const CFIndex kCStringSize = 30;
    char temporaryCString[kCStringSize];
    bzero(temporaryCString,kCStringSize);
    CFStringGetCString(myNameCfStr, temporaryCString, kCStringSize, kCFStringEncodingUTF8);
    string name(temporaryCString);
    cout << "myName = " << name << endl << endl;
    JSStringRelease(myName);
    
    
    /*
     2. 获取全局函数factorial，并执行
     */
    // 获取函数
    JSStringRef factorialStr = JSStringCreateWithUTF8CString("factorial");
    JSValueRef factorialValue = JSObjectGetProperty(ctx, globalObj, factorialStr, NULL);
    JSObjectRef factorialObj = JSValueToObject(ctx, factorialValue, NULL);
    // 构造参数
    JSValueRef argument = JSValueMakeNumber(ctx, 3);
    JSValueRef arguments[1];
    arguments[0] = argument;
    // 执行函数，返回结果
    JSValueRef factorialResultValue = JSObjectCallAsFunction(ctx, factorialObj, NULL, 1, arguments, NULL);
    double factorialResult = JSValueToNumber(ctx, factorialResultValue, NULL);
    cout << "factorialResult = " << factorialResult << endl << endl;

    
    /*
     3. 获取全局对象，并调用对象函数
     */
    // 获取全局对象
    JSStringRef pStr = JSStringCreateWithUTF8CString("p");
    JSValueRef pStrVal = JSObjectGetProperty(ctx, globalObj, pStr,NULL);
    JSStringRelease(pStr);
    JSObjectRef pObj = JSValueToObject(ctx, pStrVal, NULL);
    // 获取对象的sayHello函数（属性）
    JSStringRef pFuncStr = JSStringCreateWithUTF8CString("sayHello");
    JSValueRef pFuncVal =  JSObjectGetProperty(ctx, pObj, pFuncStr, NULL);
    JSStringRelease(pFuncStr);
    JSObjectRef pFuncObj = JSValueToObject(ctx, pFuncVal, NULL);
    // 构造函数参数
    JSStringRef argStr = JSStringCreateWithUTF8CString("wuyanzu");
    JSValueRef arg = JSValueMakeString(ctx, argStr);
    JSStringRelease(argStr);
    JSValueRef args[1];
    args[0] = arg;
    // 调用函数
    JSValueRef pResVal = JSObjectCallAsFunction(ctx, pFuncObj, NULL, 1, args, NULL);
    // 函数返回值类型转化
    JSStringRef pResStr = JSValueToStringCopy(ctx, pResVal, NULL);
    CFStringRef pRes = JSStringCopyCFString(kCFAllocatorSystemDefault, pResStr);
    // CFStringRef转string
    bzero(temporaryCString, kCStringSize);
    CFStringGetCString(pRes, temporaryCString, kCStringSize, kCFStringEncodingUTF8);
    string result(temporaryCString);
    cout << "sayHello() = " << result << endl << endl;
    JSStringRelease(myName);
    
    JSContextGroupRelease(group);
    JSGlobalContextRelease(ctx);
}



/******************** JS call Native *******************/
// 原生C++类
class Worker {
private:
    int salary = 9999;
public:
    int money = 0;
    void work() {
        money += salary;
    }
};

/*
 JSObjectGetPropertyCallback：js获取属性时，会调用该函数
 参数  ctx：会话； object：对象； propertyName：属性名
 返回值 返回对象属性值
 */
JSValueRef getProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef* exception)
{
    Worker *w = static_cast<Worker*>(JSObjectGetPrivate(object));
    return JSValueMakeNumber(ctx, w->money);
}

/*
 JSObjectCallAsFunctionCallback：js调用函数是，会调用该函数
 参数 ctx：会话；function：被调用的函数(函数即对象) thisObject：this对象； argumentCount：参数个数； arguments：参数值
 执行js语句myObject.myFunction()是, function为myFunction对象, thisObject为调用者myObject.
 返回值 返回函数调用结果
 */
JSValueRef callAsFunction(JSContextRef ctx, JSObjectRef function, JSObjectRef thisObject, size_t argumentCount, const JSValueRef arguments[],JSValueRef *exception)
{
    thread::id tid = this_thread::get_id();
    cout << "JS函数回调线程：" << tid << endl;
    
    Worker *w = static_cast<Worker*>(JSObjectGetPrivate(thisObject));
    w->work();
    return JSValueMakeUndefined(ctx);
}


void js_call_native() {
    
    thread::id tid = this_thread::get_id();
    cout << "JS执行线程：" << tid << endl;
    
    JSGlobalContextRef ctx = JSGlobalContextCreate(NULL);
    JSObjectRef globalObj = JSContextGetGlobalObject(ctx);
    
    // 定义类属性
    /*
     typedef struct {
         const char* name;  属性名
         JSObjectGetPropertyCallback getProperty; 取值回调 获取属性值时调用该函数，通过该函数返回属性值
         JSObjectSetPropertyCallback setProperty; 设值回调 设置属性值时调用该函数，通过该函数设置属性值
         JSPropertyAttributes attributes;
     } JSStaticValue;
     */
    JSStaticValue values[] = {
        {"money", &getProperty, 0, kJSPropertyAttributeNone },
        { 0, 0, 0, 0}
    };
    
    // 定义类函数
    /*
     typedef struct {
         const char* name; 函数名
         JSObjectCallAsFunctionCallback callAsFunction; 函数被调用时，调用该函数，通过该函数返回调用结果
         JSPropertyAttributes attributes;
     } JSStaticFunction;
     */
    JSStaticFunction functions[] = {
        {"work", &callAsFunction, kJSPropertyAttributeNone },
        { 0, 0, 0 }
    };
    // 定义类
    JSClassDefinition classDef = kJSClassDefinitionEmpty;
    classDef.version = 0;
    classDef.attributes = kJSClassAttributeNone;
    classDef.className = "Worker";
    classDef.parentClass = 0;
    classDef.staticValues = values;
    classDef.staticFunctions = functions;
    
    // 创建一个 JavaScript Worker类
    JSClassRef t = JSClassCreate(&classDef);
    // 新建一个JavaScript类对象，并使之绑定原生Worker对象w
    Worker w;
    JSObjectRef classObj = JSObjectMake(ctx,t, &w);
    
    // 将新建的对象注入JavaScript中
    JSStringRef objName = JSStringCreateWithUTF8CString("w");
    JSObjectSetProperty(ctx, globalObj, objName, classObj, kJSPropertyAttributeNone, NULL);
    // 执行js代码，“两次”调用w对象work()函数
    JSStringRef workScript = JSStringCreateWithUTF8CString("w.work()");
    JSEvaluateScript(ctx, workScript, classObj, NULL, 1, NULL);
    JSEvaluateScript(ctx, workScript, classObj, NULL, 1, NULL);
    JSStringRelease(workScript);
    // 执行js代码，获取w对象money属性
    JSStringRef getMoneyscript = JSStringCreateWithUTF8CString("var money = w.money;");
    JSEvaluateScript(ctx, getMoneyscript, classObj, NULL, 1, NULL);
    JSStringRelease(getMoneyscript);
    
    // 对比原生对象、js对象 属性值
    JSStringRef moneyRef = JSStringCreateWithUTF8CString("money");
    JSValueRef moneyValue = JSObjectGetProperty(ctx, globalObj, moneyRef, NULL);
    JSStringRelease(moneyRef);
    double money = JSValueToNumber(ctx, moneyValue, NULL);
    cout << endl << "JS环境中， w.money = " << money << endl;
    cout << "原生环境中，w.money = " << w.money << endl << endl;
    
    JSGlobalContextRelease(ctx);
}

int main(int argc, const char * argv[]) {
    
    
//    native_call_js();
    
    
    // 注意： JS函数回调的线程，与JS脚本执行的线程一致
    
//    thread::id tid = this_thread::get_id();
//    cout << "主线程：" << tid << endl;
    
    // 主线程
    js_call_native();
    
    // 异步线程
//    thread t{js_call_native};
//    t.join();
    
    return 0;
}
