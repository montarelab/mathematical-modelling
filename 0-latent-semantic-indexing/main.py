import numpy as np
import scipy.sparse as sp
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from sklearn.decomposition import TruncatedSVD

def build_word_sentence_matrix(document):
    """
    Builds a word-sentence frequency matrix from a document.
    Args: document (str): The document to process.
    Returns: tuple: A tuple containing the word-sentence matrix, words, and sentences.
    """
    # Split document into sentences and strip whitespace
    sentences = [sentence.strip() for sentence in document.split('.') if sentence.strip()]
    # Initialize the count vectorizer with stop words filtering
    vectorizer = CountVectorizer(stop_words='english')
    X = vectorizer.fit_transform(sentences)
        
    # Convert the matrix to an array and get the feature names (words)
    matrix = X.toarray()
    words = vectorizer.get_feature_names_out()
    return matrix, words, sentences

def truncated_svd(matrix, energy_threshold=0.9):
    """
    Performs truncated Singular Value Decomposition (SVD) on a matrix.
    Args: matrix (numpy.ndarray): The matrix to decompose, energy_threshold (float): The energy threshold to retain in the decomposition.
    Returns: tuple: The truncated U, S, V matrices and the number of singular values used.
    """
    # Perform SVD on the matrix
    U, S, Vt = svd (matrix, full_matrices=False)
    total_energy = np.sum(S)
    running_energy = 0.0
    k = 0
        
    # Retain the top singular values based on the energy threshold
    while running_energy / total_energy < energy_threshold and k < len(S):
        running_energy += S[k]
        k += 1
    
    	U_k = U[:, :k]
    	S_k = np.diag(S[:k])
    	V_k = Vt[:k, :]
    return U_k, S_k, V_k, k


def calculate_local_measure(matrix):
    """
    Calculates the local measure for the word-sentence matrix.
    Args: matrix (numpy.ndarray): The word-sentence frequency matrix.
    Returns: numpy.ndarray: The local measure matrix.
    """
    # Calculate the local measure using the logarithm of the frequency + 1
    return np.log(matrix + 1)

def calculate_global_measure(matrix):
    """
    Calculates the global measure for the word-sentence matrix using entropy.
         Args: matrix (numpy.ndarray): The word-sentence frequency matrix.
    Returns: numpy.ndarray: The global measure for each word.
    """
     # Calculate total word frequency for each sentence
     total_word_freq = np.sum(matrix, axis=1)
     n = matrix.shape[1]
      
     global_measure = np.zeros_like(total_word_freq, dtype=float)
     # Calculate the global measure based on entropy for each word
    for i in range(matrix.shape[0]):
     if total_word_freq[i] > 0:
         p_ij = matrix[i] / total_word_freq[i]
         entropy = -np.sum(p_ij * np.log(p_ij + 1e-10)) / np.log(n)
         global_measure[i] = 1 - entropy
     else:
         global_measure[i] = 1
    
    return global_measure

def build_complex_matrix(matrix, local_measure, global_measure):
    """
    Builds a complex matrix by combining local and global measures.
    Args: matrix (numpy.ndarray): The word-sentence frequency matrix,
    local_measure (numpy.ndarray): The local measure matrix,
    global_measure (numpy.ndarray): The global measure for each word.
    Returns: numpy.ndarray: The complex matrix.
    """
    complex_matrix = np.zeros_like(matrix, dtype=float)
    
    # Combine local and global measures to form the complex matrix
    for i in range(matrix.shape[0]):
        for j in range(matrix.shape[1]):
            complex_matrix[i, j] = local_measure[i, j] * global_measure[i]    
    return complex_matrix
