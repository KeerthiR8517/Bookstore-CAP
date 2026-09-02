const { Genre } = require('#cds-models/db')
const cds = require('@sap/cds')

module.exports = class BookstoreService extends cds.ApplicationService {
  init() {

    const { Books } = cds.entities('BookstoreService')

    this.on('addDiscount', async () => {
      await UPDATE(Books).set({ price: { fun: 'ROUND', args: [{ xpr: [{ ref: ['price'] }, '*', { val: 0.9 }] }, { val: 2 }] } })
    })


    this.on('addstock', Books, async (req) => {
      const bookId = req.params[0].ID
      await UPDATE(Books)
        .set({ stock: { '+=': 1 } })
        .where({ ID: bookId })
    })

    this.on('changePublishDate', Books, async (req) => {
      const bookId = req.params[0].ID
      // console.log(req.data)
      const newDate = req.data.newDate
      await UPDATE(Books)
        .set({ publishedAt: newDate })
        .where({ ID: bookId })

    })


    this.on('changeStatus', Books, async (req) => {
      const bookId = req.params[0].ID
      // console.log(req.data)
      const newStatus = req.data.newStatus
      await UPDATE(Books)
        .set({ status_code: newStatus })
        .where({ ID: bookId })

    })

    this.before(['READ'], Books, async (req) => {
      console.log('Before Books', req.data)
    })
    this.on('READ', Books, async (req, next) => {
      console.log('On Event')
      return next()
    })

    this.after('READ', Books, async (books, req) => {
      for (const book of books) {
        if (book.genre_code === 'SCI') {
          book.price = book.price * 0.8

        }
      }
      console.log('After READ')
    })
    return super.init()
  }
}
// this.before (['CREATE', 'UPDATE'], Authors, async (req) => {
//   console.log('Before CREATE/UPDATE Authors', req.data)
// })
// this.after ('READ', Authors, async (authors, req) => {
//   console.log('After READ Authors', authors)
// })
// this.before (['CREATE', 'UPDATE'], GenersVH, async (req) => {
//   console.log('Before CREATE/UPDATE GenersVH', req.data)
// })
// this.after ('READ', GenersVH, async (genersVH, req) => {
//   console.log('After READ GenersVH', genersVH)
// })
// this.before (['CREATE', 'UPDATE'], BookStatus, async (req) => {
//   console.log('Before CREATE/UPDATE BookStatus', req.data)
// })
// this.after ('READ', BookStatus, async (bookStatus, req) => {
//   console.log('After READ BookStatus', bookStatus)
// })
// this.before (['CREATE', 'UPDATE'], Chapters, async (req) => {
//   console.log('Before CREATE/UPDATE Chapters', req.data)
// })
// this.after ('READ', Chapters, async (chapters, req) => {
//   console.log('After READ Chapters', chapters)
// })



