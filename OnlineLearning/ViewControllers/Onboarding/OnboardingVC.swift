//
//  OnboardingVC.swift
//  OnlineLearning
//
//  Created by vinatti on 24/01/2022.
//

import UIKit

class OnboardingVC: UIViewController {
    var pageController = UIPageViewController()
    var controllers = [UIViewController]()
    var pageControl = UIPageControl()
    let lbSkip: UILabel = {
        let lb = UILabel()
        lb.textColor = Colors.lbColorSecond
        lb.font = UIFont(name: Font.regular, size: 14)
        lb.text = "Skip"
        return lb
    }()
    var index: Int = 0
    
    var btnSignUp: UIButton = {
        let button = UIButton()
        return button
    }()
    var btnSignIn: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var buttonStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundPrimary
        
        setupLabelSkip()
        setupPageController()
        setupPageControl()
        setupBottomButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func setupLabelSkip(){
        view.addSubview(lbSkip)
        lbSkip.labelConstraint(top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: -20))
        let tap = UITapGestureRecognizer(target: self, action: #selector(onSignUp))
        lbSkip.isUserInteractionEnabled = true
        lbSkip.addGestureRecognizer(tap)
    }
    
    func setupPageControl(){
        pageControl = CustomPageControl()
        pageControl.numberOfPages = controllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = Colors.bluePrimary
        pageControl.pageIndicatorTintColor = Colors.lbColorSecond
        pageControl.currentPageIndicatorTintColor = Colors.bluePrimary
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: pageController.view.bottomAnchor),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupPageController(){
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.dataSource = self
        pageController.delegate = self
        
        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageController.view.topAnchor.constraint(equalTo: lbSkip.bottomAnchor),
            pageController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            pageController.view.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.6),
            pageController.view.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        pageController.didMove(toParent: self)
        
        for item in OnboardingData {
            let vc = OnboardingChildView()
            vc.image.image = UIImage(named: item.image ?? "")
            vc.lbTitle.text = item.title ?? ""
            vc.lbDescription.text = item.description ?? ""
            controllers.append(vc)
        }
        
        pageController.setViewControllers([controllers[0]], direction: .forward, animated: true, completion: nil)
    }
    
    func setupBottomButton(){
        buttonStack.addArrangedSubview(btnSignUp)
        buttonStack.addArrangedSubview(btnSignIn)
        view.addSubview(buttonStack)
        buttonStack.stackConstraint(top: pageControl.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        buttonStack.spacing = 20
        buttonStack.distribution = UIStackView.Distribution.fillEqually
        btnSignUp.buildPrimaryButton("Sign up")
        btnSignIn.buildSecondaryButton("Log in")
        btnSignIn.addTarget(self, action: #selector(onLogin), for: .touchUpInside)
        btnSignUp.addTarget(self, action: #selector(onSignUp), for: .touchUpInside)
        self.buttonStack.isHidden = true
    }
    
    @objc func onSignUp(){
        let vc = SignupVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onLogin(){
        let vc = LoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: Page controller datasource
extension OnboardingVC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController){
            self.index = index
            if index > 0 {
                self.lbSkip.isHidden = false
                self.buttonStack.isHidden = true
                return controllers[index - 1]
            } else {
                self.lbSkip.isHidden = false
                self.buttonStack.isHidden = true
                return nil
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController){
            if index < controllers.count - 1 {
                return controllers[index + 1]
            } else {
                if index == controllers.count - 1 {
                    self.lbSkip.isHidden = true
                    self.buttonStack.isHidden = false
                }
                return nil
            }
        }
        return nil
    }
}
//MARK: Page controller delegate
extension OnboardingVC: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed,
              let currentVC = pageViewController.viewControllers?.first,
              let index = controllers.firstIndex(of: currentVC) else {return}
        pageControl.currentPage = index
    }
}
