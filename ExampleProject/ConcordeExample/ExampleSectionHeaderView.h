#import <Cocoa/Cocoa.h>

#import "TUIKit.h"



@interface ExampleSectionHeaderView : TUITableViewSectionHeader {
  
  TUITextRenderer * _labelRenderer;
  
}

@property (readonly) TUITextRenderer  * labelRenderer;

@end

@interface StickyHeaderView : ExampleSectionHeaderView {

}

@end

@interface StickyFooterView : ExampleSectionHeaderView {
    
}

@end