//
//  MusicInfo.h
//  musicInfo
//
//  Created by 刘东旭 on 2019/3/31.
//  Copyright © 2019年 刘东旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MusicInfo : NSObject

- (instancetype)initWithMusicPath:(NSString *)path;
- (instancetype)initWithMusicAsset:(AVAsset *)asset;
+ (void)loadValuesAsynchronouslyWithMusicPath:(NSString *)path completionHandler:(void(^)(MusicInfo *info))completionHandler;

@property (nonatomic, strong) UIImage *image; //封面
@property (nonatomic, strong) NSString *title; //标题，名字
@property (nonatomic, strong) NSString *creator; //作曲者
@property (nonatomic, strong) NSString *albumName; //专辑
@property (nonatomic, strong) NSString *artist; //艺术家
@property (nonatomic, strong) NSString *band; //专辑/艺术家
@property (nonatomic, assign) Float64 duration; //时长

@end

NS_ASSUME_NONNULL_END
