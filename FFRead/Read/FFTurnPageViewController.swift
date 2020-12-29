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
    
    var readModels: [FFReadModel]! = []
    
//    var chapterIndex: Int!
//
//    var cacheIndex: Int!
//
    var currentModel: FFReadModel!
    
    var number:NSInteger = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        view.backgroundColor = UIColor.red
        isDoubleSided = true
        let firstVC = getFirstViewController()
        setViewControllers([firstVC], direction: UIPageViewController.NavigationDirection.reverse, animated: false, completion: nil)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
    
    /// 准备切换
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        currentModel = (viewController as? FFReadViewPageController)?.readModel.copyModel()
        
        return getAboveReadViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let model = (viewController as? FFReadViewPageController)?.readModel
        if (model != nil) {
            currentModel = model?.copyModel()
        }
        return getBelowReadViewController()
    }
    
    func getAboveReadViewController() -> FFReadViewPageController? {
        if currentModel.chapterIndex == 0 && currentModel.currentPage == 0 && (abs(number)%2) != 0 {
            print("已经是第一页了")
            return nil
        }
        
        number -= 1
        if ((abs(number)%2) == 0) {
            getAboveReadModel()
        }
        
//        getAboveReadModel()

//        let pageModel: FFReadPageModel = currentModel.pageModels[currentModel.currentPage]
        return getReadViewController(readModel: currentModel)
    }
    
    
    func getAboveReadModel() {
        if currentModel.currentPage <= 0 {
            if readModels.count > 0 && currentModel.cacheIndex > 0 {
                currentModel.cacheIndex -= 1
                currentModel.chapterIndex -= 1
                currentModel = readModels[currentModel.cacheIndex]
                currentModel.currentPage = currentModel.readItemModel.pageModels.count - 1
            } else {
                currentModel.chapterIndex -= 1
                currentModel.cacheIndex = 0
                let chapterModel = readChapterList[currentModel.chapterIndex]
                let itemModel = FFCoreTextParser.parseContent(content: chapterModel.content, chapterModel: chapterModel)
                currentModel.readItemModel = itemModel
                currentModel.currentPage = currentModel.readItemModel.pageModels.count - 1
            }
            
        } else {
            currentModel.currentPage -= 1
        }
    }
    
    func getBelowReadViewController() -> FFReadViewPageController? {
                
        if currentModel.chapterIndex == readChapterList.count - 1 && currentModel.currentPage == currentModel.readItemModel.pageModels.count - 1 {
            print("已经是最后页了")
            return nil
        }
        
        number += 1
        if ((abs(number)%2) != 0) {
            getBelowReadModel()
        }
//        getBelowReadModel()

//        let pageModel: FFReadPageModel = currentModel.pageModels[currentModel.currentPage]
        return getReadViewController(readModel: currentModel)
    }
    
    
    func getBelowReadModel() {
        if currentModel.currentPage >= currentModel.readItemModel.pageModels.count - 1 {
            if readModels.count > 0 && currentModel.cacheIndex < readModels.count - 1 {
                currentModel.cacheIndex += 1
                currentModel.chapterIndex += 1
                currentModel.currentPage = 0
                currentModel = readModels[currentModel.cacheIndex]
            } else {
                currentModel.chapterIndex += 1
                currentModel.cacheIndex += 1
                currentModel.currentPage = 0
                let chapterModel = readChapterList[currentModel.chapterIndex]
                let itemModel = FFCoreTextParser.parseContent(content: chapterModel.content, chapterModel: chapterModel)
                currentModel.readItemModel = itemModel
            }
            
        } else {
            currentModel.currentPage += 1
        }
    }
    
    func getReadViewController(readModel:FFReadModel) -> FFReadViewPageController {
        let viewController = FFReadViewPageController()
        viewController.setupViews()
        viewController.readModel = readModel

        return viewController
    }

    func getFirstViewController() -> FFReadViewPageController {
        readModels.removeAll()
        let chapterModel = self.readChapterList[0]
        let itemModel = FFCoreTextParser.parseContent(content: chapterModel.content, chapterModel: chapterModel)
        currentModel = FFReadModel()
        currentModel.readItemModel = itemModel
//        let pageModel: FFReadPageModel = currentModel.pageModels.first!
        
        return getReadViewController(readModel: currentModel)
    }

}


