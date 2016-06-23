//
//  AppDelegate.h
//  TestFbShare
//
//  Created by Quan Nguyen on 6/23/16.
//  Copyright © 2016 Quan Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, FBSDKSharingDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

