//
//  TodayViewController.m
//  TodayGIF
//
//  Created by Brian Tung on 6/24/14.
//  Copyright (c) 2014 Flame Co. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "UIImage+animatedGIF.h"

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.statusLabel.text = @"Loading GIF";
    __block NSData *data;
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://s3.amazonaws.com/giphymedia/media/DW58L1pbminPq/200.gif"]];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            self.statusLabel.hidden = YES;
            [self.animatedImageView setImage:[UIImage animatedImageWithAnimatedGIFData:data]];
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encoutered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    self.statusLabel.text = @"Loading GIF";
    __block NSData *data;
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://s3.amazonaws.com/giphymedia/media/DW58L1pbminPq/200.gif"]];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            self.statusLabel.hidden = YES;
            [self.animatedImageView setImage:[UIImage animatedImageWithAnimatedGIFData:data]];
        });
    });
    
    completionHandler(NCUpdateResultNewData);
}

@end
