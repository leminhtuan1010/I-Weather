//
//  ViewController.swift
//  Weather
//
//  Created by Minh Tuan on 5/11/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var lbl_city: UILabel!
    
    @IBOutlet weak var lbl_tucngu: UILabel!
    
    @IBOutlet weak var lbl_nhietdo: UILabel!
    
    @IBOutlet weak var lbl_thaydoi: UILabel!

    @IBOutlet weak var anhnen: UIImageView!
    
    @IBAction func btn_chuyendoido(_ sender: Any) {
        thaydoiTD()
    }
    


    var nganngu = ["Nước chảy đá mòn", "Có công mài sắt có ngày nên kim", "Chuồn chuồn bay thấp thì mưa, bay cao thì nắng, bay vừa thì râm"]
    var thanhpho = ["Ha Noi", "Thai Binh", "Nam Dinh"]
    var nen = ["Blood", "Moon", "Sun"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func acc_refresh(_ sender: Any) {
        let cityIndex = Int(arc4random_uniform(UInt32(thanhpho.count)))
        lbl_city.text = thanhpho[cityIndex]
        let ngannguIndex = Int(arc4random_uniform(UInt32(nganngu.count)))
        lbl_tucngu.text = nganngu[ngannguIndex]
        let nenIndex = Int(arc4random_uniform(UInt32(nen.count)))
        anhnen.image = UIImage.init(named: nen[nenIndex])
        innhietdo()
    }
    
    func innhietdo() -> Void {
        let randomso = String(format: "%2.1f", randomnhietdo())
        lbl_nhietdo.text = randomso
    }
    
    
    func randomnhietdo() -> Double {
        if (lbl_thaydoi.text == "C"){
        return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
        }else{
        return (Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)) * 9/5 + 32
        }
    }
    func thaydoiTD() {
        var doC: Double = 0
        var doF: Double = 0
        if (lbl_thaydoi.text == "C"){
            doF = Double(lbl_nhietdo.text!)! * 9/5 + 32
            lbl_nhietdo.text = String(format: "%2.1f", doF)
            lbl_thaydoi.text = "F"
        }else{
            doC = Double(lbl_nhietdo.text!)! * 5/9
            lbl_nhietdo.text = String(format: "%2.1f", doC)
            lbl_thaydoi.text = "C"
        }
    }
}

