You will need to use `PNPM` instead of `NPM` (direct replacement for NPM, ie: `pnpm i`):


- On POSIX systems, you may install pnpm even if you don't have Node.js installed, using the following script:
```
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

- If you don't have curl installed, you would like to use wget:
```
wget -qO- https://get.pnpm.io/install.sh | sh -
```

- On Windows (PowerShell):
```
iwr https://get.pnpm.io/install.ps1 -useb | iex
```