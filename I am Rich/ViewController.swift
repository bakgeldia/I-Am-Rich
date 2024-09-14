//
//  ViewController.swift
//  I am Rich
//
//  Created by Bakgeldi Alkhabay on 13.09.2024.
//

import UIKit

class ViewController: UIViewController {

    let label = UILabel()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupView()
    }
    
    private func setupView() {
        
        view.backgroundColor = hexStringToUIColor(hex: "#0D7C66")
        
        //Label
        label.text = "I Am Rich"
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        //ImageView
        imageView.image = UIImage(named: "diamond")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            //Label
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 30),
            
            //ImageView
            imageView.heightAnchor.constraint(equalToConstant: 270),
            imageView.widthAnchor.constraint(equalToConstant: 270),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

