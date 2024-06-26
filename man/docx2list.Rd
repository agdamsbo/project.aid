% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/docx2list.R
\name{docx2list}
\alias{docx2list}
\title{Reads docx file and splits each element into list}
\usage{
docx2list(path, data.type = "table cell", verbose = FALSE)
}
\arguments{
\item{path}{file path}

\item{data.type}{optional character vector to filter content. Could be
"paragraph" or "table cell".}

\item{verbose}{flag to give a little information on the data}
}
\value{
list
}
\description{
If now header row is defined in a table, the first row will be used for
column names.
Specified handling of "table cell" and "paragraph" data types. Others are
just passed.
Attempts to handle merged cells, but try to avoid.

Inspiration from `https://www.r-bloggers.com/2020/07/how-to-read-and-create-word-documents-in-r/`
}
