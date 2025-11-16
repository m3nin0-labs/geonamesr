#include <Rcpp.h>

#include <LuceneHeaders.h>
#include <FSDirectory.h>
#include <IndexWriter.h>
#include <IndexReader.h>


Lucene::IndexReaderPtr IndexReaderFactory(Lucene::String name) {
  return Lucene::IndexReader::open(
    Lucene::FSDirectory::open(name)
  );
}


Lucene::IndexWriterPtr IndexWriterFactory(Lucene::String index) {
  Lucene::String directory(index);
  
  Lucene::IndexWriterPtr writer = Lucene::newLucene<Lucene::IndexWriter>(
    Lucene::FSDirectory::open(directory),
    Lucene::newLucene<Lucene::StandardAnalyzer>(
      Lucene::LuceneVersion::LUCENE_CURRENT
    ),
    true,
    Lucene::IndexWriter::MaxFieldLengthLIMITED
  );
  
  return writer;
}
