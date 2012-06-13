//
//  ViewController.h
//  Lucardio
//
//  Created by Keaton Burleson on 6/12/12.
//  Copyright (c) 2012 Keaton Burleson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    UIButton *addButton;
}


@property (nonatomic, retain) IBOutlet UIButton *addButton;

- (IBAction)addToLib;

@end
