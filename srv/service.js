const cds = require('@sap/cds')

module.exports = class BookstoreService extends cds.ApplicationService { init() {

  const { Books, Authors, GenersVH, BookStatus, Chapters } = cds.entities('BookstoreService')

  this.before (['READ'], Books, async (req) => {
    console.log('Before Books', req.data)
  })
this.on('READ', Books, async(req,next)=>{
  console.log('On Event')
  return next()
})

  this.after ('READ', Books, async (books, req) => {
    for(const book of books){
      if(book.genre_code==='Tech'){
        book.price=book.price * 0.8
        book.title= 'Dicount today!! Tech book'
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


 
