//
//  ViewController.m
//  TestFbShare
//
//  Created by Quan Nguyen on 6/23/16.
//  Copyright © 2016 Quan Nguyen. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onLoginBtn:(id)sender
{
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    loginManager.loginBehavior = FBSDKLoginBehaviorNative;
    loginManager.defaultAudience = FBSDKDefaultAudienceEveryone;
    [loginManager logInWithReadPermissions:@[@"public_profile", @"user_friends"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        
        if(error != nil || result == nil || result.isCancelled){
            NSLog(@"Login FB false ");
        }
        else{
            FBSDKAccessToken *token = [result token];
            NSLog(@"fb token: %@", token);
        }
    }];

}

- (void) onShareBtn:(id)sender
{
    AppDelegate *app = (AppDelegate*) [UIApplication sharedApplication].delegate;
    
    FBSDKShareDialog *dialog = [[FBSDKShareDialog alloc] init];
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.imageURL = [NSURL URLWithString:@"https://lh3.googleusercontent.com/EwSWNq14KRpGD0bZ5Y724Bt5egVeBJ89EYl6Tm6XoTbkSqQJ8fzYi5eTn7UKK9kXM3Y=w300"];
    content.contentTitle = @"Disney Catch Catch - tim diem khac nhau";
    content.contentDescription = @"Disney Catch Catch là game tìm điểm khác nhau online hoàn toàn miễn phí trên mobile, mang chủ đề phim hoạt hình kinh điển của Disney. Disney Catch Catch sẽ mang đến cho bạn một trải nghiệm hoàn toàn mới mẻ về thể loại game tìm điểm khác nhau. Chắc chắn bạn sẽ thích mê nếu đã từng xem và là fan hâm mộ của các phim hoạt hình kinh điển của Disney.";
    content.contentURL = [NSURL URLWithString:@"http://disneycatch.360game.vn"];
    
    dialog.shareContent = content;
    dialog.fromViewController = self;
    dialog.delegate = app;
    
    dialog.mode = FBSDKShareDialogModeFeedWeb;
    
    NSError *error = nil;
    [dialog validateWithError:&error];
    NSLog(@"error = %@", error);
    NSLog(@"dialog mode = %lu", dialog.mode);
    
    if([dialog show]){
        NSLog(@"share dialog did show");
    }
    else{
        NSLog(@"share dialog failed to show");
    }
}

@end
