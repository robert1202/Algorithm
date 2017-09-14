//
//  ViewController.swift
//  Algorithm
//
//  Created by fly on 2017/4/6.
//  Copyright © 2017年 Fly. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var result = "";
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        let n = 5
        //print("\(n) 's fact = \(fact(n))" );
        
//        let list = ["1","2","3"]
        
        var array = [1,4,6,8,2,7,5,3,0,22,88,9,13,76,55,44]
        print(array)
        
        bubbleSort(&array)
        var array1 = [1,4,6,8,2,7,5,3,0,22,88,9,13,76,55,44]
        insertSort(&array1)
        var array2 = [1,4,6,8,2,7,5,3,0,22,88,9,13,76,55,44]
        quickSortArray(&array2, left: 0, right: array.count - 1)
        
        print("quickSortArray")
        print(array)
        
        var array3 = [1,4,6,8,2,7,5,3,0,22,88,9,13,76,55,44]
        shellSort(&array3)
        
        var array4 = [1,4,6,8,2,7,5,3,0,22,88,9,13,76,55,44]
        selectSort(&array4)

//        permutation(list, begin: 0, end: list.count)
        
        
    }
    //阶乘
    func fact(_ n : Int) -> Int {
        if (n == 0){
            return 1
        }else{
            return n * fact(n - 1)
        }
    }
    //尾递归阶乘
    func sum(_ n: Int, acc : Int) -> Int {
        if n == 0 {
            return acc
        }else{
            return sum(n - 1, acc: acc + n)
        }
    }
    //全排列
    /**
     从 n 个不同元素中任取 m（m≤n）个元素，按照一定的顺序排列起来，叫做从 n 个不同元素中取出 m 个元素的一个排列。当 m=n 时所有的排列情况叫全排列。
     (1)n 个元素的全排列 =（n-1 个元素的全排列）+（另一个元素作为前缀）；
     (2) 出口：如果只有一个元素的全排列，则说明已经排完，则输出数组；
     (3) 不断将每个元素放作第一个元素，然后将这个元素作为前缀，并将其余元素继续全排列，等到出口，出口出去后还需要还原数组；
     
     - parameter list:
     - parameter begin:
     - parameter end:
     */
    
    func swap(_ list: Array<String>, a: Int, b: Int) -> Array<String> {
        var tmpList = list
        
        let temp = tmpList[a]
        tmpList[a] = tmpList[b]
        tmpList[b] = temp;
        return tmpList
    }
    
    func permutation(_ list: Array<String>, begin: Int, end: Int) {
        if begin >= 0 && begin <= end {
            if begin == end {
                print("result: \(result)")
            }else{
                for i in begin ... end {
                    var nList = swap(list, a: begin, b: i)
                    permutation(nList, begin: begin + 1, end: end)
                    nList = swap(nList, a: begin, b: i)
                }
            }
        }
    }


}

