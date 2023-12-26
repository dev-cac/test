import { getDocument } from 'pdfjs-dist';
import { readFileSync } from 'fs';

async function searchTextInPDF(pdfPath, searchWords) {
  const existingPdfBytes = readFileSync(pdfPath);
  const uint8Array = new Uint8Array(existingPdfBytes);

  const pdf = await getDocument(uint8Array).promise;
  const results = {};

  searchWords.forEach(word => {
    results[word] = [];
  });

  for (let i = 0; i < pdf.numPages; i++) {
    const page = await pdf.getPage(i + 1);
    const content = await page.getTextContent();

    content.items.forEach(function (item) {
      searchWords.forEach(function (word) {
        if (item.str.includes(word)) {
          const transform = item.transform;

          results[word].push({
            page: i + 1,
            scaleX: transform[0],
            scaleY: transform[3],
            translateX: transform[4],
            translateY: transform[5]
          });
        }
      });
    });
  }

  return results;
}

const pdfPath = './test.pdf';
const searchWords = ['PEPITO PEREZ', '121312312312313', 'you'];
const results = await searchTextInPDF(pdfPath, searchWords);

console.log(results);
