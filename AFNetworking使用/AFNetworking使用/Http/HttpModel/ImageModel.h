//
//  ImageModel.h
//  AFNetworking使用
//
//  Created by bruce on 15/8/27.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "HttpConnect.h"

@interface ImageModel : HttpConnect

@property(nonatomic, strong) NSString *imageID;
@property(nonatomic, strong) NSString *imageTitle;
@property(nonatomic, strong) NSString *imageUrl;

@end
