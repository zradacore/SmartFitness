//
//  ViewController.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 12.10.2022.
//

import UIKit
import SnapKit

class OnBoardingViewController: UIViewController, Storyboardable {
    private let girlsImageView : UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "onBoardGirls")
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    private let titleText : UILabel = {
       let title = UILabel()
        title.text = "Wherever you are health is number one".localized()
        title.font = .boldSystemFont(ofSize: 24)
        title.textColor = .black
        title.numberOfLines = .max
        title.textAlignment = .center
        return title
    }()
    
    private let subTitle : UILabel = {
       let sub = UILabel()
        sub.text = "There is no instant way to a healthy life".localized()
        sub.font = UIFont.preferredFont(forTextStyle: .title2, compatibleWith: .current)
        sub.textColor = UIColor.init(hexString: "192126").withAlphaComponent(0.5)
        sub.textAlignment = .center
        sub.numberOfLines = .max
        
        return sub
    }()
    
    private let progressView : UIProgressView = {
        let progress = UIProgressView()
        progress.progress = 0.5
        progress.trackTintColor = UIColor.init(hexString: "192126")
        
        progress.tintColor = UIColor.init(hexString: "BBF246")
        
        return progress
        
    }()

    private let startButton : UIButton = {
        let button = UIButton()
        button.setTitle("Get started".localized(), for: .normal)
        button.backgroundColor = UIColor.init(hexString: "192126")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(start(_:)), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    @objc func start(_ sender : UIButton){
        let vc = SignInViewController.createObject()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
  
    private func setupUI(){
        self.navigationController?.isNavigationBarHidden = true
        view.addSubview(startButton)
        view.addSubview(progressView)
        view.addSubview(subTitle)
        view.addSubview(titleText)
        view.addSubview(girlsImageView)
        startButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(25)
            make.height.equalTo(60)
        }
        progressView.snp.makeConstraints { make in
            make.bottom.equalTo(startButton).inset(100)
           make.width.equalTo(65)
           make.height.equalTo(5)
            make.centerX.equalToSuperview()
          //  make.centerY.equalToSuperview()
        }
        subTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(progressView).inset(45)
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(40)
        }
        titleText.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(40)
            make.leading.equalToSuperview().inset(40)
            make.bottom.equalTo(subTitle).inset(70)
            make.centerX.equalToSuperview()
        }
        girlsImageView.snp.makeConstraints { make in
            make.bottom.equalTo(titleText).inset(64)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    
    

}

