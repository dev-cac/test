const pdf = require("html-pdf");
const fs = require("fs");

const template = fs.readFileSync(
    __dirname + "/product.html"
).toString("utf8");

const header = `
    <h4 style="text-align: end">Fecha:${'Hola Mundo :D'}</h4>
    <h2>Lista de productos </h2>
`

const options = {
    header: {
        height: "26mm",
        contents: header,
    },
    footer: {
        height: '10mm',
        contents: {
            default: `
                <div class="page-number">
                    {{page}}
                </div>
            `,
        },
    },
    format: 'A4',
    paginationOffset: 1,
    border: {
        top: '0',
        right: '10px',
        bottom: '0',
        left: '10px'
    }
}

const content = template.replace("$$bodyRow$$", '<h1>Hola Mundo :D</h1>');
pdf.create(content, options).toFile('./pdfs/result.pdf', (e, res) => {
    console.log(res)
})
