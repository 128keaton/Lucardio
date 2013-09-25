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

#define myTag1 1
#define myTag2 2
#define myTag3 3
#define myTag4 4
#define myTag5 5


- (void)viewDidLoad
{
    [super viewDidLoad];

    if (![PKPassLibrary isPassLibraryAvailable]) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"PassKit not available"
                                   delegate:nil
                          cancelButtonTitle:@"Okay"
                          otherButtonTitles: nil] show];
        return;
    }
    
    
    _passes = [[NSMutableArray alloc] init];
    
    //2 load the passes from the resource folder
    NSString* resourcePath =
    [[NSBundle mainBundle] resourcePath];
    
    NSArray* passFiles = [[NSFileManager defaultManager]
                          contentsOfDirectoryAtPath:resourcePath
                          error:nil];
    
    //3 loop over the resource files
    for (NSString* passFile in passFiles) {
        if ( [passFile hasSuffix:@".pkpass"] ) {
            [_passes addObject: passFile];
        }
    }
    
    
    
    if ([_passes count]==1) {
        [self openPassWithName:[_passes objectAtIndex:0]];
    }
    [self.tableView reloadData];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   //1
    NSString* passName = _passes[indexPath.row];
    [self openPassWithName:passName];
}

-(void)addPassesViewControllerDidFinish: (PKAddPassesViewController*) controller
{
    //pass added
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)openPassWithName:(NSString*)name
{
    
    //2
    NSString* passFile = [[[NSBundle mainBundle] resourcePath]
                          stringByAppendingPathComponent:name];
   
    //3
    NSData *passData = [NSData dataWithContentsOfFile:passFile];
    
    //4
    NSError* error = nil;
    PKPass *newPass = [[PKPass alloc] initWithData:passData
                                             error:&error];
    //5
    if (error!=nil) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:[error
                                             localizedDescription]
                                   delegate:nil
                          cancelButtonTitle:@"Okay"
                          otherButtonTitles: nil] show];
        return;
    }
    
    //6
    PKAddPassesViewController *addController =
    [[PKAddPassesViewController alloc] initWithPass:newPass];
    
    addController.delegate = self;
    [self presentViewController:addController
                       animated:YES
                     completion:nil];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _passes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    NSString *object = _passes[indexPath.row];
    
   
    cell.textLabel.text = [object stringByReplacingOccurrencesOfString:@".pkpass" withString:@""];;
    return cell;
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

- (IBAction)starbucks:(id)sender{
    
    
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

- (IBAction)example:(id)sender{
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TestExample" ofType:@"pkpass"];  
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error;
    
    PKPass *pass = [[PKPass alloc] initWithData:data error:&error];     
    
    PKAddPassesViewController *vc = [[PKAddPassesViewController alloc] initWithPass:pass];
    
    [vc setDelegate:self];
    
    [self presentViewController:vc animated:YES completion:nil];
    
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"hullo!" );
}

- (IBAction)sodeso:(id)sender{
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Sodeso" ofType:@"pkpass"];  
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error;
    
    PKPass *pass = [[PKPass alloc] initWithData:data error:&error];     
    
    PKAddPassesViewController *vc = [[PKAddPassesViewController alloc] initWithPass:pass];
    
    [vc setDelegate:self];
    
    [self presentViewController:vc animated:YES completion:nil];
    
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"hullo!" );
}

- (IBAction)target:(id)sender{
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Target" ofType:@"pkpass"];  
    
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
