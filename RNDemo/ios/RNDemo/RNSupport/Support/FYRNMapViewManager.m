//
//  FYRNMapViewManager.m
//  RNDemo
//
//  Created by linbing on 2019/1/25.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "FYRNMapViewManager.h"
#import <MapKit/MapKit.h>
#import "RCTConvert+MapKit.h"
#import <React/RCTUIManager.h>

@interface MapView : MKMapView
@property (nonatomic, copy) RCTBubblingEventBlock onRegionChange;
@end
@implementation MapView
@end

@interface MapAnnotation : NSObject<MKAnnotation>
@property(nonatomic) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;
@end
@implementation MapAnnotation
@end


@interface FYRNMapViewManager() <MKMapViewDelegate>
@property (nonatomic, strong) MapView *mapView;
@end

@implementation FYRNMapViewManager

RCT_EXPORT_MODULE(MapViewManager)

- (UIView *)view
{
  MapView *mapView = [[MapView alloc] init];
  mapView.delegate = self;
  _mapView = mapView;
  return mapView;
}

// 导出已有属性
RCT_EXPORT_VIEW_PROPERTY(zoomEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onRegionChange, RCTBubblingEventBlock)
// 导出自定义属性
RCT_CUSTOM_VIEW_PROPERTY(region, MKCoordinateRegion, MKMapView)
{
  [view setRegion:json ? [RCTConvert MKCoordinateRegion:json] : defaultView.region animated:YES];
}

/*
// 生成属性type keypath获取函数
+ (NSArray<NSString *> *)propConfig_zoomEnabled {
  return @[@"BOOL"];
}
+ (NSArray<NSString *> *)propConfig_onRegionChange {
  return @[@"RCTBubblingEventBlock"];
}

// 生成属性type keypath获取函数；属性设置函数
+ (NSArray<NSString *> *)propConfig_region {
  return @[@"MKCoordinateRegion", @"__custom__"];
}
- (void)set_region:(id)json forView:(MKMapView *)view withDefaultView:(MKMapView *)defaultView
{
  [view setRegion:json ? [RCTConvert MKCoordinateRegion:json] : defaultView.region animated:YES];
}
*/



// 导出函数
RCT_EXPORT_METHOD(addAnnotation:(NSNumber *)reactTag annotation:(NSDictionary *)annotation)
{
  [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, MapView *> *viewRegistry) {
    MapView *view = viewRegistry[reactTag];
    if (![view isKindOfClass:[MapView class]]) {
      RCTLogError(@"Invalid view returned from registry, expecting RCTWebView, got: %@", view);
    } else {
      NSNumber *latitude = annotation[@"latitude"];
      NSNumber *longitude = annotation[@"longitude"];
      NSString *title = annotation[@"title"];
      MapAnnotation *mapAnnotation = [MapAnnotation new];
      mapAnnotation.coordinate = CLLocationCoordinate2DMake(latitude.floatValue, longitude.floatValue);
      mapAnnotation.title = title;
      [view addAnnotation:mapAnnotation];
    }
  }];
}


#pragma mark - MKMapViewDelegate
- (void)mapView:(MapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
  if (mapView.onRegionChange)
  {
    MKCoordinateRegion region = mapView.region;
    NSDictionary *body = @{
                           @"region": @{
                               @"latitude": @(region.center.latitude),
                               @"longitude": @(region.center.longitude),
                               @"latitudeDelta": @(region.span.latitudeDelta),
                               @"longitudeDelta": @(region.span.longitudeDelta),
                               }
                           };
    mapView.onRegionChange(body);
  }
}

@end
