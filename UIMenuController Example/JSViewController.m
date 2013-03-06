//
//  JSViewController.m
//  UIMenuController Example
//
//  Copyright (c) 2011 John Szumski. All rights reserved.
//

#import "JSViewController.h"
#import "JSTableViewCell.h"

@implementation JSViewController {
	NSArray *data;
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
	
    if (self) {
        data = [NSArray arrayWithObjects:@"Bob Smith", @"Jane Doe", @"Billy McDonald", nil];
    }
	
    return self;
}

- (BOOL)canBecomeFirstResponder {
	return YES;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    JSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil) {
        cell = [[JSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	
	cell.textLabel.text = [data objectAtIndex:indexPath.row];
	
	UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
	[cell addGestureRecognizer:recognizer];
        
    return cell;
}


#pragma mark - Menu controller

- (void)longPress:(UILongPressGestureRecognizer *)recognizer {	
	if (recognizer.state == UIGestureRecognizerStateBegan) {
		JSTableViewCell *cell = (JSTableViewCell *)recognizer.view;
		
        UIMenuItem *flag = [[UIMenuItem alloc] initWithTitle:@"Flag" action:@selector(flag:)];
        UIMenuItem *approve = [[UIMenuItem alloc] initWithTitle:@"Approve" action:@selector(approve:)];
		UIMenuItem *deny = [[UIMenuItem alloc] initWithTitle:@"Deny" action:@selector(deny:)];

        UIMenuController *menu = [UIMenuController sharedMenuController];
		[menu setMenuItems:[NSArray arrayWithObjects:flag, approve, deny, nil]];
		[menu setTargetRect:cell.frame inView:cell.superview];
        [menu setMenuVisible:YES animated:YES];
	}
}

- (void)flag:(id)sender {
	NSLog(@"Cell was flagged");
}

- (void)approve:(id)sender {
	NSLog(@"Cell was approved");
}

- (void)deny:(id)sender {
	NSLog(@"Cell was denied");
}

@end