//
//  KBSTodoListTableViewController.m
//  MyTodoList
//
//  Created by czetsuya on 4/17/14.
//  Copyright (c) 2014 Kalidad Business Solutions. All rights reserved.
//

#import "KBSTodoListTableViewController.h"
#import "KBSTodoItem.h"
#import "KBSTodoItemViewController.h"

@interface KBSTodoListTableViewController ()

@end

@implementation KBSTodoListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadInitialData
{
    KBSTodoItem *item1 = [[KBSTodoItem alloc] init];
    item1.name = @"Buy milk";
    item1.completed = NO;
    [self.todoItems addObject:item1];
    
    KBSTodoItem *item2 = [[KBSTodoItem alloc] init];
    item2.name = @"Play NBA2014";
    item2.completed = NO;
    [self.todoItems addObject:item2];
    
    KBSTodoItem *item3 = [[KBSTodoItem alloc] init];
    item3.name = @"Test iBeacon";
    item3.completed = NO;
    [self.todoItems addObject:item3];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.todoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.todoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoItem" forIndexPath:indexPath];
    
    // Configure the cell...
    KBSTodoItem *item = [self.todoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = item.name;
    
    NSLog(@"%d", item.completed);
    
    if(item.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)unwindToList:(UIStoryboardSegue *) seque
{
    NSLog(@"unwindToList");
    KBSTodoItemViewController *source = [seque sourceViewController];
    KBSTodoItem *item = [source item];
    
    if(item != nil) {
        [self.todoItems addObject:item];
        [self.tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KBSTodoItem *item = [self.todoItems objectAtIndex:indexPath.row];
    [item markAsCompleted];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
