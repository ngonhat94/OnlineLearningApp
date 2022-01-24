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
//    weak var customPageDelegate: CustomPageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundPrimary
        setupPageController()
        setupPageControl()
    }
    
    func setupPageControl(){
        pageControl = UIPageControl(frame: CGRect(x: 0, y: view.bounds.maxY, width: view.bounds.width, height: 50))
        pageControl.numberOfPages = controllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = .black
        pageControl.pageIndicatorTintColor = .cyan
        pageControl.currentPageIndicatorTintColor = .black
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: pageController.view.bottomAnchor),
            pageControl.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
//        customPageDelegate?.numberOfPage(numberOfPage: controllers.count)
    }
    
    func setupPageController(){
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.dataSource = self
        pageController.delegate = self
        
        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            pageController.view.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.7),
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
}

extension OnboardingVC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController){
            if index > 0 {
                return controllers[index - 1]
            } else {
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
                return nil
            }
        }
        return nil
    }
}
extension OnboardingVC: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed,
              let currentVC = pageViewController.viewControllers?.first,
              let index = controllers.firstIndex(of: currentVC) else {return}
        pageControl.currentPage = index
    }
}
//protocol CustomPageViewControllerDelegate: AnyObject {
//    func numberOfPage(numberOfPage: Int)
//    func pageChangeTo(index: Int)
//}
