//
//  MusicInfo.m
//  musicInfo
//
//  Created by 刘东旭 on 2019/3/31.
//  Copyright © 2019年 刘东旭. All rights reserved.
//

#import "MusicInfo.h"

@implementation MusicInfo

//-(void)dealloc {
//    NSLog(@"%s",__func__);
//}

- (instancetype)initWithMusicPath:(NSString *)path
{
    AVAsset *asset = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    return [self initWithMusicAsset:asset];
}

- (instancetype)initWithMusicAsset:(AVAsset *)asset {
    if (self = [super init]) {
        NSMutableArray *items = [NSMutableArray array];
        //        [items addObjectsFromArray:asset.metadata];
        NSArray<AVMetadataFormat> *formats = asset.availableMetadataFormats;
        for (NSString *format in formats) {
            NSArray<AVMetadataItem *> *item = [asset metadataForFormat:format];
            [items addObjectsFromArray:item];
        }
        self.duration = CMTimeGetSeconds(asset.duration);
        NSArray *metadatas;
        AVMetadataItem *it;
        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyCreator keySpace:AVMetadataKeySpaceCommon];
        it = metadatas.firstObject;
        self.creator = it.stringValue;
        NSLog(@"Creator作曲:%@",it.stringValue);
        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyTitle keySpace:AVMetadataKeySpaceCommon];
        it = metadatas.firstObject;
        self.title = it.stringValue;
        NSLog(@"Title歌名:%@",it.stringValue);
        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyArtist keySpace:AVMetadataKeySpaceCommon];
        it = metadatas.firstObject;
        self.artist = it.stringValue;
        NSLog(@"Artist艺人:%@",it.stringValue);
        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyAlbumName keySpace:AVMetadataKeySpaceCommon];
        it = metadatas.firstObject;
        self.albumName = it.stringValue;
        NSLog(@"AlbumName专辑:%@",it.stringValue);
        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataID3MetadataKeyBand keySpace:AVMetadataKeySpaceID3];
        it = metadatas.firstObject;
        self.band = it.stringValue;
        NSLog(@"Band专辑/艺术家:%@",it.stringValue);
        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyArtwork keySpace:AVMetadataKeySpaceCommon];
        it = metadatas.firstObject;
        UIImage *img = [UIImage imageWithData:it.dataValue];
        self.image = img;
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeySubject keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Subject:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyDescription keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Description:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyPublisher keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Publisher:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyContributor keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Contributor:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyCreationDate keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"CreationDate:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyLastModifiedDate keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"LastModifiedDate:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyType keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Type:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyFormat keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Format:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyIdentifier keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Identifier:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeySource keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Source:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyLanguage keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Language:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyRelation keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Relation:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyLocation keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Location:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyCopyrights keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Copyrights:%@",it.stringValue);
        
        //            metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyAuthor keySpace:AVMetadataKeySpaceCommon];
        //            it = metadatas.firstObject;
        //            NSLog(@"Author作者:%@",it.stringValue);
        
        //            NSLog(@"Artwork:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyMake keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Make:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeyModel keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Model:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataCommonKeySoftware keySpace:AVMetadataKeySpaceCommon];
        //        it = metadatas.firstObject;
        //        NSLog(@"Software:%@",it.stringValue);
        //
        //        //------------------------ituns------------------------------
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyAlbum keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"Album:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyArtist keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"Artist:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyUserComment keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"UserComment:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyCoverArt keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"CoverArt:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyCopyright keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"Copyright:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyReleaseDate keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"ReleaseDate:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyEncodedBy keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"EncodedBy:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyPredefinedGenre keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"PredefinedGenre:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyUserGenre keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"UserGenre:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataQuickTimeMetadataKeyAuthor keySpace:AVMetadataKeySpaceQuickTimeMetadata];
        //        it = metadatas.firstObject;
        //        NSLog(@"-----------------------");
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyTrackSubTitle keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"TrackSubTitle:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyEncodingTool keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"EncodingTool:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyComposer keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"Composer:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyAlbumArtist keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"AlbumArtist:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyAccountKind keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"AccountKind:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyAppleID keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"AppleID:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyArtistID keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"ArtistID:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeySongID keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"SongID:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataiTunesMetadataKeyDiscCompilation keySpace:AVMetadataKeySpaceiTunes];
        //        it = metadatas.firstObject;
        //        NSLog(@"DiscCompilation:%@",it.stringValue);
        
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataID3MetadataKeyAlbumTitle keySpace:AVMetadataKeySpaceID3];
        //        it = metadatas.firstObject;
        //        NSLog(@"AlbumTitle:%@",it.stringValue);
        //        metadatas = [AVMetadataItem metadataItemsFromArray:items withKey:AVMetadataID3MetadataKeyTitleDescription keySpace:AVMetadataKeySpaceID3];
        //        it = metadatas.firstObject;
        //        NSLog(@"TitleDescription:%@",it.stringValue);
        //        [asset loadValuesAsynchronouslyForKeys:@[@"availableMetadataFormats"] completionHandler:^{
        //
        //        }];
    }
    return self;
}

+ (void)loadValuesAsynchronouslyWithMusicPath:(NSString *)path completionHandler:(void(^)(MusicInfo *info))completionHandler {
    AVAsset *asset = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    [asset loadValuesAsynchronouslyForKeys:@[@"availableMetadataFormats"] completionHandler:^{
        MusicInfo *info = [[MusicInfo alloc] initWithMusicAsset:asset];
        completionHandler(info);
    }];
}

@end
