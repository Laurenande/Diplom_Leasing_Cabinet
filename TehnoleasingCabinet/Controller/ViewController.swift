//
//  ViewController.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 03.09.2023.
//

import UIKit

class ViewController: UIViewController {
    private let checkBox1 = CheckBoxButton(frame: CGRect(x: 70, y: 200, width: 40, height: 40))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(checkBox1)
        view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonActionSendSMS() {
        checkBox1.isSelected = !checkBox1.isSelected
        if checkBox1.isSelected{
            checkBox1.backgroundColor = .red
            print("lox")
        }else{
            checkBox1.backgroundColor = .blue
            print("nelox")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
