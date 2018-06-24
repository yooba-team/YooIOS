//
//  AppManager.h
//  YooIOS
//
//  Created by flyye on 2018/6/24.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface AppManager : NSObject

@property(nonatomic, strong) NSURL *jsCodeLocation;

+ (AppManager *)shareInstance;

- (void)openRootViewController;

- (UIViewController*)getRootViewController;

- (void)popViewControllerAnimated:(BOOL) animated;

- (void)pushViewController:(NSString *)viewController animated:(BOOL)animated parameter:(NSString *)jsonParam;

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (void)pushRNViewController:(NSString *)pageName animated:(BOOL)animated parameter:(NSString *)jsonParam;

- (void)pushToTopClass:(NSString *)className withController:(UIViewController *)controller withNavigationController:(UIViewController *)navVc;

- (UIViewController*)visibleViewController;

@end

