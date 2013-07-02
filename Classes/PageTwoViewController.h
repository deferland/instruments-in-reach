//
// File:	   PageTwoViewController.h
//
// Abstract:   The view controller for page two of this sample.

#import <UIKit/UIKit.h>

@interface PageTwoViewController : UIViewController
{
	UIWebView							*webView;
	NSString							*instrument;	
	NSString							*note;	
	NSString							*clef;	
	CGImageRef							image;
	NSMutableArray						*noteNames;
	UIToolbar							*toolbar;
	NSArray								*pickerViewArray;
	UIBarButtonSystemItem				currentSystemItem;
	UISegmentedControl					*styleSegmentedControl;	
}

@property (nonatomic,retain) UIWebView									*webView;
@property (nonatomic,retain) NSString									*note;
@property (nonatomic,retain) NSString									*instrument;
@property (nonatomic,retain) NSString									*clef;
@property (nonatomic,retain)  NSMutableArray							*noteNames;

- (IBAction)homeButtonPressed:(id)sender;
- (IBAction)aboutButtonPressed:(id)sender;
- (IBAction)setupButtonPressed:(id)sender;
- (void)loadURL:(NSString *)urlToLoad;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil instrument:(NSString *)instrumentString note:(NSString *)noteString;

@end
