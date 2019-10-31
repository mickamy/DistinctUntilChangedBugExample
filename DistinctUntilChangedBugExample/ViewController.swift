//
//  ViewController.swift
//  DistinctUntilChangedBugExample
//
//  Created by Mikami Tetsuro on 2019/10/31.
//  Copyright © 2019 mickamy. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        Observable<(Bool, Bool)>
            .of(
                (false, false),
                (true, false),
                (false, true)
            )
            .distinctUntilChanged { $0 == $1 }
            .subscribe(onNext: { print("onNext: \($0)") })
            .disposed(by: bag)

    } 
}

