//
//  ViewController.swift
//  闭包
//
//  Created by zl on 16/5/5.
//  Copyright © 2016年 Godzl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        loadData { 
            print("回调耗时操作1")
        }
        loadData2("zl") {
            print("loadData2")
        }
        loadData3 { 
            print("end")
        }
        
    }
    func loadData(finished:() -> ()) {
        print("1耗时操作")
        finished()
    }
    func loadData2(name: String,finished:() -> ()) {
        print("name = \(name)")
        finished()
    }
    func loadData3(finished:() -> ()) {
        dispatch_async(dispatch_get_global_queue(0, 0)) { 
            print([NSThread .currentThread()])
            print("开线程")
            dispatch_async(dispatch_get_main_queue(), { 
                print([NSThread .currentThread()])
                print("回到主线程")
            })
        }
        finished()
    }

}

