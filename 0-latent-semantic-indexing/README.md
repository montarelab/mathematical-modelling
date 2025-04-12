# Document Summarizer using Latent Semantic Indexing (LSI)

This project focuses on developing an automated system to generate concise and accurate summaries of input documents. By leveraging Latent Semantic Indexing (LSI) and advanced text preprocessing techniques, the goal is to identify sentences that best capture the central themes of the original text.

## Objective

The primary objective of this research is to rigorously test and compare multiple configurations of the summarization pipeline. These variations include:
- **Different levels of text preprocessing**, such as stopword removal and lemmatization, to assess their impact on summary quality.
- **Matrix construction methods**, comparing TF-IDF weighting against more sophisticated approaches like Log-Entropy.
- **Dimensionality reduction settings**, experimenting with the number of retained singular values in the SVD step to balance information retention and noise reduction.
- **Sentence selection strategies**, utilizing both basic ranking and weighted scoring mechanisms based on singular values.

Through these controlled experiments (32 test cases in total), the project aims to determine the most effective combination of methods for producing summaries that are both informative and contextually relevant.

## Methods & Technologies

- **Programming Language**: Python
- **Libraries**: NumPy, scikit-learn
- **Techniques**: LSI, TF-IDF, SVD, Log-Entropy weighting, Cosine similarity evaluation

## Results

The results demonstrate that careful preprocessing and weighting significantly enhance summarization accuracy. Particularly, preprocessed texts and optimized weighting methods led to more precise sentence extraction, better reflecting the core narrative of the original documents.

## Authors

- Dmytro Tkachenko
- Lenart Marjanovič
- Paul Douat
