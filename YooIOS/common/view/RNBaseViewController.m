//
//  RNBaseViewController.m
//  YooIOS
//
//  Created by flyye on 2018/6/24.
//

#import <Foundation/Foundation.h>
#import "RNBaseViewController.h"
#import <React/RCTRootView.h>
#import "AppManager.h"

@interface RNBaseViewController()

@property(nonatomic, strong) NSString *screenName;
@property(nonatomic, strong) NSDictionary *properties;

@end

@implementation RNBaseViewController


- (instancetype)initWithScreenName:(NSString *)screenName initProperties:(NSDictionary *) initProperties {

    self = [super init];
    if (self) {
        _screenName = screenName;
        _properties = initProperties;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.additionalSafeAreaInsets = self.view.safeAreaInsets;
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:[AppManager shareInstance].jsCodeLocation
                                                        moduleName:_screenName
                                                 initialProperties:_properties
                                                     launchOptions:nil];
    rootView.frame  =  CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20);
    rootView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:rootView];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

#pragma mark <Rotate>

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end
