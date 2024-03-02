#include <Rcpp.h>

#include <LuceneHeaders.h>
#include <FSDirectory.h>
#include <IndexWriter.h>
#include <IndexReader.h>


Lucene::DocumentPtr GeonamesDocument(Rcpp::List content) {
  
  Lucene::DocumentPtr document = Lucene::newLucene<Lucene::Document>();
  
  // Geonames ID
  document->add(Lucene::newLucene<Lucene::Field>(
      L"geonameid",
      content["geonameid"],
             Lucene::Field::STORE_YES,
             Lucene::Field::INDEX_ANALYZED
  ));
  
  // Name
  document->add(Lucene::newLucene<Lucene::Field>(
      L"name",
      Lucene::StringUtils::toUnicode(content["name"]),
      Lucene::Field::STORE_YES,
      Lucene::Field::INDEX_ANALYZED
  ));
  
  // ASCII Name
  document->add(  Lucene::newLucene<Lucene::Field>(
      L"asciiname",
      Lucene::StringUtils::toUnicode(content["asciiname"]),
      Lucene::Field::STORE_YES,
      Lucene::Field::INDEX_ANALYZED
  ));
  
  // ADMIN 1 Code
  document->add(Lucene::newLucene<Lucene::Field>(
      L"admin1_code",
      Lucene::StringUtils::toUnicode(content["admin1_code"]),
      Lucene::Field::STORE_YES,
      Lucene::Field::INDEX_ANALYZED
  ));
  
  // ADMIN 2 Code
  document->add(  Lucene::newLucene<Lucene::Field>(
      L"admin2_code",
      Lucene::StringUtils::toUnicode(content["admin2_code"]),
      Lucene::Field::STORE_YES,
      Lucene::Field::INDEX_ANALYZED
  ));
  
  // ADMIN 3 Code
  document->add(  Lucene::newLucene<Lucene::Field>(
      L"admin3_code",
      Lucene::StringUtils::toUnicode(content["admin3_code"]),
      Lucene::Field::STORE_YES,
      Lucene::Field::INDEX_ANALYZED
  ));
  
  // ADMIN 4 Code
  document->add(  Lucene::newLucene<Lucene::Field>(
      L"admin4_code",
      Lucene::StringUtils::toUnicode(content["admin4_code"]),
      Lucene::Field::STORE_YES,
      Lucene::Field::INDEX_ANALYZED
  ));
  
  // Population
  document->add(  Lucene::newLucene<Lucene::Field>(
      L"population",
      Lucene::StringUtils::toUnicode(content["population"]),
             Lucene::Field::STORE_YES,
             Lucene::Field::INDEX_ANALYZED
  ));
  
  // Population
  document->add(  Lucene::newLucene<Lucene::Field>(
      L"modification_date",
      Lucene::StringUtils::toUnicode(content["modification_date"]),
             Lucene::Field::STORE_YES,
             Lucene::Field::INDEX_ANALYZED
  ));
  
  // Geometry
  document->add(  Lucene::newLucene<Lucene::Field>(
      L"geometry",
      Lucene::StringUtils::toUnicode(content["geometry"]),
             Lucene::Field::STORE_YES,
             Lucene::Field::INDEX_ANALYZED
  ));

  return document;
}
