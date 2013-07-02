//
// File:	   PageOneViewController.h
//
// Abstract:   The view controller for page one of this sample.
//
//  Created by jrtb on 9/08/08.
//  Copyright 2008 jrtb. All rights reserved.

#import <UIKit/UIKit.h>
#import "NotesView.h"

@interface PageOneViewController : UIViewController <UIApplicationDelegate, notesDelegate, UIScrollViewDelegate>
{
	UIScrollView						*scrollView;
	NotesView							*notesView;
	UIView								*myView;
	UIView								*myView2;
	UIView								*myView3;
	UIActivityIndicatorView				*progressView;
	NSString							*instrument;	
	NSString							*note;	
	NSString							*clef;	
	CGImageRef							image;
	UIToolbar							*toolbar;
	NSArray								*pickerViewArray;
	UIBarButtonSystemItem				currentSystemItem;
	UISegmentedControl					*styleSegmentedControl;
}

@property (nonatomic,retain) UIScrollView								*scrollView;
@property (nonatomic,retain) NotesView									*notesView;
@property (nonatomic,retain) UIView										*myView;
@property (nonatomic,retain) UIView										*myView2;
@property (nonatomic,retain) UIView										*myView3;
@property (nonatomic,retain) NSString									*instrument;
@property (nonatomic,retain) NSString									*note;
@property (nonatomic,retain) NSString									*clef;
@property (nonatomic,retain) UIActivityIndicatorView					*progressView;

- (IBAction)homeButtonPressed:(id)sender;
- (IBAction)aboutButtonPressed:(id)sender;
- (IBAction)setupButtonPressed:(id)sender;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil instrument:(NSString *)instrumentString;
- (void) initNotes;
- (void) releaseNotes;

@end
