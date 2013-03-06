//
//  JSAppDelegate.m
//  UIMenuController Example
//
//  Copyright (c) 2011 John Szumski. All rights reserved.
//

#import "JSAppDelegate.h"
#import "JSViewController.h"

@implementation JSAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	self.viewController = [[JSViewController alloc] init];
	
	self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
	
    return YES;
}

@end