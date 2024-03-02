#include <Rcpp.h>

#include <LuceneHeaders.h>
#include <IndexWriter.h>
#include <IndexReader.h>

Lucene::IndexReaderPtr IndexReaderFactory(Lucene::String name);
Lucene::IndexWriterPtr IndexWriterFactory(Lucene::String index);
