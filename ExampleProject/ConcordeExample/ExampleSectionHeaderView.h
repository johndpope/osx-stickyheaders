#import <Cocoa/Cocoa.h>

#import "TUIKit.h"



@interface ExampleSectionHeaderView : TUITableViewSectionHeader {
  
  TUITextRenderer * _labelRenderer;
  
}

@property (readonly) TUITextRenderer  * labelRenderer;

@end

@interface TopHeaderView : ExampleSectionHeaderView {

}

@end

@interface StickyFooterView : ExampleSectionHeaderView {
    
}

@end

@interface StickyNavBarView : ExampleSectionHeaderView {
    
}

@end