\name{getsgRNAdata}
\alias{getsgRNAdata}
\title{sgRNA Data Frame Creation}
\description{
Will provide a data frame with all information about the generated sgRNA returned by the sgRNA_design function.
}
\usage{
getsgRNAdata(x)
}
\arguments{
  \item{x}{the data list generated by the sgRNA_design function
  }
}
\value{
A data frame containing all information specific to sgRNA sequences generated by the sgRNA_design function. Information includes the sgRNA sequence itself, PAM, location, direction relative to the target sequence, GC content, homopolymer presence, presence of self-complementarity, off-target matches, predicted efficiency score, and a notes column that summarizes unfavorable sequence features.
}
\author{
Dylan Beeber
}
\examples{

## Quick example without off-target searching or annotation
## First generate data with the sgRNA_Design Function
testseq <- "GGCAGAGCTTCGTATGTCGGCGATTCATCTCAAGTAGAAGATCCTGGTGCAGTAGG"
usergenome <- "placeholder"
gtfname <- "placeholder"
alldata <- sgRNA_design(testseq, usergenome, gtfname, calloffs = FALSE)
## Then separate and format the sgRNA data with getsgRNAdata()
final_data <- getsgRNAdata(alldata)

\donttest{
## Longer example with off-target searching and annotation
## First generate data with the sgRNA_Design Function
requireNamespace("BSgenome.Scerevisiae.UCSC.sacCer3", quietly = TRUE)
testseq <- "GGCAGAGCTTCGTATGTCGGCGATTCATCTCAAGTAGAAGATCCTGGTGCAGTAGG"
usergenome <- BSgenome.Scerevisiae.UCSC.sacCer3::BSgenome.Scerevisiae.UCSC.sacCer3
gtfname <- "Saccharomyces_cerevisiae.R64-1-1.92.gtf.gz"
annotation_file <- system.file("example_data", gtfname, package = "crispRdesignR")
alldata <- sgRNA_design(testseq, usergenome, annotation_file)
## Then separate and format the sgRNA data with getsgRNAdata()
final_data <- getsgRNAdata(alldata)
}
}
