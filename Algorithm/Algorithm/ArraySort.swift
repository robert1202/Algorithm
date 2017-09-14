//
//  BubbleSort.swift
//  Algorithm
//
//  Created by fly on 2017/9/13.
//  Copyright © 2017年 Fly. All rights reserved.
//

import Foundation

extension NSObject{
    /********
     比较相邻的元素。如果第一个比第二个大，就交换他们两个。
     对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。
     在这一点，最后的元素应该会是最大的数。针对所有的元素重复以上的步骤，除了最后一个。
     持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。
     **********/
    func bubbleSort<T: Comparable>(_ items:inout [T], order: Bool=false){
        print("\(#function)")

        let count = items.count
        for i in 0..<count {
            for j in i..<(count) {
                if items[i] > items[j] {
                    swap(&items[i], &items[j])
                }
            }
        }
        print(items)
    }
    
    /********
     1. 从第一个元素开始，该元素可以认为已经被排序
     2. 取出下一个元素，在已经排序的元素序列中从后向前扫描
     3. 如果该元素（已排序）大于新元素，将该元素移到下一位置
     4. 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置
     5. 将新元素插入到该位置中
     6. 重复步骤2
     
     **********/
    func insertSort<T: Comparable>(_ items:inout [T], order: Bool=false){
        print("\(#function)")
        let count = items.count
        
        for i in 1..<count {
            let key = items[i]
            var j = i - 1
            
            while j >= 0 && items[j] > key {
                items[j + 1] = items[j]
                j -= 1
            }
            items[j + 1] = key
        }
        print(items)
    }
    
    /********
     步骤如下：
     * 遍历数组，找到最小的元素，将其置于数组起始位置。
     * 从上次最小元素存放的后一个元素开始遍历至数组尾，将最小的元素置于开始处。
     * 重复上述过程，直到元素排序完毕。
     
     **********/
    func selectSort<T: Comparable>(_ items:inout [T], order: Bool=false){
        print("\(#function)")
        
        var i = 0
        while i < (items.count - 1) {
            var min = i
            
            for j in (min + 1)..<items.count {
                if items[min] > items[j]  {
                    min = j
                }
            }
            if i != min {
                swap(&items[i], &items[min])
            }
            i += 1
        }
        
        print(items)
    }


    /********
     1）设置两个变量 i、j，排序开始的时候：i=0，j=N-1；
     2）以第一个数组元素作为关键数据，赋值给 key，即 key=A[0]；
     3）从 j 开始向前搜索，即由后开始向前搜索 (j--)，找到第一个小于 key 的值 A[j]，将 A[j] 和 A[i] 互换；
     4）从 i 开始向后搜索，即由前开始向后搜索 (i++)，找到第一个大于 key 的 A[i]，将 A[i] 和 A[j] 互换；
     5）重复第 3、4 步，直到 i=j； (3,4 步中，没找到符合条件的值，即 3 中 A[j] 不小于 key,4 中 A[i] 不大于 key 的时候改变 j、i 的值，使得 j=j-1，i=i+1，直至找到为止。找到符合条件的值，进行交换的时候 i， j 指针位置不变。另外，i==j 这一过程一定正好是 i + 或 j - 完成的时候，此时令循环结束）。
     **********/
    func partition<T: Comparable>(_ items:inout [T],left:Int,right:Int) -> Int{
        
        var key_index = left
        let key = items[left]
        
        for i in (left ... right) {
            if items[i] < key {
                key_index += 1
                if key_index != i {
                    swap(&items[key_index], &items[i])
                }
            }
        }
        if left != key_index {
            //swap 如果一样 会crash
            swap(&items[left], &items[key_index])
        }
        return key_index
        
    }
    
    
    func quickSortArray<T: Comparable>(_ items:inout [T],left:Int,right:Int) -> Void{
        if left < right {
            let key_index = partition( &items, left: left, right: right)
            
            quickSortArray( &items, left: left, right: key_index - 1)
            quickSortArray( &items, left: key_index + 1, right: right)
        }
    }
    
    /********
     希尔排序，也称递减增量排序算法，是插入排序的一种高速而稳定的改进版本。
     因 Donald Shell 于 1959 年提出而得名。希尔排序是基于插入排序的以下两点性质而提出改进方法的：
     插入排序在对几乎已经排好序的数据操作时， 效率高， 即可以达到线性排序的效率；但插入排序一般来说是低效的， 因为插入排序每次只能将数据移动一位。
     该方法的基本思想是：先将整个待排元素序列分割成若干个子序列（由相隔某个 “增量” 的元素组成的）分别进行直接插入排序，然后依次缩减增量再进行排序，待整个序列中的元素基本有序（增量足够小）时，再对全体元素进行一次直接插入排序。
     因为直接插入排序在元素基本有序的情况下（接近最好情况），效率是很高的，因此希尔排序在时间效率上比前两种方法有较大提高。
     
     希尔排序总结来说就是把记录按步长 gap 分组，对每组记录采用直接插入排序方法进行排序。
     随着步长逐渐减小，所分成的组包含的记录越来越多，当步长的值减小到 1 时，整个数据合成为一组，构成一组有序记录，则完成排序。
     
     **********/
    func shellSort<T: Comparable>(_ items:inout [T], order: Bool=false){
        print("\(#function)")
        
        let count = items.count
        var gap = Int(items.count / 2)
        
        while gap >= 1 {
            for i in gap..<count {
                let tmp = items[i]
                
                var j = i
                
                while j >= gap && tmp < items[j-gap] {
                    swap(&items[j], &items[j-gap])
                    j -= gap
                }
                items[j] = tmp
                
            }
            gap = gap / 2
        }
        
        print(items)
    }
}
