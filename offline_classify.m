function accuracy=offline_classify(y,trials_available,trials_to_use,w,letters,K,n) % y is input matrix, w is the FLDA classifier

y=y';

% to be used for offline classification
% EEG is sampled at 256Hz from 8 sites
% P300 Speller Matrix Paradigm is used

accuracy=0;

%EEG is sampled at 256Hz from 8 sites using the single-character P300 Speller Matrix Paradigm
filterorder=n;
filtercutoff =[1/128 12/128];
[f_b, f_a] = butter(filterorder,filtercutoff);
%[f_b, f_a] = cheby1(filterorder,0.5,filtercutoff);

n_channels=8;

for j = 1:n_channels
    y(j,:) = filtfilt(f_b,f_a,y(j,:)); %filtfilt does forward-reverse filtering
end

% for j = 1:n_channels
%     y(j,:) = filter(h,[1],y(j,:));
% end

for letter=letters
    
    p300_values=zeros(trials_to_use,9);
    
    for stimulus=1:36
        
        StimulusCode=y(9,:); % y(9,:) holds stimulus coding info
        StimulusCode=[0,diff(StimulusCode)];
        StimulusCode(StimulusCode<0)=0;
        indices=find(StimulusCode==stimulus);
        
        for trial=trials_available*(letter-1)+1:trials_available*(letter-1)+trials_to_use
            
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
            
            %feature_vector=[feature_vector 1];
            p300_value=dot(feature_vector,w);
            %p300_value=classify(w,feature_vector'); % used for BLDA classification
            p300_values(trial,stimulus)=p300_value;
        end
        
    end
    
    p300_values=sum(p300_values,1); % sum the LDA vector for all single-trials into one vector for each letter
    target=find(max(p300_values)==p300_values);
    target=target(1);
    
    switch target
        case 1, command_label='A';
        case 2, command_label='B';
        case 3, command_label='C';
        case 4, command_label='D';
        case 5, command_label='E';
        case 6, command_label='F';
        case 7, command_label='G';
        case 8, command_label='H';
        case 9, command_label='I';
        case 10, command_label='J';
        case 11, command_label='K';
        case 12, command_label='L';
        case 13, command_label='M';
        case 14, command_label='N';
        case 15, command_label='O';
        case 16, command_label='P';
        case 17, command_label='Q';
        case 18, command_label='R';
        case 19, command_label='S';
        case 20, command_label='T';
        case 21, command_label='U';
        case 22, command_label='V';
        case 23, command_label='W';
        case 24, command_label='X';
        case 25, command_label='Y';
        case 26, command_label='Z';
        case 27, command_label='-';
        case 28, command_label='1';
        case 29, command_label='2';
        case 30, command_label='3';
        case 31, command_label='4';
        case 32, command_label='5';
        case 33, command_label='6';
        case 34, command_label='7';
        case 35, command_label='8';
        case 36, command_label='9';
    end
    
    fprintf('%c\n',command_label); % Print each command on a new line
    actual='ABCDEFGHIJKLMNOPQRSTUVWYXZ-123456789'; % use for some particular testing session
    %actual='ABCDEFGHI'; % use for training session
    if(actual(letter)==command_label)
        accuracy=accuracy+1;
    end
    
end

fprintf('\n');
accuracy=100*accuracy/(length(letters));

end