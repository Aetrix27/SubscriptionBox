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
        pageControl.numberOfPages = 3
        pageControl.backgroundColor = .systemBlue
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_ :)),
                              for: .valueChanged)
        //scrollView.backgroundColor = .red
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        // Do any additional setup after loading the view.
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
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
        //gradient layer
        let colors = [[UIColor.orange.cgColor, UIColor.yellow.cgColor], [UIColor.green.cgColor, UIColor.red.cgColor], [UIColor.blue.cgColor, UIColor.lightGray.cgColor]]
        
        let text = ["a","b","c"]
        //define colors
        //gradientLayer.colors = [UIColor.orange.cgColor, UIColor.blue.cgColor]
        
        //define locations of colors as NSNumbers in range from 0.0 to 1.0
        //if locations not provided the colors will spread evenly
        
        //define frame
        
        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true

        for x in 0..<2{
            var gradientLayer = CAGradientLayer()
            gradientLayer.colors = colors[x]
            gradientLayer.locations = [0.0, 0.6, 0.8]

            var page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y:0, width: view.frame.size.width, height: scrollView.frame.size.height))
            //page.backgroundColor = colors[x]
          
            gradientLayer.frame = page.bounds
            page.layer.insertSublayer(gradientLayer, at: 0)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            label.center = CGPoint(x: 160, y: 285)
            label.textAlignment = .center
            label.text = text[x]
            scrollView.addSubview(label)
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

