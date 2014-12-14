//
//  MovieDetailViewController.swift
//  Movii
//
//  Created by Pedro Piñera Buendía on 13/12/14.
//  Copyright (c) 2014 PPinera. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController
{
    lazy var posterView: UIImageView = {
        var imageView = UIImageView()
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        return imageView
    } ()
    
    lazy var buyButton: UIButton = {
        var button = UIButton()
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.setTitle("Buy tickets for 19:00", forState: UIControlState.Normal)
        button.backgroundColor = UIColor(red: 41.0/255, green: 71.0/255, blue: 95.0/255, alpha: 1.0)
        button.titleLabel?.font = UIFont.systemFontOfSize(30)
        return button
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.posterView)
        self.view.addSubview(self.buyButton)
        self.posterView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
        self.buyButton.autoPinEdgesToSuperviewMarginsExcludingEdge(ALEdge.Top)
        self.buyButton.autoSetDimension(ALDimension.Height, toSize: 100)
        self.buyButton.addTarget(self, action: Selector("buyTickets"), forControlEvents: UIControlEvents.TouchUpInside)
        let movie = FakeAPIClient.getInstance().movies.last
        if (movie == nil) { return }
        self.posterView.image = movie!.poster
    }
    
    func buyTickets()
    {
        let viewController: TOWebViewController = TOWebViewController(URLString: "http://grupbalana-bosque.admit-one.eu/?p=details&eventCode=14675")
        let nav: UINavigationController = UINavigationController(rootViewController: viewController)
        self.presentViewController(nav, animated: true, completion: nil)
    }
}
