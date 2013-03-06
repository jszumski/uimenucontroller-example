//
//  JSAppDelegate.h
//  UIMenuController Example
//
//  Copyright (c) 2011 John Szumski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSViewController;

@interface JSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow			*window;
@property (strong, nonatomic) JSViewController	*viewController;

@end