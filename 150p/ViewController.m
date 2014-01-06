//
//  ViewController.m
//  150p
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>{
    NSArray *data;
}
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

//컴포넌트별로 항목개수
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (0 == component) {
        return 10;
    }
    else
        return [data count];
}

// 각컴포넌트와 로우인덱스에 해당하는 문자열항목 반환
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (0 == component) {
        return [NSString stringWithFormat:@"Row : %d", row];
    }
    else{
        return [data objectAtIndex:row];
    }
}


// 사용자 선택시
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *item = [self pickerView:pickerView titleForRow:row forComponent:component];
    self.label.text = [NSString stringWithFormat:@"컴포넌트 %d 로우 %d, 항목: %@", component,row,item];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    data = [[NSArray alloc]initWithObjects:@"item1",@"itme2", @"item3", @"item4", @"item5", nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
