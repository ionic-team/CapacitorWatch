/// <reference types="@capacitor/cli" />
import type { PluginListenerHandle } from '@capacitor/core';

// const UI_KEY = "watchUI";
// const DATA_KEY = "viewData";
// const COMMAND_KEY = "jsCommand";
// eslint-disable-next-line @typescript-eslint/no-empty-interface
export interface CapWatchPlugin {

    addListener(
        eventName: "runCommand",
        listenerFunc: (command: String) => void,
      ): Promise<PluginListenerHandle> & PluginListenerHandle;


    updateWatchUI(newUI: string): Promise<void>;

    updateWatchData(data: string): Promise<void>;
}