const puppeteer = require('puppeteer');
const fs = require('fs');

const baseUrl = 'https://www.pulqui.com.ar';
const outputFileName = 'sitemap.json';

const saveUrlsToJson = (urls) => {
  fs.writeFileSync(outputFileName, JSON.stringify(urls, null, 2));
};

const loadUrlsFromJson = () => {
  try {
    if (fs.existsSync(outputFileName)) {
      const data = fs.readFileSync(outputFileName, 'utf-8');
      return JSON.parse(data);
    }
    return [];
  } catch (error) {
    console.error('Error reading sitemap file:', error);
    return [];
  }
};

const visitedUrls = new Set(loadUrlsFromJson());
console.log({ visitedUrls })

async function crawlWebsite(url) {
  const browser = await puppeteer.launch({ headless: 'new' });
  const page = await browser.newPage();
  await page.goto(url, { waitUntil: 'networkidle2' });

  visitedUrls.add(url);

  const links = await page.evaluate(() => {
    const anchors = Array.from(document.querySelectorAll('a'));
    return anchors.map(anchor => anchor.href);
  });

  for (const link of links) {
    if (!visitedUrls.has(link) && link.startsWith(baseUrl)) {
      await crawlWebsite(link);
    }
  }

  console.log(`Close: ${url}`)
  await browser.close();
  saveUrlsToJson(Array.from(visitedUrls));
}

crawlWebsite(baseUrl).then(() => {
  console.log('Sitemaps created.');
  console.log('Visited URLs:', Array.from(visitedUrls));
}).catch(error => {
  console.error('Error:', error);
});
