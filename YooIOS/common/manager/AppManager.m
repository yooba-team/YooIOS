//
//  AppManager.m
//  YooIOS
//
//  Created by flyye on 2018/6/24.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "AppManager.h"
#import  <React/RCTRootView.h>
#import "RNBaseViewController.h"

//if debug replace your local ip
#define RN_RES_PATH @"http://192.168.1.100:8081/index.ios.bundle?platform=ios&dev=true"
#define RN_DEBUG @"false"


@implementation AppManager

static AppManager *instance = nil;
+ (AppManager *)shareInstance {
    @synchronized(self) {
        if (instance == nil) {
            instance = [[AppManager alloc] init];
            if([RN_DEBUG isEqualToString:@"true"]){
                instance.jsCodeLocation = [NSURL URLWithString:RN_RES_PATH];
            }else{
                instance.jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"RNBundle/index.ios" withExtension:@"jsbundle"];
            }
        }
    }
    
    return instance;
}


- (void)popViewControllerAnimated:(BOOL) animated{
    UIViewController* visibleVc = [self visibleViewController];
    if(visibleVc.navigationController != nil){
        [visibleVc.navigationController popViewControllerAnimated:animated];
    }else{
        [self openRootViewController];
    }
}

- (void)openRootViewController{
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    //TODO:  place rootvc
   // keyWindow.rootViewController=;
}

- (UIViewController*)getRootViewController{
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    return keyWindow.rootViewController;
}


- (void)pushToTopClass:(NSString *)className
            withController:(UIViewController *)controller
   withNavigationController:(UINavigationController *)navVc{
    //TODO: push to top vc
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIViewController* visibleVc = [self visibleViewController];
    if(visibleVc.navigationController != nil){
        [visibleVc.navigationController pushViewController:viewController animated:animated];
    }else{
        [((UITabBarController*)[self getRootViewController]).selectedViewController.navigationController pushViewController:viewController animated:animated];
    }
}


- (void)pushViewController:(NSString *)viewController animated:(BOOL)animated parameter:(NSString *)jsonParam{
    //TODO: open vc from rn
}

- (void)pushRNViewController:(NSString *)rnPageName animated:(BOOL)animated parameter:(NSString *)jsonParam{
    NSDictionary *paramsDic = nil;
    if(![jsonParam isEqualToString:@""]){
        paramsDic = @{@"screenProps":jsonParam};
    }
    RNBaseViewController *rnVc = [[RNBaseViewController alloc] initWithScreenName:rnPageName initProperties:paramsDic];
    UIViewController* visibleVc = [self visibleViewController];
    
    if(visibleVc.navigationController != nil){
        [visibleVc.navigationController pushViewController:rnVc animated:animated];
    }else{
        //TODO: if not,use the right vc to open.
    }
}


- (UIViewController*)visibleViewController{
    //TODO: get the visibleViewController
    return nil;
}





@end
