// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v18.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "./include/video_player_avfoundation/messages.g.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}

static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface FVPCreationOptions ()
+ (FVPCreationOptions *)fromList:(NSArray *)list;
+ (nullable FVPCreationOptions *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FVPMixWithOthersMessage ()
+ (FVPMixWithOthersMessage *)fromList:(NSArray *)list;
+ (nullable FVPMixWithOthersMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FVPSetMaxResolutionMessage ()
+ (FVPSetMaxResolutionMessage *)fromList:(NSArray *)list;
+ (nullable FVPSetMaxResolutionMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FVPSetBufferWindowMessage ()
+ (FVPSetBufferWindowMessage *)fromList:(NSArray *)list;
+ (nullable FVPSetBufferWindowMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation FVPCreationOptions
+ (instancetype)makeWithAsset:(nullable NSString *)asset
    uri:(nullable NSString *)uri
    packageName:(nullable NSString *)packageName
    formatHint:(nullable NSString *)formatHint
    httpHeaders:(NSDictionary<NSString *, NSString *> *)httpHeaders {
  FVPCreationOptions* pigeonResult = [[FVPCreationOptions alloc] init];
  pigeonResult.asset = asset;
  pigeonResult.uri = uri;
  pigeonResult.packageName = packageName;
  pigeonResult.formatHint = formatHint;
  pigeonResult.httpHeaders = httpHeaders;
  return pigeonResult;
}
+ (FVPCreationOptions *)fromList:(NSArray *)list {
  FVPCreationOptions *pigeonResult = [[FVPCreationOptions alloc] init];
  pigeonResult.asset = GetNullableObjectAtIndex(list, 0);
  pigeonResult.uri = GetNullableObjectAtIndex(list, 1);
  pigeonResult.packageName = GetNullableObjectAtIndex(list, 2);
  pigeonResult.formatHint = GetNullableObjectAtIndex(list, 3);
  pigeonResult.httpHeaders = GetNullableObjectAtIndex(list, 4);
  return pigeonResult;
}
+ (nullable FVPCreationOptions *)nullableFromList:(NSArray *)list {
  return (list) ? [FVPCreationOptions fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    self.asset ?: [NSNull null],
    self.uri ?: [NSNull null],
    self.packageName ?: [NSNull null],
    self.formatHint ?: [NSNull null],
    self.httpHeaders ?: [NSNull null],
  ];
}
@end

@implementation FVPMixWithOthersMessage
+ (instancetype)makeWithMixWithOthers:(BOOL )mixWithOthers {
  FVPMixWithOthersMessage* pigeonResult = [[FVPMixWithOthersMessage alloc] init];
  pigeonResult.mixWithOthers = mixWithOthers;
  return pigeonResult;
}
+ (FVPMixWithOthersMessage *)fromList:(NSArray *)list {
  FVPMixWithOthersMessage *pigeonResult = [[FVPMixWithOthersMessage alloc] init];
  pigeonResult.mixWithOthers = [GetNullableObjectAtIndex(list, 0) boolValue];
  return pigeonResult;
}
+ (nullable FVPMixWithOthersMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [FVPMixWithOthersMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.mixWithOthers),
  ];
}
@end

@implementation FVPSetMaxResolutionMessage
+ (instancetype)makeWithTextureId:(NSInteger )textureId
    width:(NSInteger )width
    height:(NSInteger )height {
  FVPSetMaxResolutionMessage* pigeonResult = [[FVPSetMaxResolutionMessage alloc] init];
  pigeonResult.textureId = textureId;
  pigeonResult.width = width;
  pigeonResult.height = height;
  return pigeonResult;
}
+ (FVPSetMaxResolutionMessage *)fromList:(NSArray *)list {
  FVPSetMaxResolutionMessage *pigeonResult = [[FVPSetMaxResolutionMessage alloc] init];
  pigeonResult.textureId = [GetNullableObjectAtIndex(list, 0) integerValue];
  pigeonResult.width = [GetNullableObjectAtIndex(list, 1) integerValue];
  pigeonResult.height = [GetNullableObjectAtIndex(list, 2) integerValue];
  return pigeonResult;
}
+ (nullable FVPSetMaxResolutionMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [FVPSetMaxResolutionMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.textureId),
    @(self.width),
    @(self.height),
  ];
}
@end

@implementation FVPSetBufferWindowMessage
+ (instancetype)makeWithTextureId:(NSInteger )textureId
    seconds:(NSInteger )seconds {
  FVPSetBufferWindowMessage* pigeonResult = [[FVPSetBufferWindowMessage alloc] init];
  pigeonResult.textureId = textureId;
  pigeonResult.seconds = seconds;
  return pigeonResult;
}
+ (FVPSetBufferWindowMessage *)fromList:(NSArray *)list {
  FVPSetBufferWindowMessage *pigeonResult = [[FVPSetBufferWindowMessage alloc] init];
  pigeonResult.textureId = [GetNullableObjectAtIndex(list, 0) integerValue];
  pigeonResult.seconds = [GetNullableObjectAtIndex(list, 1) integerValue];
  return pigeonResult;
}
+ (nullable FVPSetBufferWindowMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [FVPSetBufferWindowMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.textureId),
    @(self.seconds),
  ];
}
@end

@interface FVPAVFoundationVideoPlayerApiCodecReader : FlutterStandardReader
@end
@implementation FVPAVFoundationVideoPlayerApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [FVPCreationOptions fromList:[self readValue]];
    case 129: 
      return [FVPMixWithOthersMessage fromList:[self readValue]];
    case 130: 
      return [FVPSetBufferWindowMessage fromList:[self readValue]];
    case 131: 
      return [FVPSetMaxResolutionMessage fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface FVPAVFoundationVideoPlayerApiCodecWriter : FlutterStandardWriter
@end
@implementation FVPAVFoundationVideoPlayerApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[FVPCreationOptions class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FVPMixWithOthersMessage class]]) {
    [self writeByte:129];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FVPSetBufferWindowMessage class]]) {
    [self writeByte:130];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FVPSetMaxResolutionMessage class]]) {
    [self writeByte:131];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface FVPAVFoundationVideoPlayerApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FVPAVFoundationVideoPlayerApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FVPAVFoundationVideoPlayerApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FVPAVFoundationVideoPlayerApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FVPAVFoundationVideoPlayerApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    FVPAVFoundationVideoPlayerApiCodecReaderWriter *readerWriter = [[FVPAVFoundationVideoPlayerApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void SetUpFVPAVFoundationVideoPlayerApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FVPAVFoundationVideoPlayerApi> *api) {
  SetUpFVPAVFoundationVideoPlayerApiWithSuffix(binaryMessenger, api, @"");
}

void SetUpFVPAVFoundationVideoPlayerApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FVPAVFoundationVideoPlayerApi> *api, NSString *messageChannelSuffix) {
  messageChannelSuffix = messageChannelSuffix.length > 0 ? [NSString stringWithFormat: @".%@", messageChannelSuffix] : @"";
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.initialize", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(initialize:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(initialize:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        [api initialize:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.create", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(createWithOptions:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(createWithOptions:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPCreationOptions *arg_creationOptions = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        NSNumber *output = [api createWithOptions:arg_creationOptions error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.dispose", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(disposePlayer:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(disposePlayer:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSInteger arg_textureId = [GetNullableObjectAtIndex(args, 0) integerValue];
        FlutterError *error;
        [api disposePlayer:arg_textureId error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.setLooping", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setLooping:forPlayer:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(setLooping:forPlayer:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        BOOL arg_isLooping = [GetNullableObjectAtIndex(args, 0) boolValue];
        NSInteger arg_textureId = [GetNullableObjectAtIndex(args, 1) integerValue];
        FlutterError *error;
        [api setLooping:arg_isLooping forPlayer:arg_textureId error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.setVolume", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setVolume:forPlayer:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(setVolume:forPlayer:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        double arg_volume = [GetNullableObjectAtIndex(args, 0) doubleValue];
        NSInteger arg_textureId = [GetNullableObjectAtIndex(args, 1) integerValue];
        FlutterError *error;
        [api setVolume:arg_volume forPlayer:arg_textureId error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.setPlaybackSpeed", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setPlaybackSpeed:forPlayer:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(setPlaybackSpeed:forPlayer:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        double arg_speed = [GetNullableObjectAtIndex(args, 0) doubleValue];
        NSInteger arg_textureId = [GetNullableObjectAtIndex(args, 1) integerValue];
        FlutterError *error;
        [api setPlaybackSpeed:arg_speed forPlayer:arg_textureId error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.play", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(playPlayer:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(playPlayer:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSInteger arg_textureId = [GetNullableObjectAtIndex(args, 0) integerValue];
        FlutterError *error;
        [api playPlayer:arg_textureId error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.getPosition", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(positionForPlayer:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(positionForPlayer:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSInteger arg_textureId = [GetNullableObjectAtIndex(args, 0) integerValue];
        FlutterError *error;
        NSNumber *output = [api positionForPlayer:arg_textureId error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.seekTo", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(seekTo:forPlayer:completion:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(seekTo:forPlayer:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSInteger arg_position = [GetNullableObjectAtIndex(args, 0) integerValue];
        NSInteger arg_textureId = [GetNullableObjectAtIndex(args, 1) integerValue];
        [api seekTo:arg_position forPlayer:arg_textureId completion:^(FlutterError *_Nullable error) {
          callback(wrapResult(nil, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.pause", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(pausePlayer:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(pausePlayer:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSInteger arg_textureId = [GetNullableObjectAtIndex(args, 0) integerValue];
        FlutterError *error;
        [api pausePlayer:arg_textureId error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.setMixWithOthers", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setMixWithOthers:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(setMixWithOthers:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPMixWithOthersMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api setMixWithOthers:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.setMaxResolution", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setMaxResolution:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(setMaxResolution:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPSetMaxResolutionMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api setMaxResolution:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.video_player_avfoundation.AVFoundationVideoPlayerApi.setBufferWindow", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FVPAVFoundationVideoPlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setBufferWindow:error:)], @"FVPAVFoundationVideoPlayerApi api (%@) doesn't respond to @selector(setBufferWindow:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FVPSetBufferWindowMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api setBufferWindow:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}