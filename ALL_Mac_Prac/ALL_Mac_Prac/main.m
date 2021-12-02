//
//  main.m
//  ALL_Mac_Prac
//
//  Created by qinxinghua on 2021/12/1.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        static NSObject *age = [NSObject new];
        void(^block)(void) = ^{
              NSLog(@"age is %@",age);
         };
        block();
    }
    return 0;
}
