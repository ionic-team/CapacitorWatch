import { registerPlugin } from '@capacitor/core';

import type { CapWatchPlugin } from './definitions';

const CapWatch = registerPlugin<CapWatchPlugin>('CapWatchPlugin', {
  web: () => import('./web').then(m => new m.CapWatchWeb()),
});

export * from './definitions';
export { CapWatch };
