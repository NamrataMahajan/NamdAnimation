//
//  ViewController.m
//  NamdAnimation
//
//  Created by Namrata on 10/10/16.
//  Copyright © 2016 Namrata Mahajan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    heightOfScreen = [[UIScreen mainScreen]bounds].size.height;
    
    widthOfScreen = [[UIScreen mainScreen]bounds].size.width;
    
    
    UIPanGestureRecognizer *panGesture =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    
    self.ball1.userInteractionEnabled = YES;
    
    [self.ball1 addGestureRecognizer:panGesture];
    
    
}

-(void)handlePan:(UIPanGestureRecognizer *)gesture {
    
    CGRect originalFrame;
    
    if ([gesture isKindOfClass:[UIPanGestureRecognizer class]]) {
        
        
        if (gesture.state == UIGestureRecognizerStateBegan) {
            NSLog(@"State Began");
            originalFrame = gesture.view.frame;
            
        }
        else if (gesture.state == UIGestureRecognizerStateChanged) {
            
            
            CGPoint delta = [gesture locationInView:self.view];
            
            gesture.view.center = delta;
            
        }
        else if (gesture.state == UIGestureRecognizerStateEnded) {
            
            
        }
        
        
    }
    else {
        NSLog(@"Pan Gesture Not Detected");
        
    }
    
    //    CGPoint changeInCenter = [gesture translationInView:self.view];
    
    
    
    
    //    gesture.view.center = CGPointMake(newXCenter, newYCenter);
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ActionZoomIn:(id)sender {
    [self animateZoomWithSize:100];
}

- (IBAction)ActionZoomOut:(id)sender {
    [self animateZoomWithSize:-100];
}

- (IBAction)ActionDirection:(id)sender {
    
    UIButton *button = sender;
    
    
    if (button.tag == 101) {
        //up direction
        
        [self animateUp];
    }
    else if (button.tag == 106) {
        [self animateDownWithDuration:0.5 delay:0.1];
    }
    
    
}

-(void)animateDownWithDuration:(NSTimeInterval)time
                         delay:(NSTimeInterval)delayTime {
    
    
    [UIView animateWithDuration:time delay:delayTime options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        [self.ball1 setFrame:CGRectMake(self.ball1.frame.origin.x, self.ball1.frame.origin.y + 100, self.ball1.frame.size.width, self.ball1.frame.size.height)];
        
        
    } completion:^(BOOL finished) {
        if (finished) {
            NSLog(@"Down Animation Finished");
        }
    }];
}


-(void)animateUp {
    
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        [self.ball1 setFrame:CGRectMake(self.ball1.frame.origin.x, self.ball1.frame.origin.y - 100, self.ball1.frame.size.width, self.ball1.frame.size.height)];
        
        
    } completion:^(BOOL finished) {
        if (finished) {
            NSLog(@"Up Animation Finished");
        }
    }];
    
    
}


-(void)animateZoomWithScale:(CGFloat) scale {
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.ball1.transform = CGAffineTransformMakeScale(scale, scale);
        
        
        
    } completion:^(BOOL finished) {
        if (finished) {
            NSLog(@"Up Animation Finished");
        }
    }];
    
}


-(void)animateZoomWithSize:(CGFloat) size {
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        
        [self.ball1 setFrame:CGRectMake(self.ball1.frame.origin.x, self.ball1.frame.origin.y, self.ball1.frame.size.width + size, self.ball1.frame.size.height + size)];
        
        
    } completion:^(BOOL finished) {
        if (finished) {
            NSLog(@"Up Animation Finished");
        }
    }];
    
}

@end
