import { WebPlugin } from '@capacitor/core';

import type { CapWatchPlugin } from './definitions';

export class CapWatchWeb extends WebPlugin implements CapWatchPlugin {
    async updateWatchUI(newUI: string): Promise<void> {
        return Promise.reject("method not implemented on web");
    }

    async updateWatchData(data: string): Promise<void> {
        return Promise.reject("method not implemented on web");
    }
}


