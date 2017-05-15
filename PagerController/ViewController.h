//
//  ViewController.h
//  PagerController
//
//  Created by Rana on 11/28/16.
//  Copyright © 2016 Rana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAPSPageMenu.h"

@interface ViewController : UIViewController<CAPSPageMenuDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentOutlet;
@property (nonatomic) CAPSPageMenu *pagemenu;

- (IBAction)segmentActionCall:(id)sender;

@end

