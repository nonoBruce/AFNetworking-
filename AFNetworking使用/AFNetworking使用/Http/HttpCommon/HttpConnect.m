//
//  HttpConnect.m
//  AFNetworkingDemo
//
//  Created by bruce on 15/8/25.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "HttpConnect.h"

@interface HttpConnect()

@end

@implementation HttpConnect

- (void)getRequest:(NSURL *)url andDelegate:(id<HttpResultProtocol>)delegate andType:(HttpCommunicationType )cType {
    
    
    __block HttpCommunicationResult *result = nil;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[url absoluteString]
      parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
          
          NSLog(@"JSON: %@", responseObject);
          
          
          
          result = [self parse:responseObject andHttpResult:result];
          
          [delegate requestFinishedError:cType andResult:result];
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          result = [[HttpCommunicationResult alloc] init];
          
          NSLog(@"Error: %@", error);
          [delegate requestFinishedError:cType andResult:result];
      }];
    
    
}

#pragma mark - 子类使用
- (HttpCommunicationResult *)parse:(NSDictionary *)dic andHttpResult:(HttpCommunicationResult *)httpResult{
    return httpResult;
}

- (void)requestWithObject:(id)object andDelegate:(id<HttpResultProtocol>)delegate andType:(HttpCommunicationType) cType{
    
}
@end

