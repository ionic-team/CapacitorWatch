#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(WatchPlugin, "Watch",
   CAP_PLUGIN_METHOD(setWatchUI, CAPPluginReturnPromise);
   CAP_PLUGIN_METHOD(updateWatchUI, CAPPluginReturnPromise);
   CAP_PLUGIN_METHOD(updateWatchData, CAPPluginReturnPromise);
);
