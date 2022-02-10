//
//  aljava.c
//  ALL_Mac_Prac
//
//  Created by qinxinghua on 2022/2/10.
//

#include <stdio.h>

// 计数排序，a是数组，n是数组大小。假设数组中存储的都是非负整数。
public void countingSort(int[] a, int n) {
    if (n <= 1) return;
    
    // 查找数组中数据的范围
    int max = a[0];
    for (int i = 1; i < n; ++i) {
        if (max < a[i]) {
            max = a[i];
        }
    }
    
    int[] c = new int[max + 1]; // 申请一个计数数组c，下标大小[0,max]
    for (int i = 0; i <= max; ++i) {
        c[i] = 0;
    }
    
    // 计算每个元素的个数，放入c中
    for (int i = 0; i < n; ++i) {
        c[a[i]]++;
    }
    
    // 依次累加
    for (int i = 1; i <= max; ++i) {
        c[i] = c[i-1] + c[i];
    }
    
    // 临时数组r，存储排序之后的结果
    int[] r = new int[n];
    // 计算排序的关键步骤，有点难理解
    for (int i = n - 1; i >= 0; --i) {
        // 从原始数组中倒序取值
        int value = a[i];
        // 取出`value`对应在C中的位置，换算成索引要 -1
        int index = c[value] - 1;
        // 原数组值在临时数组r中索引即为index，赋值
        r[index] = a[i];
        // C数组中的对应的a[i]的索引的值要做 - 1
        c[a[i]]--;
    }
    
    // 将结果拷贝给a数组
    for (int i = 0; i < n; ++i) {
        a[i] = r[i];
    }
}
