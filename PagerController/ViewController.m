//
//  ViewController.m
//  PagerController
//
//  Created by Rana on 11/28/16.
//  Copyright © 2016 Rana. All rights reserved.
//

#import "ViewController.h"
#import "PageOneViewController.h"
#import "PageTwoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Array to keep track of controllers in page menu
    NSMutableArray *controllerArray = [NSMutableArray array];
    
    // Create variables for all view controllers you want to put in the
    // page menu, initialize them, and add each to the controller array.
    // (Can be any UIViewController subclass)
    // Make sure the title property of all view controllers is set
    // Example:
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PageOneViewController *oneView = [storyBoard instantiateViewControllerWithIdentifier:@"pageOneViewController"];
    oneView.title = @"Page One";
    [controllerArray addObject:oneView];
    
    PageTwoViewController *twoView = [storyBoard instantiateViewControllerWithIdentifier:@"pageTwoViewController"];
    twoView.title = @"Page Two";
    [controllerArray addObject:twoView];


    // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
    // Example:
    NSDictionary *parameters = @{CAPSPageMenuOptionHideTopMenuBar: @(4.3),
                                 CAPSPageMenuOptionUseMenuLikeSegmentedControl: @(YES),
                                 CAPSPageMenuOptionMenuItemSeparatorPercentageHeight: @(0.1)
                                 };
    
    // Initialize page menu with controller array, frame, and optional parameters
    self.pagemenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 100, self.view.frame.size.width, self.view.frame.size.height - 100) options:parameters];
    _pagemenu.delegate = self;
    // Lastly add page menu as subview of base view controller view
    // or use pageMenu controller in you view hierachy as desired
    [self.view addSubview:_pagemenu.view];
}

// Optional delegate
- (void)willMoveToPage:(UIViewController *)controller index:(NSInteger)index
{
    NSLog(@"willMoveToPage  %lu", index);
    [self.segmentOutlet setSelectedSegmentIndex:index];
}

- (void)didMoveToPage:(UIViewController *)controller index:(NSInteger)index
{
    NSLog(@"didMoveToPage  %lu", index);
}

- (IBAction)segmentActionCall:(id)sender {
    UISegmentedControl *sg = sender;
    NSLog(@"sg.selectedSegmentIndex   %lu", sg.selectedSegmentIndex);
    
    if (sg.selectedSegmentIndex==0)
    {
        NSLog(@"First");
        [self.pagemenu customButtonAction:0];
    }
    else if (sg.selectedSegmentIndex==1)
    {
        NSLog(@"Second");
        [self.pagemenu customButtonAction:1];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
