//
//  Person.m
//  ALL_TEST
//
//  Created by qinxinghua on 2021/12/2.
//

#import "Person.h"

@implementation Person
- (void)testBlock {
    void(^block)(void) = ^{
        NSLog(@"age is %d",self.age);
    };
    block();
}

@end
