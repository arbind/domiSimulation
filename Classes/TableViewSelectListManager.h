//
//  TableViewSelectListManager.h
//  domiSimulation-IPAD
//
//  Created by Arb on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TableViewSelectListManagerDelegate <NSObject>
@optional
-(void) itemWasSelected:(id)item;
-(void) itemWasUnSelected:(id)item;

@optional
-(UITableViewCell *)cellForRow;
@end


@interface TableViewSelectListManager : NSObject  <UITableViewDelegate, UITableViewDataSource> {
	NSString *sectionHeader;
	UITableView *uiTableView;
	
	SEL keySelector;
	NSMutableArray *list;
	NSMutableDictionary *selections;
	
	id <TableViewSelectListManagerDelegate> delegate;
	BOOL multiSelectable;
}

@property (assign, getter=isMultiSelectable) BOOL multiSelectable;
@property (nonatomic, retain) NSString *sectionHeader;
@property (nonatomic, readonly) UITableView *uiTableView;
@property (nonatomic, readonly) NSArray *selectedItems;
@property (nonatomic, retain) id <TableViewSelectListManagerDelegate> delegate;

-(id)initWithTable:(UITableView *)t keySelector:(SEL)selector andDelegate:(id<TableViewSelectListManagerDelegate>)d;

-(void)populateList:(NSArray *)replacementList;

@end
