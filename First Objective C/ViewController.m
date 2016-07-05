//
//  ViewController.m
//  First Objective C
//
//  Created by Manao on 6/30/16.
//  Copyright © 2016 Pitipong. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

//- (IBAction)btnClear:(id)sender {
//    [_edt resignFirstResponder];
//    [_tvTitle setText:[NSString stringWithFormat:@"Hello"]];
//    [_edt setText:[NSString stringWithFormat:@""]];
//}

- (IBAction)btnSet:(id)sender {
    
    [_edt resignFirstResponder];
//  [_tvTitle setText:[NSString stringWithFormat:@"%@" , [_edt text]]];
    
    // Check to see if it's NOT blank
    if(![_edt.text isEqualToString:@""]) {
        // There's text in the box.
       [myData addObject:_edt.text];
       self.tableView.reloadData;
       [_edt setText:[NSString stringWithFormat:@""]];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]
                            initWithTitle:@"TextField is empty"
                            message:@"You must be input text into TextField."
                            delegate:nil
                            cancelButtonTitle:@"OK"
                            otherButtonTitles:nil];
        [alert show];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    myData = [[NSMutableArray alloc]initWithObjects:@"Pitipong watawut",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return [myData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *stringForCell;
//    if (indexPath.section == 0) {
        stringForCell= [myData objectAtIndex:indexPath.row];
        
//    }
//    else if (indexPath.section == 1){
//        stringForCell= [myData objectAtIndex:indexPath.row+ [myData count]/2];
//        
//    }
    [cell.textLabel setText:stringForCell];
    return cell;
}

#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Section:%d Row:%d selected and its data is %@",
          indexPath.section,indexPath.row,cell.textLabel.text);
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (myData.count != 0) {
        // Remove the row from data model
        [myData removeObjectAtIndex:indexPath.row];
        self.tableView.reloadData;
    }
}

// Default is 1 if not implemented
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 2;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
//(NSInteger)section{
//    NSString *headerTitle;
//    if (section==0) {
//        headerTitle = @"Section 1 Header";
//    }
//    else{
//        headerTitle = @"Section 2 Header";
//        
//    }
//    return headerTitle;
//}
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:
//(NSInteger)section{
//    NSString *footerTitle;
//    if (section==0) {
//        footerTitle = @"Section 1 Footer";
//    }
//    else{
//        footerTitle = @"Section 2 Footer";
//        
//    }
//    return footerTitle;
//}
//

@end
