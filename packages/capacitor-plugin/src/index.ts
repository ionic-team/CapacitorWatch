import { registerPlugin } from '@capacitor/core';

import type { CapWatchPlugin } from './definitions';

const CapWatchImpl = registerPlugin<CapWatchPlugin>('CapWatchPlugin', {
  web: () => import('./web').then(m => new m.CapWatchWeb()),
});

export class CapWatch {
  
}

export * from './definitions';
export { CapWatchImpl };