function [p300_trials,non_p300_trials]=extract_trials(y,trials,letters) % y is input matrix

y=y';

% letters = 1:35 for offline
% letters = 1 for online (since we classify one letter at a time)
% EEG is sampled at 256Hz from 8 sites % P300 Speller Matrix Paradigm is used
% filterorder=3;
% filtercutoff =[0.5/128 6/128];
% [f_b, f_a] = butter(filterorder,filtercutoff);
% n_channels=8;
% 
% for j = 1:n_channels
%     y(j,:) = filtfilt(f_b,f_a,y(j,:));
% end

p300_trials=cell(135,1);
non_p300_trials=cell(1080,1);

p300_count=0;
non_p300_count=0;

for stimulus=1:9
    
    StimulusCode=y(9,:); % y(9,:) holds stimulus coding info
    StimulusCode=[0,diff(StimulusCode)];
    StimulusCode(StimulusCode<0)=0;
    indices=find(StimulusCode==stimulus);
    
    for letter=letters
        
        for trial=15*(letter-1)+1:15*(letter-1)+trials
            
            segment=y(1:8,indices(trial):indices(trial)+255); % Extracts features from single-trials
                               
            if(y(10,indices(trial))==1) % y(10,:) holds target coding info
                p300_count=p300_count+1;
                p300_trials{p300_count}=segment;
            else
                non_p300_count=non_p300_count+1;
                non_p300_trials{non_p300_count}=segment;
            end
            
        end
        
    end
    
end

end