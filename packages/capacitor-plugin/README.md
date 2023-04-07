# @ionic-enterprise/capWatch

Provide Watch connectivity for Capacitor

## Install

```bash
npm install @ionic-enterprise/capWatch
npx cap sync
```

## API

<docgen-index>

* [`addListener('runCommand', ...)`](#addlistenerruncommand)
* [`setWatchUI(...)`](#setwatchui)
* [`updateWatchUI(...)`](#updatewatchui)
* [`updateWatchData(...)`](#updatewatchdata)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### addListener('runCommand', ...)

```typescript
addListener(eventName: "runCommand", listenerFunc: (data: { "command": string; }) => void) => Promise<PluginListenerHandle> & PluginListenerHandle
```

| Param              | Type                                                 |
| ------------------ | ---------------------------------------------------- |
| **`eventName`**    | <code>'runCommand'</code>                            |
| **`listenerFunc`** | <code>(data: { command: string; }) =&gt; void</code> |

**Returns:** <code>Promise&lt;<a href="#pluginlistenerhandle">PluginListenerHandle</a>&gt; & <a href="#pluginlistenerhandle">PluginListenerHandle</a></code>

--------------------


### setWatchUI(...)

```typescript
setWatchUI(options: { watchUI: string; }) => Promise<void>
```

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ watchUI: string; }</code> |

--------------------


### updateWatchUI(...)

```typescript
updateWatchUI(options: { watchUI: string; }) => Promise<void>
```

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ watchUI: string; }</code> |

--------------------


### updateWatchData(...)

```typescript
updateWatchData(options: { data: { [key: string]: string; }; }) => Promise<void>
```

| Param         | Type                                               |
| ------------- | -------------------------------------------------- |
| **`options`** | <code>{ data: { [key: string]: string; }; }</code> |

--------------------


### Interfaces


#### PluginListenerHandle

| Prop         | Type                                      |
| ------------ | ----------------------------------------- |
| **`remove`** | <code>() =&gt; Promise&lt;void&gt;</code> |

</docgen-api>
