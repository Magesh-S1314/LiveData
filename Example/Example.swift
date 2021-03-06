//
//  ViewController.swift
//
//  Created by magesh on 03/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    let data = LiveData<Bool, Error>(value: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    func setupViewModel(){
        data.observeValue = { [weak self] value in
            guard let self = self else { return }
            print(value)
        }
        data.observeError = { [weak self] error in
            guard let self = self else { return }
            print(error.localizedDescription)
        }
    }
    
    
    @IBAction func testLiveData(_ sender: Any) {
        data.value = true
    }
    
    @IBAction func testErrorLiveData(_ sender: Any) {
        data.error = NetworkError.invalidURL
    }
    
}
