//
//  NotesView.h
//  instruments-in-reach-v2
//
//  Created by jrtb on 10/8/08.
//  Copyright 2008 jrtb. All rights reserved.
//

// this class overrides a uiwebview for the purpose of tracking and intercepting touches with the goal of eliminating vertical scrolling

@protocol notesDelegate
- (void) selectedNote:(NSString *)noteString instrument:(NSString *)instrumentString;
@end

@interface NotesView : UIView { 

@protected
	id <NSObject, notesDelegate> delegate;
	BOOL				drawn;
	NSString			*instrument;	
	NSString			*clef;	
	CGPoint				firstTouch;
	CGPoint				lastTouch;
	int					startingNote;
	int					currentNote;
	int					instrument_min;
	int					instrument_max;
	int					currentX;
	NSMutableArray		*noteNames;
	NSMutableArray		*notes;
	BOOL				touchesMoved;
	BOOL				touchesStarted;
	BOOL				touchesEnded;
	UIView				*noteCView;
	UIImageView			*noteC;
	
}

@property (retain)			  id <NSObject, notesDelegate>		delegate;
@property					  BOOL								drawn;
@property (nonatomic,retain)  NSString							*instrument;
@property (nonatomic,retain)  NSString							*clef;
@property					  CGPoint							firstTouch;
@property					  CGPoint							lastTouch;
@property					  int								startingNote;
@property					  int								currentNote;
@property					  int								instrument_min;
@property					  int								instrument_max;
@property					  int								currentX;
@property (nonatomic,retain)  NSMutableArray					*noteNames;
@property (nonatomic,retain)  NSMutableArray					*notes;
@property					  BOOL								touchesMoved;
@property					  BOOL								touchesStarted;
@property					  BOOL								touchesEnded;
@property (nonatomic,retain)  UIView							*noteCView;
@property (nonatomic,retain)  UIImageView						*noteC;

- (void)initNotes;
//- (void)updateNotes;
- (void)drawNotes;
- (void)handleTimer;

@end
