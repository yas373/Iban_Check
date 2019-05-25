//
//  ViewController.m
//  iban
//
//  Created by Yasin Turpcu on 25.05.2019.
//  Copyright © 2019 Yasin Turpcu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (IBAction)changeValue:(id)sender {
    _ibanText.text = [_ibanText.text uppercaseString];
    NSMutableCharacterSet *characterSet = [NSMutableCharacterSet symbolCharacterSet];
    [characterSet formUnionWithCharacterSet:[NSCharacterSet letterCharacterSet]];
    [characterSet formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
    [characterSet formUnionWithCharacterSet:[NSCharacterSet whitespaceCharacterSet]];
    NSArray *ibanArray = [_ibanText.text componentsSeparatedByCharactersInSet:characterSet];
    NSString *iban = [ibanArray componentsJoinedByString:@""];
    if (![iban isEqualToString:@""]) {
        if ([_ibanText.text containsString:@"TR"]) {
            NSString *afterTR = [[_ibanText.text componentsSeparatedByString:@"TR"] objectAtIndex:1];
            NSArray *ibanArray = [afterTR componentsSeparatedByCharactersInSet:characterSet];
            NSString *iban = [ibanArray componentsJoinedByString:@""];
            _ibanText.text = iban;
            _ibanHeaderText.text = @"TR";
        }
        else
        {
            _ibanText.text = iban;
        }
        if ([_ibanText.text length]>24) {
            _ibanText.text = [_ibanText.text substringWithRange:NSMakeRange(0, 24)];
        }
    }
    else{
        _ibanText.text = @"";
    }
}

- (IBAction)finishedTextEdit:(id)sender {
    if([_ibanText.text length]<24)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Uyarı" message:@"İban numarası olması gerektiğinden kısa" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Tamam" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
@end
