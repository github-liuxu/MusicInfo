//
//  ViewController.m
//  musicInfo
//
//  Created by 刘东旭 on 2019/3/31.
//  Copyright © 2019年 刘东旭. All rights reserved.
//

#import "ViewController.h"
#import "MusicInfo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
    MusicInfo *info = [[MusicInfo alloc] initWithMusicPath:path];
//    [self loadData];
}
- (void)loadData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
    [MusicInfo loadValuesAsynchronouslyWithMusicPath:path completionHandler:^(MusicInfo * _Nonnull info) {
        
    }];
}

@end
