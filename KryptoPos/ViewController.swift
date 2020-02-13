//
//  ViewController.swift
//  KryptoPos
//
//  Created by Riyanda Febri Priyangga on 06/02/20.
//  Copyright © 2020 Riyanda Febri Priyangga. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController:UIViewController {
    
    @IBOutlet weak var TextView: UITextView!
    var i = 1
    var y = 136
    var a = 0
    var field = ""
    let parameters:Parameters = [
                  "a": "metadata",
                  "p":[]
              ]
    
    let url = "https://us-central1-shopick-io-cvm.cloudfunctions.net/crud"
    var asasaa: Array<JSON> = []
    override func viewDidLoad() {
        super.viewDidLoad()
//        TextView.text = "ddffdfdfdfd"
//        self.requestAPI()
        self.managedTextField()

    }

//    func requestAPI ()  {
//
//        AF.request(url,
//          method: .post,
//          parameters: parameters,
//          encoding: JSONEncoding.default, headers: nil)
//        .responseData { response in
//           switch response.result {
//            case .success(let value):
//            let json = JSON(value)
//
//            debugPrint(json)
//                        print(self.a)
//            print("dffd1")
//
//
//            self.asasaa = json["payload"].arrayValue
//
//            self.a = self.asasaa.count
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//
    func managedTextField() {

            AF.request(url,
              method: .post,
              parameters: parameters,
              encoding: JSONEncoding.default, headers: nil)
            .responseData { response in
               switch response.result {
                case .success(let value):
                let json = JSON(value)
                var aa:Any = ""
                var inputType:Any = ""
            
                debugPrint(json["payload"][0]["field"])
                debugPrint(json)

                self.asasaa = json["payload"].arrayValue
                for i in 0..<self.asasaa.count {
                    aa =  json["payload"][i]["field"]
                    inputType = json["payload"][i]["input"]
                    print("\(inputType)")
                   
                    if "\(inputType)" == "text" {
                        let myfield:UITextField = UITextField(frame: CGRect(x: 23, y: self.y, width: 340, height: 30))
                         myfield.borderStyle = .roundedRect
                         myfield.placeholder = "\(aa)"
                         myfield.keyboardType = .default
                         self.view.addSubview(myfield)
                         self.y = self.y + 52
                    }
                    
                   if "\(inputType)" == "textarea" {
                       print("Detected")
                     let myTextArea:UITextView = UITextView(frame: CGRect(x: 23, y: self.y, width: 340, height: 90))
//                                             myfields.
                                             self.view.addSubview(myTextArea)
                                             self.y = self.y + 59
                    }
                    
                    if "\(inputType)" == "datepicker" {
                        print("datepicker")
                        let datePicker:UIDatePicker = UIDatePicker(frame: CGRect(x: 23, y: self.y, width: 340, height: 90))
                        self.view.addSubview(datePicker)
                        self.y = self.y + 59
                    }
                    
                    if "\(inputType)" == "combobox" {
                        print("combobox")
                    }
                    if "\(inputType)" == "checkbox" {
                        print("checbox")
                    }

                        }
                case .failure(let error):
                    print(error)
                }
            }
  
//    @IBAction func buttonTexst(_ sender: Any) {
//        print(self.asasaa)
//    }

}
}
