#include <Rcpp.h>

#include <LuceneException.h>

#include "index.h"
#include "geonames.h"

// [[Rcpp::export(".index")]]
Rcpp::NumericVector index(Rcpp::List content, Rcpp::String indexName) {
  
  Lucene::IndexWriterPtr writer = IndexWriterFactory(indexName);
  
  try {
    writer->addDocument(GeonamesDocument(content));
    
    writer->optimize();
    writer->clone();
    
  } catch(Lucene::LuceneException& e) {
    return 1;
  }
  
  return 0;
}


// [[Rcpp::export(".indexBulk")]]
Rcpp::LogicalVector indexBulk(Rcpp::ListOf<Rcpp::List> content, Rcpp::String indexName) {
  
  Rcpp::LogicalVector results;
  Lucene::IndexWriterPtr writer = IndexWriterFactory(indexName);
  
  for(Rcpp::List::iterator it = content.begin(); it != content.end(); ++it) {
    try {
      writer->addDocument(GeonamesDocument(*it));
      
      results.push_back(true);
      
    } catch (Lucene::LuceneException& e) {
      results.push_back(false);
    }
  }
  
  writer->optimize();
  writer->commit();
  
  return results;
}

// [[Rcpp::export(".search")]]
Rcpp::List search(Rcpp::String queryText, int maxItems, Rcpp::String indexName) {
  Lucene::IndexReaderPtr reader = IndexReaderFactory(indexName);
  Lucene::String field = Lucene::StringUtils::toUnicode("name");
  
  Lucene::SearcherPtr searcher = Lucene::newLucene<Lucene::IndexSearcher>(reader);
  Lucene::AnalyzerPtr analyzer = Lucene::newLucene<Lucene::StandardAnalyzer>(
    Lucene::LuceneVersion::LUCENE_CURRENT
  );
  
  // Creating parsers
  Lucene::QueryParserPtr parser = Lucene::newLucene<Lucene::QueryParser>(
    Lucene::LuceneVersion::LUCENE_CURRENT, field, analyzer
  );
  
  // Parsing query string as unicode
  Lucene::String queryTextUnicode = Lucene::StringUtils::toUnicode(queryText);
  
  // Parsing query and searching!
  Lucene::QueryPtr query = parser->parse(queryTextUnicode);
  Lucene::TopDocsPtr results = searcher->search(query, maxItems);
  
  // Preparing results
  Lucene::Collection<Lucene::ScoreDocPtr> hits = results->scoreDocs;
  
  Rcpp::List rResults = Rcpp::List::create();
  for (int32_t i = 0; i < hits.size(); ++i) {
    Lucene::DocumentPtr rowDocument = searcher->doc(hits[i]->doc);
    
    rResults.push_back(Rcpp::List::create(
        Rcpp::Named("geonameid") = rowDocument->get(L"geonameid"),
        Rcpp::Named("name") = rowDocument->get(L"name"),
        Rcpp::Named("asciiname") = rowDocument->get(L"asciiname"),
        Rcpp::Named("admin1_code") = rowDocument->get(L"admin1_code"),
        Rcpp::Named("admin1_name") = rowDocument->get(L"admin1_name"),
        Rcpp::Named("admin2_code") = rowDocument->get(L"admin2_code"),
        Rcpp::Named("admin2_name") = rowDocument->get(L"admin2_name"),
        Rcpp::Named("admin3_code") = rowDocument->get(L"admin3_code"),
        Rcpp::Named("admin4_code") = rowDocument->get(L"admin4_code"),
        Rcpp::Named("population") = rowDocument->get(L"population"),
        Rcpp::Named("modification_date") = rowDocument->get(L"modification_date"),
        Rcpp::Named("geometry") = rowDocument->get(L"geometry")
    ));
  }
  
  return rResults;
}
