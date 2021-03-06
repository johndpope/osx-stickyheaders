#import "ExampleSectionHeaderView.h"




@implementation StickyFooterView
-(id)initWithFrame:(CGRect)frame {
    if((self = [super initWithFrame:frame])) {
        _labelRenderer = [[TUITextRenderer alloc] init];
        TUIImageView *iv = [[TUIImageView alloc]initWithFrame:frame];
        iv.image = [TUIImage imageNamed:@"footer.png"];
        [self addSubview:iv];
        
        
        self.textRenderers = [NSArray arrayWithObjects:_labelRenderer, nil];
        self.opaque = TRUE;
    }
    return self;
}

@end

@implementation TopHeaderView
-(id)initWithFrame:(CGRect)frame {
    if((self = [super initWithFrame:frame])) {
        _labelRenderer = [[TUITextRenderer alloc] init];
        TUIImageView *iv = [[TUIImageView alloc]initWithFrame:frame];
        iv.image = [TUIImage imageNamed:@"top.png"];
        [self addSubview:iv];
        
        
        self.textRenderers = [NSArray arrayWithObjects:_labelRenderer, nil];
        self.opaque = TRUE;
    }
    return self;
}


@end

@implementation StickyNavBarView
-(id)initWithFrame:(CGRect)frame {
    if((self = [super initWithFrame:frame])) {
        _labelRenderer = [[TUITextRenderer alloc] init];
        TUIImageView *iv = [[TUIImageView alloc]initWithFrame:frame];
        iv.image = [TUIImage imageNamed:@"navbar.png"];
        [self addSubview:iv];
        
        
        self.textRenderers = [NSArray arrayWithObjects:_labelRenderer, nil];
        self.opaque = TRUE;
    }
    return self;
}


@end


@implementation ExampleSectionHeaderView

@synthesize labelRenderer = _labelRenderer;

/**
 * Clean up
 */

/**
 * Initialize
 */
-(id)initWithFrame:(CGRect)frame {
    if((self = [super initWithFrame:frame])) {
        _labelRenderer = [[TUITextRenderer alloc] init];
        TUIImageView *iv = [[TUIImageView alloc]initWithFrame:frame];
        iv.image = [TUIImage imageNamed:@"banner.png"];
        [self addSubview:iv];
        
        
        self.textRenderers = [NSArray arrayWithObjects:_labelRenderer, nil];
        self.opaque = TRUE;
    }
    return self;
}

/**
 * @brief The header will become pinned
 */
-(void)headerWillBecomePinned {
    self.opaque = FALSE;
    [super headerWillBecomePinned];
}

/**
 * @brief The header will become unpinned
 */
-(void)headerWillBecomeUnpinned {
    self.opaque = TRUE;
    [super headerWillBecomeUnpinned];
}

/**
 * Drawing
 */
-(void)drawRect:(CGRect)rect {
    
    CGContextRef g;
    if((g = TUIGraphicsGetCurrentContext()) != nil) {
        [NSGraphicsContext setCurrentContext:[NSGraphicsContext graphicsContextWithGraphicsPort:g flipped:FALSE]];
        
        if(!self.pinnedToViewport) {
            [[NSColor whiteColor] set];
            NSRectFill(self.bounds);
        }
        
        NSColor *start = [NSColor colorWithCalibratedRed:0.8 green:0.8 blue:0.8 alpha:0.9];
        NSColor *end = [NSColor colorWithCalibratedRed:0.9 green:0.9 blue:0.9 alpha:0.9];
        NSGradient *gradient = nil;
        
        gradient = [[NSGradient alloc] initWithStartingColor:start endingColor:end];
        [gradient drawInRect:self.bounds angle:90];
        
        [[start shadowWithLevel:0.1] set];
        NSRectFill(NSMakeRect(0, 0, self.bounds.size.width, 1));
        
        CGFloat labelHeight = 18;
        self.labelRenderer.frame = CGRectMake(15, roundf((self.bounds.size.height - labelHeight) / 2.0), self.bounds.size.width - 30, labelHeight);
        [self.labelRenderer draw];
        
    }
    
}

@end
