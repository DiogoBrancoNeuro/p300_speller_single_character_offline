function accuracies = NFCV(y)

% Perform 3-fold cross-validation on training data

accuracies=[];

for K=10:2:20
    for n=1:3
              
        NFCV_accuracy=0;
        
        for a=1:3
            testing_letters=12*(a-1)+1:12*a;
            training_letters=setdiff(1:36,testing_letters);
            [p300_features,non_p300_features]=extract_features(y,3,training_letters,K,n);
            [A,B,w,cost]=lda(p300_features,non_p300_features);
            NFCV_accuracy=NFCV_accuracy+offline_classify(y,3,1,w,testing_letters,K,n);
        end
        
        NFCV_accuracy=NFCV_accuracy/3;
        
        %accuracy=offline_classify(y,5,1,w,1:18,K,n);
        %accuracies=[ accuracies; [K n NFCV_accuracy accuracy] ];
        accuracies=[ accuracies; [K n NFCV_accuracy] ]
        
    end
end

end