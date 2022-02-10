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
    // 循环从第2个元素开始，默认第一个为已排序元素
    for (int i = 1; i < array.count; i++) {
        NSInteger value = [array[i] integerValue];
        // 内循环标识未排序的一个元素在已排序元素中进行比较，所以它的起始索引是比i小1
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


#pragma mark - ***** 归并 *****
void merge_sort_recursive(int arr[], int reg[], int start, int end) {
    if (start >= end)
        return;
    // 取数组的前后分界点
    int len = end - start, mid = (len >> 1) + start;
    // 数组切分之后，在递归调用
    int start1 = start, end1 = mid;
    int start2 = mid + 1, end2 = end;
    merge_sort_recursive(arr, reg, start1, end1);
    merge_sort_recursive(arr, reg, start2, end2);
    int k = start;
    while (start1 <= end1 && start2 <= end2)
        reg[k++] = arr[start1] < arr[start2] ? arr[start1++] : arr[start2++];
    while (start1 <= end1)
        reg[k++] = arr[start1++];
    while (start2 <= end2)
        reg[k++] = arr[start2++];
    for (k = start; k <= end; k++)
        arr[k] = reg[k];
}

void merge_sort(int arr[], const int len) {
    int reg[len];
    merge_sort_recursive(arr, reg, 0, len - 1);
    
}

#pragma mark - ***** main *****
int main(int argc, const char * argv[]) {
    //    bubbleSort();
//    insertSort();
    int arr[5] = {2,9,10,3,5};
    merge_sort(arr, 5);
    // 以下为验证代码
    int count = sizeof(arr) / sizeof(arr[0]);
    for (int i = 0; i < count; i++) {
        NSLog(@"i++--%d",i);
    }
    
    for (int i = 0; i < count; ++i) {
        NSLog(@"++i--%d",i);
    }
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    
    
    
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

