/// <reference types="@capacitor/cli" />
import type { PluginListenerHandle } from '@capacitor/core';

// eslint-disable-next-line @typescript-eslint/no-empty-interface
export interface WatchPlugin {

    addListener(
        eventName: "runCommand",
        listenerFunc: (data: {"command": string}) => void,
      ): Promise<PluginListenerHandle> & PluginListenerHandle;

    updateWatchUI(options: {watchUI: string}): Promise<void>;

    updateWatchData(options: {data: {[key: string]: string}}): Promise<void>;
}
