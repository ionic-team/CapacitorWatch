import { registerPlugin } from '@capacitor/core';

import type { WatchPlugin } from './definitions';

const Watch = registerPlugin<WatchPlugin>('WatchPlugin', {
  web: () => import('./web').then(m => new m.WatchWeb()),
});

export * from './definitions';
export { Watch };
