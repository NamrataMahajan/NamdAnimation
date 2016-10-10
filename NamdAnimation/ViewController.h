//
//  ViewController.h
//  NamdAnimation
//
//  Created by Namrata on 10/10/16.
//  Copyright © 2016 Namrata Mahajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *ball1;

- (IBAction)ActionZoomIn:(id)sender;
- (IBAction)ActionZoomOut:(id)sender;
- (IBAction)ActionDirection:(id)sender;

@end

