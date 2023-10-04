const fs = require('fs');

const inputFileName = 'sitemap.json';  // Nombre del archivo JSON de entrada
const outputSitemapFileName = 'sitemap.xml';  // Nombre del archivo de salida para el sitemap

// Función para generar el sitemap en formato XML
const generateSitemapXml = (urls) => {
  const date = new Date().toISOString();
  let xml = `<?xml version="1.0" encoding="UTF-8"?>\n`;
  xml += `<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n`;

  for (const url of urls) {
    xml += `  <url>\n`;
    xml += `    <loc>${url}</loc>\n`;
    xml += `    <lastmod>${date}</lastmod>\n`;  // Use the current date as the last modified date
    xml += `  </url>\n`;
  }

  xml += `</urlset>`;
  return xml;
};

// Leer el archivo JSON
try {
  const sitemapData = JSON.parse(fs.readFileSync(inputFileName, 'utf-8'));

  // Generar el sitemap en formato XML
  const sitemapXml = generateSitemapXml(sitemapData);

  // Guardar el sitemap en un archivo XML
  fs.writeFileSync(outputSitemapFileName, sitemapXml);
  console.log('Sitemap created and saved to', outputSitemapFileName);
} catch (error) {
  console.error('Error reading sitemap file:', error);
}
