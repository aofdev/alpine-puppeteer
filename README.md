# alpine-puppeteer 🐳

> Minimal Puppeteer with Alpine Linux 🐳

## Installation
```bash 
docker pull aofdev/alpine-puppeteer
```

## Usage
When launching Chrome, be sure to use the ``chromium-browser`` executable:
```js
const browser = await puppeteer.launch({
  executablePath: process.env.CHROME_BIN,
  args: [
     '--no-sandbox',
     '--disable-setuid-sandbox'
  ]
})
```
