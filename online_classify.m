function classified_command=online_classify(y,trials,trials_to_use,w,letter,K,n) % y is input matrix, b is the bayes lda classifier

y=y';

% to be used for online classification
% EEG is sampled at 256Hz from 8 sites
% P300 Speller Matrix Paradigm is used

filterorder=n;
filtercutoff =[1/256 12/256];
[f_b, f_a] = butter(filterorder,filtercutoff);
n_channels=8;

for j = 1:n_channels
    y(j,:) = filtfilt(f_b,f_a,y(j,:));
end

p300_values=zeros(trials_to_use,9);

for stimulus=1:36
    
    StimulusCode=y(9,:); % y(9,:) holds stimulus coding info
    StimulusCode=[0,diff(StimulusCode)];
    StimulusCode(StimulusCode<0)=0;
    indices=find(StimulusCode==stimulus);
    
    for trial=trials*(letter-1)+1:trials*(letter-1)+trials_to_use
        % 5 is number of trials available for feature extraction
        % 'trials' is number of trials actually extracted!
        
        segment=y(1:8,indices(trial):indices(trial)+256);
        
        range=1:K:128;
        
        f1=segment(1,range);
        f2=segment(2,range);
        f3=segment(3,range);
        f4=segment(4,range);
        f5=segment(5,range);
        f6=segment(6,range);
        f7=segment(7,range);
        f8=segment(8,range);
        
        feature_vector=[f1, f2, f3, f4, f5, f6, f7, f8];
        
        p300_value=dot(feature_vector,w);
        %p300_value=classify(w,feature_vector'); % used for BLDA classification
        p300_values(trial,stimulus)=p300_value;
    end
    
end

p300_values=sum(p300_values,1); % sum the LDA vector for all single-trials into one vector for each letter
target=find(max(p300_values)==p300_values);
target=target(1); % In case, p300_values vector has more than one max value, choose the first one

switch target
        case 1, classified_command='A';
        case 2, classified_command='B';
        case 3, classified_command='C';
        case 4, classified_command='D';
        case 5, classified_command='E';
        case 6, classified_command='F';
        case 7, classified_command='G';
        case 8, classified_command='H';
        case 9, classified_command='I';
        case 10, classified_command='J';
        case 11, classified_command='K';
        case 12, classified_command='L';
        case 13, classified_command='M';
        case 14, classified_command='N';
        case 15, classified_command='O';
        case 16, classified_command='P';
        case 17, classified_command='Q';
        case 18, classified_command='R';
        case 19, classified_command='S';
        case 20, classified_command='T';
        case 21, classified_command='U';
        case 22, classified_command='V';
        case 23, classified_command='W';
        case 24, classified_command='X';
        case 25, classified_command='Y';
        case 26, classified_command='Z';
        case 27, classified_command='-';
        case 28, classified_command='1';
        case 29, classified_command='2';
        case 30, classified_command='3';
        case 31, classified_command='4';
        case 32, classified_command='5';
        case 33, classified_command='6';
        case 34, classified_command='7';
        case 35, classified_command='8';
        case 36, classified_command='9';
end

end