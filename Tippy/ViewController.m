//
//  ViewController.m
//  Tippy
//
//  Created by Keylonnie Miller on 6/26/18.
//  Copyright © 2018 Keylonnie Miller. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *splitLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *groupNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tipLabel setHidden:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");

    //self.view.endEditing(YES);
    [self.view endEditing:YES];
}


- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.10),@(0.15),@(0.20)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex]doubleValue];
    
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f",tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
    [self.tipLabel setHidden:NO];
    [UIView animateWithDuration:0.2 animations:^{
        self.tipLabel.alpha = 1;
    }];
    
    
    NSArray *group = @[@(1.0),@(2.0),@(3.0),@(4.0),@(5.0)];
    
    double people = [group[self.groupNumber.selectedSegmentIndex]doubleValue];
    
    
    double totalSplit = total/people;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f",tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
     self.splitLabel.text = [NSString stringWithFormat:@"$%.2f", totalSplit];
}


- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0 animations:^{
        self.tipLabel.alpha = 0;
    }];
}


- (IBAction)onEditingEnd:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.tipLabel.alpha = 0;
    }];
}

@end
