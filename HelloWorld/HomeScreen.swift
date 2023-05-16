//
//  HomeScreen.swift
//  HelloWorld
//
//  Created by Punkintosh on 2023-05-16.
//

import UIKit

class HomeScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 17/255, green: 17/255, blue: 17/255, alpha: 1.0)
        
        let helloLabel = UILabel()
        helloLabel.text = "Hello, World!"
        helloLabel.textAlignment = .center
        helloLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        helloLabel.font = UIFont.boldSystemFont(ofSize: 24)
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(helloLabel)
        
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let fromLabel = UILabel()
        fromLabel.text = "From punkintosh"
        fromLabel.textAlignment = .center
        fromLabel.textColor = .gray
        fromLabel.font = UIFont.systemFont(ofSize: 16)
        fromLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fromLabel)
        
        NSLayoutConstraint.activate([
            fromLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fromLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 10)
        ])
        
        let imageUrl = URL(string: "https://github.com/punkintosh.png")
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: helloLabel.topAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        if let imageUrl = imageUrl {
            URLSession.shared.dataTask(with: imageUrl) { data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }

}

