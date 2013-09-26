//
//  PassServe.h
//  Lucardio
//
//  Created by Keaton Burleson on 9/26/13.
//  Copyright (c) 2013 Keaton Burleson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PassServe : NSObject
+ (void)downloadPassWithURL:(NSURL *)url passName:(NSString *)name webView:(UIWebView *)webView tableView:(UITableView *)tableView overwrite:(BOOL *)overwrite;
+ (void)generatePassWithURL:(NSString *)url argument:(NSString *)argument activityView:(UIActivityIndicatorView *)activityIndicator webView:(UIWebView *)webView;
@end
