//
//  ViewController.m
//  Lucardio
//
//  Created by Keaton Burleson on 6/12/12.
//  Copyright (c) 2012 Keaton Burleson. All rights reserved.
//

#import "ViewController.h"

#import "PassKit/PassKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)addToLib:(id)sender{
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Starbucks" ofType:@"pkpass"];  
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error;
    
    PKPass *pass = [[PKPass alloc] initWithData:data error:&error];     
    
    PKAddPassesViewController *vc = [[PKAddPassesViewController alloc] initWithPass:pass];
    
    [vc setDelegate:self];
    
    [self presentViewController:vc animated:YES completion:nil];
    
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"hullo!" );
}

- (IBAction)addToLib2:(id)sender{
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TextExample" ofType:@"pkpass"];  
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error;
    
    PKPass *pass = [[PKPass alloc] initWithData:data error:&error];     
    
    PKAddPassesViewController *vc = [[PKAddPassesViewController alloc] initWithPass:pass];
    
    [vc setDelegate:self];
    
    [self presentViewController:vc animated:YES completion:nil];
    
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"hullo!" );
}



@end
