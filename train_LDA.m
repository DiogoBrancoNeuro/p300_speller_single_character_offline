function w = train_LDA(y,trials,K,n) % trials = number of trials used for stimulus presentation

    [p300_features,non_p300_features]=extract_features(y,trials,1:9,K,n)
    [A,B,w,cost]=lda(p300_features,non_p300_features);

end