/// <reference types="@capacitor/cli" />
import type { PluginListenerHandle } from '@capacitor/core';

// eslint-disable-next-line @typescript-eslint/no-empty-interface
export interface WatchPlugin {
  /**
   * Listen for a command from the watch
   */
  addListener(
    eventName: 'runCommand',
    listenerFunc: (data: { command: string }) => void,
  ): Promise<PluginListenerHandle> & PluginListenerHandle;

  /**
   * Replaces the current watch UI with watchUI
   */
  updateWatchUI(options: { watchUI: string }): Promise<void>;

  /**
   * Updates the watch's state data
   */
  updateWatchData(options: { data: { [key: string]: string } }): Promise<void>;
}
