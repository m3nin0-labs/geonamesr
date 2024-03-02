#include <Rcpp.h>

#include <boost/shared_ptr.hpp>

#include <LuceneHeaders.h>
#include <FSDirectory.h>
#include <IndexWriter.h>
#include <IndexReader.h>

Lucene::DocumentPtr GeonamesDocument(Rcpp::List content);
