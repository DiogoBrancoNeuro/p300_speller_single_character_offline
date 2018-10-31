function [p300_features,non_p300_features]=extract_features(y,trials,letters,K,n) % y is input matrix

y=y';

% EEG is sampled at 256Hz from 8 sites using the single-character P300 Speller Matrix Paradigm

filterorder=n;
filtercutoff =[1/128 12/128]; % 128 is Nyquist frequency
[f_b, f_a] = butter(filterorder,filtercutoff); % butterworth filter
%[f_b, f_a] = cheby1(filterorder,0.5,filtercutoff); % chebychev filter

n_channels=8;

for j = 1:n_channels
    y(j,:) = filtfilt(f_b,f_a,y(j,:)); % 'filtfilt' does forward-reverse filtering
end

% for j = 1:n_channels
%     y(j,:) = filter(h,[1],y(j,:)); % 'filter' does forward filtering only
% end

p300_features=[];
non_p300_features=[];

StimulusCode=y(9,:); % y(9,:) holds stimulus coding info
StimulusCode=[0,diff(StimulusCode)];
StimulusCode(StimulusCode<0)=0;

for letter=letters
    
    for stimulus=1:36
                
        dtime_indices=find(StimulusCode==stimulus); % finds the discrete-time indices corresponding to stimulus 1
        
        for trial=3*(letter-1)+1:3*(letter-1)+trials
            % 15 is total number of trials available for extraction
            % 'trials' is number of trials actually extracted to be used 
            segment=y(1:8,dtime_indices(trial):dtime_indices(trial)+256); % Extracts features from single-trials
            
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
                        
            if(y(10,dtime_indices(trial))==1) % y(10,:) holds target coding info
                p300_features=[p300_features; feature_vector];
            else
                non_p300_features=[non_p300_features; feature_vector];
            end
            
        end
        
    end
    
end

end