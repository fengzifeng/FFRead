//
//  FFTurnPageViewController.swift
//  FFRead
//
//  Created by feng on 2020/11/6.
//  Copyright © 2020 feng. All rights reserved.
//

import UIKit

class FFTurnPageViewController: UIPageViewController,UIGestureRecognizerDelegate, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var readChapterList :[FFReadChapterModel]!
    
    var readModels: [FFReadItemModel]! = []
    
    var chapterIndex: Int!
    
    var cacheIndex: Int!
    
    var currentModel: FFReadItemModel!
    
    var number:NSInteger = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        let firstVC = getFirstViewController()
        
        self.setViewControllers([firstVC], direction: UIPageViewController.NavigationDirection.reverse, animated: false, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
    
    /// 准备切换
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getAboveReadViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getBelowReadViewController()

    }
    
    func getAboveReadViewController() -> FFReadViewController? {
        if chapterIndex == 0 && currentModel.currentPage == 0 {
            print("已经是第一页了")
            return nil
        }
        
        getAboveReadModel()
        let pageModel: FFReadPageModel = currentModel.pageModels[currentModel.currentPage]
        return getReadViewController(pageModel: pageModel)
    }
    
    
    func getAboveReadModel() {
        if currentModel.currentPage <= 0 {
            if readModels.count > 0 && cacheIndex > 0 {
                cacheIndex -= 1
                chapterIndex -= 1
                currentModel = readModels[cacheIndex]
            } else {
                chapterIndex -= 1
                cacheIndex = 0
                let chapterModel = readChapterList[chapterIndex]
                currentModel = FFCoreTextParser.parseContent(content: chapterModel.content, chapterModel: chapterModel)
            }
            
        } else {
            currentModel.currentPage -= 1
        }
    }
    
    func getBelowReadViewController() -> FFReadViewController? {
        
        
        
        if chapterIndex == readChapterList.count - 1 && currentModel.currentPage == currentModel.pageModels.count - 1 {
            print("已经是最后页了")
            return nil
        }
        
        getBelowReadModel()
        let pageModel: FFReadPageModel = currentModel.pageModels[currentModel.currentPage]
        return getReadViewController(pageModel: pageModel)
    }
    
    
    func getBelowReadModel() {
        if currentModel.currentPage >= currentModel.pageModels.count - 1 {
            if readModels.count > 0 && cacheIndex < readModels.count - 1 {
                cacheIndex += 1
                chapterIndex += 1
                currentModel = readModels[cacheIndex]
            } else {
                chapterIndex += 1
                cacheIndex += 1
                let chapterModel = readChapterList[chapterIndex]
                currentModel = FFCoreTextParser.parseContent(content: chapterModel.content, chapterModel: chapterModel)
            }
            
        } else {
            currentModel.currentPage += 1
        }
    }
    
    func getReadViewController(pageModel:FFReadPageModel) -> FFReadViewController {
        let viewController = FFReadViewController()
        viewController.setupViews()
        viewController.pageModel = pageModel;

        return viewController
    }

    func getFirstViewController() -> FFReadViewController {
        readModels.removeAll()
        chapterIndex = 0
        cacheIndex = 0
        let chapterModel = self.readChapterList[0]
        currentModel = FFCoreTextParser.parseContent(content: chapterModel.content, chapterModel: chapterModel)
        let pageModel: FFReadPageModel = currentModel.pageModels.first!
        
        return getReadViewController(pageModel: pageModel)
    }

}


