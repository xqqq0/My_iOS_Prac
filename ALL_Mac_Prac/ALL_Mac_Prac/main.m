//
//  main.m
//  ALL_Mac_Prac
//
//  Created by qinxinghua on 2021/12/1.
//

#import <Foundation/Foundation.h>

// xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc -fobjc-arc -fobjc-runtime=ios-8.0.0 main.m -o main_static.cpp

// autoreleasepool: clang -rewrite-objc main.m
//int age;

extern void _objc_autoreleasePoolPrint(void);

void bubbleSort(void) {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray: @[@2,@9,@10,@3,@5]];
    for (int i = 0; i < array.count; i++) {
        for (int j = 0; j < array.count-1-i; j++) {
            if ([array[j] integerValue] > [array[j+1] integerValue]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    NSLog(@"------%@",array);
}

void insertSort(void) {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray: @[@9,@2,@10,@3,@5]];
        for (int i = 1; i < array.count; i++) {
            NSInteger value = [array[i] integerValue];
            int j = i - 1;
            for (; j >= 0; j--) {
                if ([array[j] integerValue] > value) {
                    break;
                } else {
                    array[j + 1] = array[j];
                }
            }
            array[j + 1] = [NSNumber numberWithInteger:value];
        }
        NSLog(@"------%@",array);
}

int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        @autoreleasepool {
//        }
//        _objc_autoreleasePoolPrint();
//        @autoreleasepool {
//            @autoreleasepool {
//            }
//            _objc_autoreleasePoolPrint();
//        }
//        _objc_autoreleasePoolPrint();
//    }
//    _objc_autoreleasePoolPrint();
//    bubbleSort();
    insertSort();
    return 0;
}

//void test1(void) {
//            static  NSObject *person1;
//            &person1 = &person;
//            static int age = 0;
//            __block int age = 5;
//            __block NSObject *person = [NSObject new];
//            void(^block)(void) = ^{
//                  NSLog(@"person is %@",person);
//             };
//            block();
//}
//
//void test(void) {
//    NSObject *objc = [NSObject new];
//    NSLog(@"%ld",CFGetRetainCount((__bridge CFTypeRef)(objc)));
//
//    void(^block1)(void) = ^{
//        NSLog(@"---%ld",CFGetRetainCount((__bridge CFTypeRef)(objc)));
//    };
//    block1();
//
//    void(^__weak block2)(void) = ^{
//        NSLog(@"---%ld",CFGetRetainCount((__bridge CFTypeRef)(objc)));
//    };
//    block2();
//
//    void(^block3)(void) = [block2 copy];
//    block3();
//
//    __block NSObject *obj = [NSObject new];
//    void(^block4)(void) = ^{
//        NSLog(@"---%ld",CFGetRetainCount((__bridge CFTypeRef)(obj)));
//    };
//    block4();
//}
