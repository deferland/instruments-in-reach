//
// File:	   MainViewController.h
//
// Abstract:   The application's main view controller (front page).

#import <UIKit/UIKit.h>

@class PageSixViewController;

@interface MainViewController : UIViewController <	UINavigationBarDelegate,
													UITableViewDelegate, UITableViewDataSource,
													UIActionSheetDelegate>
{
	IBOutlet UITableView				*myTableView;
	NSMutableArray						*menuList;
	
	PageSixViewController				*modalViewController;
}

@property (nonatomic, retain) NSMutableArray							*menuList;
@property (nonatomic, retain) UITableView								*myTableView;

@end
