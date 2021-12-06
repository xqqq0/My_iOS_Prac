//
//  main.m
//  ALL_Mac_Prac
//
//  Created by qinxinghua on 2021/12/1.
//

#import <Foundation/Foundation.h>

// xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc -fobjc-arc -fobjc-runtime=ios-8.0.0 main.m -o main_static.cpp
//int age;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *age = [NSObject new];
        static NSObject *age2 = age;
//        static int age = 0;
        void(^block)(void) = ^{
              NSLog(@"age is %@",age);
//            NSLog(@"age is %d",age);
//            age = [NSObject new];
         };
        block();
    }
    return 0;
}
