//
//  CustomView.swift
//  StoryboardsAreBad
//
//  Created by Jeremy Petter on 2016-10-20.
//  Copyright © 2016 Jeremy Petter. All rights reserved.
//

import UIKit

class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    private func setUp() {
        backgroundColor = .white

        addSubview(imageView)
        addSubview(label)
        addSubview(button1)
        addSubview(button2)

//        addConstraint(NSLayoutConstraint(
//            item: imageView,
//            attribute: .top,
//            relatedBy: .equal,
//            toItem: self,
//            attribute: .top,
//            multiplier: 1.0,
//            constant: 30
//        ))

        centerConstraint = imageView.centerXAnchor.constraint(equalTo: centerXAnchor)

        rightConstraint = imageView.trailingAnchor.constraint(equalTo: trailingAnchor)

        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true

        let formats: [String: NSLayoutFormatOptions] = [
            "V:|-topPadding-[imageView(200)]-middlePadding-[label]-[button1]-[button2]":.alignAllCenterX
            //"other strings": other options
        ]

        let metrics = [
            "topPadding": 30,
            "middlePadding": 50,
            ]

        let views: [String: UIView] = [
            "imageView": imageView,
            "label": label,
            "button1": button1,
            "button2": button2,
            ]

        var constraints: [NSLayoutConstraint] = []
        for (format, options) in formats {
            constraints.append(contentsOf:
                NSLayoutConstraint.constraints(
                    withVisualFormat: format,
                    options: options,
                    metrics: metrics,
                    views: views
                )
            )
        }

//        let constraints = NSLayoutConstraint.constraints(
//            withVisualFormat: "V:|-topPadding-[imageView]-middlePadding-[label]",
//            options: .alignAllCenterX,
//            metrics: [
//                "topPadding": 30,
//                "middlePadding": 50,
//            ],
//            views: [
//                "imageView": imageView,
//                "label": label,
//            ])

        NSLayoutConstraint.activate(constraints)
    }

    override func layoutSubviews() {
        if traitCollection.horizontalSizeClass == .compact {
            centerConstraint.isActive = true
            rightConstraint.isActive = false
        } else {
            centerConstraint.isActive = false
            rightConstraint.isActive = true
        }
        super.layoutSubviews()
    }

    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "addIcon"))//UIImageView(image: #imageLiteral(resourceName: "jeremy"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jeremy"
        return label
    }()

    lazy var button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()

    lazy var button2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Table", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()

    var centerConstraint: NSLayoutConstraint!
    var rightConstraint: NSLayoutConstraint!
}
