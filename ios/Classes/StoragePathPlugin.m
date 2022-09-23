#import "StoragePathPlugin.h"
#import <flutter_storage_path/flutter_storage_path-Swift.h>

@implementation StoragePathPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftStoragePathPlugin registerWithRegistrar:registrar];
}
@end
