//
//  ViewController.swift
//  SubscriptionBoxLab
//
//  Created by David Guerrero on 9/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.backgroundColor = .systemBlue
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //scrollView.backgroundColor = .red
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x:10, y: view.frame.size.height-100, width: view.frame.size.width-20, height:70)
        scrollView.frame = CGRect(x:0, y:0, width: view.frame.size.width, height: view.frame.size.height-100)
        
        if scrollView.subviews.count == 2{
            configureScrollView()
        }
    }
    private func configureScrollView(){
        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        let colors: [UIColor] = [.systemRed, .systemBlue, .systemPink, .systemGreen, .systemRed]
        for x in 0..<5{
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y:0, width: view.frame.size.width, height: scrollView.frame.size.height))
            page.backgroundColor = colors[x]
            scrollView.addSubview(page)
            
        }
    }
    
    func addGradientToView(view: UIView)
    {
            //gradient layer
            let gradientLayer = CAGradientLayer()
            
            //define colors
            gradientLayer.colors = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor]
            
            //define locations of colors as NSNumbers in range from 0.0 to 1.0
            //if locations not provided the colors will spread evenly
            gradientLayer.locations = [0.0, 0.6, 0.8]
            
            //define frame
            gradientLayer.frame = view.bounds
            
            //insert the gradient layer to the view layer
            view.layer.insertSublayer(gradientLayer, at: 0)
    }


}

