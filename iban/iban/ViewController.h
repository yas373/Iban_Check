//
//  ViewController.h
//  iban
//
//  Created by Yasin Turpcu on 25.05.2019.
//  Copyright © 2019 Yasin Turpcu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ibanText;
@property (weak, nonatomic) IBOutlet UITextField *ibanHeaderText;
- (IBAction)changeValue:(id)sender;

- (IBAction)finishedTextEdit:(id)sender;

@end

