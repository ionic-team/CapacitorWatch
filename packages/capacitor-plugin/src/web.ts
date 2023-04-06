import { WebPlugin } from '@capacitor/core';

import type { WatchPlugin } from './definitions';

export class WatchWeb extends WebPlugin implements WatchPlugin {
    async setWatchUI(_newUI: string): Promise<void> {
        return Promise.reject("method not implemented on web");
    }

    async updateWatchUI(_newUI: string): Promise<void> {
        return Promise.reject("method not implemented on web");
    }

    async updateWatchData(_data: string): Promise<void> {
        return Promise.reject("method not implemented on web");
    }
}
