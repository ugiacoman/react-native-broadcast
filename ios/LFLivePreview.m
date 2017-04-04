//
//  LFLivePreview.m
//  LFLiveKit
//
//  Created by 倾慕 on 16/5/2.
//  Copyright © 2016年 live Interactive. All rights reserved.
//

#import "LFLivePreview.h"
#import "UIControl+YYAdd.h"
#import "UIView+YYAdd.h"
#import "LFLiveKit.h"

@interface LFLivePreview ()<LFLiveSessionDelegate>

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) LFLiveDebug *debugInfo;
@property (nonatomic, strong) LFLiveSession *session;
@property (nonatomic, strong) NSString *rtmpURL;
@property (nonatomic, strong) NSString *cameraPosition;

@end

@implementation LFLivePreview {
    BOOL started;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.borderWidth = 3;
        self.layer.borderColor = UIColor.redColor.CGColor;
        
        _session = [[LFLiveSession alloc] initWithAudioConfiguration:[LFLiveAudioConfiguration defaultConfiguration] videoConfiguration:[LFLiveVideoConfiguration defaultConfiguration]];
        self.containerView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
        
        _session.preView = self.containerView;
        _session.delegate = self;
        [self addSubview:self.containerView];
        
        [self.session setRunning:YES];
    }
    return self;
}

#pragma mark -- Getter Setter
- (LFLiveSession*)session {
    if (!_session) {
        _session = [[LFLiveSession alloc] initWithAudioConfiguration:[LFLiveAudioConfiguration defaultConfiguration] videoConfiguration:[LFLiveVideoConfiguration defaultConfiguration]];
        _session.preView = self;
        _session.delegate = self;
    }
    return _session;
}

- (void)setStarted:(BOOL) started {
    if(started){
        LFLiveStreamInfo *stream = [LFLiveStreamInfo new];
        stream.url = _rtmpURL;
        [self.session startLive:stream];
    } else {
        [self.session stopLive];
    }
}

- (void) setRtmpURL:(NSString *)rtmpURL
{
    _rtmpURL=rtmpURL;
}

- (void) setCameraPosition:(NSString *)cameraPosition
{
    if ([cameraPosition isEqualToString:@"front"]) {
        self.session.captureDevicePosition = AVCaptureDevicePositionFront;
    } else if ([cameraPosition isEqualToString:@"back"]) {
        self.session.captureDevicePosition = AVCaptureDevicePositionBack;
    }
    printf("turning nowhere");
    
}





@end

