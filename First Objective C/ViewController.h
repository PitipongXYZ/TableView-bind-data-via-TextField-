//
//  ViewController.h
//  First Objective C
//
//  Created by Manao on 6/30/16.
//  Copyright © 2016 Pitipong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

{
    NSMutableArray *myData;
}

//@property (weak, nonatomic) IBOutlet UILabel *tvTitle;
@property (weak, nonatomic) IBOutlet UITextField *edt;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

