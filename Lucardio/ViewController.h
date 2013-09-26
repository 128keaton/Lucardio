//
//  ViewController.h
//  Lucardio
//
//  Created by Keaton Burleson on 6/12/12.
//  Copyright (c) 2012 Keaton Burleson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PassKit/PassKit.h>
@interface ViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource,
PKAddPassesViewControllerDelegate>
{
    NSMutableArray *_passes; //3
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *spinny;
    IBOutlet UITableView *refreshview;
    int addone;
}


@property (strong, nonatomic) IBOutlet UITableViewCell *starbucksButtonCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *exampleButtonCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *sodesoButtonCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *targetButtonCell;
@property (nonatomic, strong) NSString *passname;


@end