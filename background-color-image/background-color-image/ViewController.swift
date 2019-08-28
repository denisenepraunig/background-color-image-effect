//
//  ViewController.swift
//  background-color-image
//
//  Created by Nepraunig, Denise on 28.08.19.
//  Copyright © 2019 Denise Nepraunig. All rights reserved.
//
//  ALL IMAGES BELONG TO LIAM WONG: https://twitter.com/liamwong

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!

    var count = 1
    let numberOfImages = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSwipeGestures()
        adjustBackgroundColor()
    }

    func setupSwipeGestures() {
        imageView.isUserInteractionEnabled = true

        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeImage))
        swipeLeftGesture.direction = .left
        imageView.addGestureRecognizer(swipeLeftGesture)

        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeImage))
        swipeRightGesture.direction = .right
        imageView.addGestureRecognizer(swipeRightGesture)
    }

    @objc
    func swipeImage(_ recognizer : UISwipeGestureRecognizer) {

        guard recognizer.direction == .right || recognizer.direction == .left else {
            return
        }

        // if the last image was reached, then the first image will be
        // displayed again and vice versa
        if recognizer.direction == .right {
            count -= 1
            count = count < 1 ? numberOfImages : count
        } else if recognizer.direction == .left {
            count += 1
            count = count > numberOfImages ? 1 : count
        }

        animateImageAndColor()
    }

    func animateImageAndColor() {
        let imageName = "image\(count)"
        guard let image = UIImage(named: imageName) else {
            return
        }

        let newColor = calculateBackgroundColor(for: image)

        UIView.transition(with: imageView,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: { self.imageView.image = image },
                          completion: nil)

        UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
            self.view.backgroundColor = newColor
        }, completion:nil)
    }

    func calculateBackgroundColor(for image: UIImage?) -> UIColor? {
        let color = image?.averageColor
        return color?.darker(by: 15)
    }
    func adjustBackgroundColor() {
        let image = imageView.image
        view.backgroundColor = calculateBackgroundColor(for: image)
    }
}
