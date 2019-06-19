//
//  main.m
//  MergerSort
//
//  Created by beijiXinOg on 2019/6/19.
//  Copyright © 2019年 beijiXinOg. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
算法思想：
把长度为n的输入序列分成两个长度为n/2的子序列；
对这两个子序列分别采用归并排序；
将两个排序好的子序列合并成一个最终的排序序列。
O(n log n）的时间复杂度。代价是需要额外的内存空间。
 */

/**
 归并排序--将两段排序好的数组结合成一个排序数组

 @param leftArray leftArray
 @param rightArray rightArray
 @return NSArray
 */
NSArray *merger(NSArray *leftArray, NSArray *rightArray) {
    NSUInteger capacity = leftArray.count+rightArray.count;
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:capacity];
    for (NSInteger index=0, i = 0, j=0; index < capacity; index++) {
        if (i>=leftArray.count) {
            arrayM[index] = rightArray[j++];
        } else if (j >= rightArray.count) {
            arrayM[index] = leftArray[i++];
        } else if (leftArray[i] > rightArray[j]) {
            arrayM[index] = rightArray[j++];
        } else {
            arrayM[index] = leftArray[i++];
        }
    }
    return arrayM.copy;
}


/**
 归并排序

 @param array array
 @return 返回排序好的数组
 */
NSArray *mergerSort(NSArray *array){
    if (array.count<2) {
        return array;
    }
    NSUInteger count = array.count;
    NSUInteger mid =array.count/2;
    NSArray *leftArray = [array subarrayWithRange:NSMakeRange(0, mid)];
    NSArray *rightArray = [array subarrayWithRange:NSMakeRange(mid, count-mid)];
    return merger(mergerSort(leftArray), mergerSort(rightArray));
}

int main() {
    NSArray *array = @[@1,@2,@4,@5,@3,@7,@6,@9,@8];
    NSArray *array1 = mergerSort(array);
    NSLog(@"%@",array1);
    return 0;
}
