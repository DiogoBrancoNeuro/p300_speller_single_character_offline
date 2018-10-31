function P300_Offline()

% Single character P300 Speller Stimulus Presentation Paradigm used for offline data collection

ISI=0.075; % 75ms
colour_vector=[0 0 0]; % flash colour, black in this case!
flashtime=0.1; % 100ms
target=0;
prev_rand_vector=zeros(36,1);

training_commands='ABCDEFGHIJKLMNOPQRSTUVWXYZ-123456789';
instruction_text='The target character will be highlighted for 2 seconds. Count the number of times this command is flashed in the subsequent flashing sequence.';

set_param('P300_Speller/BCI/START SIGNAL','Value','0');
set_param('P300_Speller/BCI/TARGET','Value','0');
set_param('P300_Speller/BCI/FLASH','Value','0');
f = figure('Interruptible','on','HandleVisibility','callback','Menubar','none','Visible','off','Name','The University of the West Indies Brain-Computer Interface Group: P300 Speller Stimulus Presentation Paradigm','Units','Normalized','Position',[0,0,0.8,0.8],'Toolbar','none','NumberTitle','off');
set(f,'CloseRequestFcn',@close_function);

instructions=uicontrol('Parent',f,'Units','Normalized','Style','text','String','Instructions:','Position',[0.05,0.85,0.25,0.1],'FontName','Arial','ForegroundColor',[0 0 0],'BackgroundColor',[1 1 1],'FontSize',30,'HorizontalAlignment','right');
user_entry=uicontrol('Parent',f,'Units','Normalized','Style','text','String',instruction_text,'Position',[0.30,0.85,0.6,0.1],'FontName','Arial','ForegroundColor',[0 0 0],'BackgroundColor',[1 1 1],'FontSize',17);
hbutton = uicontrol('Parent',f,'Style','pushbutton','Units','Normalized','String','START','Position',[0.4,0.01,0.2,0.05],'callback',@hbutton_callback);

    function close_function(source,eventdata)
        set_param('P300_Speller/BCI/START SIGNAL','Value','1');
        set_param('P300_Speller','SimulationCommand','stop');
        clear global % Clear global variables on closing the GUI window
        delete(f); % get rid of created figure (GUI)
    end

    function hbutton_callback(source,eventdata)
        
        %set_param('P300_Speller','SimulationCommand','start');
        set(hbutton,'Visible','off'); % Disable START BUTTON during presentation
        
        for letter=1:length(training_commands)
            
            trials=3; % Use 15 trials for training, use 5-7 for testing
            
            switch training_commands(letter) % highlight target character for 2 seconds prior to stimulus presentation starts
                case 'A',
                    target=1;
                    highlightA();
                    myWait(2);
                    revert();
                case 'B',
                    target=2;
                    highlightB();
                    myWait(2);
                    revert();
                case 'C',
                    target=3;
                    highlightC();
                    myWait(2);
                    revert();
                case 'D',
                    target=4;
                    highlightD();
                    myWait(2);
                    revert();
                case 'E',
                    target=5;
                    highlightE();
                    myWait(2);
                    revert();
                case 'F',
                    target=6;
                    highlightF();
                    myWait(2);
                    revert();
                case 'G',
                    target=7;
                    highlightG();
                    myWait(2);
                    revert();
                case 'H',
                    target=8;
                    highlightH();
                    myWait(2);
                    revert();
                case 'I',
                    target=9;
                    highlightI();
                    myWait(2);
                    revert();
                case 'J',
                    target=10;
                    highlightJ();
                    myWait(2);
                    revert();
                case 'K',
                    target=11;
                    highlightK();
                    myWait(2);
                    revert();
                case 'L',
                    target=12;
                    highlightL();
                    myWait(2);
                    revert();
                case 'M',
                    target=13;
                    highlightM();
                    myWait(2);
                    revert();
                case 'N',
                    target=14;
                    highlightN();
                    myWait(2);
                    revert();
                case 'O',
                    target=15;
                    highlightO();
                    myWait(2);
                    revert();
                case 'P',
                    target=16;
                    highlightP();
                    myWait(2);
                    revert();
                case 'Q',
                    target=17;
                    highlightQ();
                    myWait(2);
                    revert();
                case 'R',
                    target=18;
                    highlightR();
                    myWait(2);
                    revert();
                case 'S',
                    target=19;
                    highlightS();
                    myWait(2);
                    revert();
                case 'T',
                    target=20;
                    highlightT();
                    myWait(2);
                    revert();
                case 'U',
                    target=21;
                    highlightU();
                    myWait(2);
                    revert();
                case 'V',
                    target=22;
                    highlightV();
                    myWait(2);
                    revert();
                case 'W',
                    target=23;
                    highlightW();
                    myWait(2);
                    revert();
                case 'X',
                    target=24;
                    highlightX();
                    myWait(2);
                    revert();
                case 'Y',
                    target=25;
                    highlightY();
                    myWait(2);
                    revert();
                case 'Z',
                    target=26;
                    highlightZ();
                    myWait(2);
                    revert();
                case '-',
                    target=27;
                    highlightdash();
                    myWait(2);
                    revert();
                case '1',
                    target=28;
                    highlight1();
                    myWait(2);
                    revert();
                case '2',
                    target=29;
                    highlight2();
                    myWait(2);
                    revert();
                case '3',
                    target=30;
                    highlight3();
                    myWait(2);
                    revert();
                case '4',
                    target=31;
                    highlight4();
                    myWait(2);
                    revert();
                case '5',
                    target=32;
                    highlight5();
                    myWait(2);
                    revert();
                case '6',
                    target=33;
                    highlight6();
                    myWait(2);
                    revert();
                case '7',
                    target=34;
                    highlight7();
                    myWait(2);
                    revert();
                case '8',
                    target=35;
                    highlight8();
                    myWait(2);
                    revert();
                case '9',
                    target=36;
                    highlight9();
                    myWait(2);
                    revert();
            end
            
            for trial=1:trials
                
                rand_vector=randperm(36);
                
                if(rand_vector(1)==prev_rand_vector(36)) % Interchange last and first element of random order vector in case
                    temp=rand_vector(1); % the first stimuli of the current trial is the same as the last stimuli of the previous trial
                    rand_vector(1)=rand_vector(36);
                    rand_vector(36)=temp;
                end
                
                for c=1:36
                    stim=rand_vector(c);
                    
                    switch stim
                        case 1
                            highlightA();
                            if(target==1)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','1');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            myWait(ISI);
                        case 2
                            highlightB();
                            if(target==2)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','2');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 3
                            highlightC();
                            if(target==3)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','3');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 4
                            highlightD();
                            if(target==4)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','4');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 5
                            highlightE();
                            if(target==5)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','5');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 6
                            highlightF();
                            if(target==6)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','6');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 7
                            highlightG();
                            if(target==7)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','7');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 8
                            highlightH();
                            if(target==8)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','8');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 9
                            highlightI();
                            if(target==9)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','9');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 10
                            highlightJ();
                            if(target==10)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','10');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            myWait(ISI);
                        case 11
                            highlightK();
                            if(target==11)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','11');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 12
                            highlightL();
                            if(target==12)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','12');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 13
                            highlightM();
                            if(target==13)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','13');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 14
                            highlightN();
                            if(target==14)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','14');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 15
                            highlightO();
                            if(target==15)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','15');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 16
                            highlightP();
                            if(target==16)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','16');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 17
                            highlightQ();
                            if(target==17)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','17');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 18
                            highlightR();
                            if(target==18)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','18');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 19
                            highlightS();
                            if(target==19)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','19');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            myWait(ISI);
                        case 20
                            highlightT();
                            if(target==20)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','20');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 21
                            highlightU();
                            if(target==21)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','21');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 22
                            highlightV();
                            if(target==22)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','22');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 23
                            highlightW();
                            if(target==23)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','23');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 24
                            highlightX();
                            if(target==24)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','24');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 25
                            highlightY();
                            if(target==25)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','25');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 26
                            highlightZ();
                            if(target==26)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','26');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 27
                            highlightdash();
                            if(target==27)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','27');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 28
                            highlight1();
                            if(target==28)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','28');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            myWait(ISI);
                        case 29
                            highlight2();
                            if(target==29)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','29');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 30
                            highlight3();
                            if(target==30)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','30');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 31
                            highlight4();
                            if(target==31)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','31');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 32
                            highlight5();
                            if(target==32)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','32');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 33
                            highlight6();
                            if(target==33)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','33');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 34
                            highlight7();
                            if(target==34)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','34');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 35
                            highlight8();
                            if(target==35)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','35');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                        case 36
                            highlight9();
                            if(target==36)
                                set_param('P300_Speller/BCI/TARGET','Value','1');
                            else
                                set_param('P300_Speller/BCI/TARGET','Value','0');
                            end
                            set_param('P300_Speller/BCI/FLASH','Value','36');
                            myWait(flashtime);
                            revert();
                            set_param('P300_Speller/BCI/TARGET','Value','0');
                            set_param('P300_Speller/BCI/FLASH','Value','0');
                            myWait(ISI);
                    end
                    
                end
                
                prev_rand_vector=rand_vector;
                
            end
            
            set_param('P300_Speller/BCI/TARGET','Value','0');
            set_param('P300_Speller/BCI/FLASH','Value','0');
            if(trials>0)
                myWait(2); % 2 second break after each letter (number of trials)
            end
            
        end % All training data has been collected at this point in code/time
        set_param('P300_Speller','SimulationCommand','stop');
        set(hbutton,'Visible','on');
        myWait(4);
        evalin('base','save(date)'); % Save data in workspace immediately after data collection
        
    end

    function highlightA()
        set(A,'ForegroundColor',colour_vector);
    end

    function highlightB()
        set(B,'ForegroundColor',colour_vector);
    end

    function highlightC()
        set(C,'ForegroundColor',colour_vector);
    end

    function highlightD()
        set(D,'ForegroundColor',colour_vector);
    end

    function highlightE()
        set(E,'ForegroundColor',colour_vector);
    end

    function highlightF()
        set(F,'ForegroundColor',colour_vector);
    end

    function highlightG()
        set(G,'ForegroundColor',colour_vector);
    end

    function highlightH()
        set(H,'ForegroundColor',colour_vector);
    end

    function highlightI()
        set(I,'ForegroundColor',colour_vector);
    end

    function highlightJ()
        set(J,'ForegroundColor',colour_vector);
    end

    function highlightK()
        set(K,'ForegroundColor',colour_vector);
    end

    function highlightL()
        set(L,'ForegroundColor',colour_vector);
    end

    function highlightM()
        set(M,'ForegroundColor',colour_vector);
    end

    function highlightN()
        set(N,'ForegroundColor',colour_vector);
    end

    function highlightO()
        set(O,'ForegroundColor',colour_vector);
    end

    function highlightP()
        set(P,'ForegroundColor',colour_vector);
    end

    function highlightQ()
        set(Q,'ForegroundColor',colour_vector);
    end

    function highlightR()
        set(R,'ForegroundColor',colour_vector);
    end

    function highlightS()
        set(S,'ForegroundColor',colour_vector);
    end

    function highlightT()
        set(T,'ForegroundColor',colour_vector);
    end

    function highlightU()
        set(U,'ForegroundColor',colour_vector);
    end

    function highlightV()
        set(V,'ForegroundColor',colour_vector);
    end

    function highlightW()
        set(W,'ForegroundColor',colour_vector);
    end

    function highlightX()
        set(X,'ForegroundColor',colour_vector);
    end

    function highlightY()
        set(Y,'ForegroundColor',colour_vector);
    end

    function highlightZ()
        set(Z,'ForegroundColor',colour_vector);
    end

    function highlightdash()
        set(dash,'ForegroundColor',colour_vector);
    end

    function highlight1()
        set(one,'ForegroundColor',colour_vector);
    end

    function highlight2()
        set(two,'ForegroundColor',colour_vector);
    end

    function highlight3()
        set(three,'ForegroundColor',colour_vector);
    end

    function highlight4()
        set(four,'ForegroundColor',colour_vector);
    end

    function highlight5()
        set(five,'ForegroundColor',colour_vector);
    end

    function highlight6()
        set(six,'ForegroundColor',colour_vector);
    end

    function highlight7()
        set(seven,'ForegroundColor',colour_vector);
    end

    function highlight8()
        set(eight,'ForegroundColor',colour_vector);
    end

    function highlight9()
        set(nine,'ForegroundColor',colour_vector);
    end

    function revert(object,eventdata)
        set([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,dash,one,two,three,four,five,six,seven,eight,nine],'ForegroundColor',[0.75 0.75 0.75]);
    end

A = uicontrol('Parent',f,'Units','Normalized','Style','text','String','A','Position',[0.2,0.6,0.1,0.1],'Enable','inactive');
B = uicontrol('Parent',f,'Units','Normalized','Style','text','String','B','Position',[0.3,0.6,0.1,0.1],'Enable','inactive');
C = uicontrol('Parent',f,'Units','Normalized','Style','text','String','C','Position',[0.4,0.6,0.1,0.1],'Enable','inactive');
D = uicontrol('Parent',f,'Units','Normalized','Style','text','String','D','Position',[0.5,0.6,0.1,0.1],'Enable','inactive');
E = uicontrol('Parent',f,'Units','Normalized','Style','text','String','E','Position',[0.6,0.6,0.1,0.1],'Enable','inactive');
F = uicontrol('Parent',f,'Units','Normalized','Style','text','String','F','Position',[0.7,0.6,0.1,0.1],'Enable','inactive');
G = uicontrol('Parent',f,'Units','Normalized','Style','text','String','G','Position',[0.2,0.5,0.1,0.1],'Enable','inactive');
H = uicontrol('Parent',f,'Units','Normalized','Style','text','String','H','Position',[0.3,0.5,0.1,0.1],'Enable','inactive');
I = uicontrol('Parent',f,'Units','Normalized','Style','text','String','I','Position',[0.4,0.5,0.1,0.1],'Enable','inactive');
J = uicontrol('Parent',f,'Units','Normalized','Style','text','String','J','Position',[0.5,0.5,0.1,0.1],'Enable','inactive');
K = uicontrol('Parent',f,'Units','Normalized','Style','text','String','K','Position',[0.6,0.5,0.1,0.1],'Enable','inactive');
L = uicontrol('Parent',f,'Units','Normalized','Style','text','String','L','Position',[0.7,0.5,0.1,0.1],'Enable','inactive');
M = uicontrol('Parent',f,'Units','Normalized','Style','text','String','M','Position',[0.2,0.4,0.1,0.1],'Enable','inactive');
N = uicontrol('Parent',f,'Units','Normalized','Style','text','String','N','Position',[0.3,0.4,0.1,0.1],'Enable','inactive');
O = uicontrol('Parent',f,'Units','Normalized','Style','text','String','O','Position',[0.4,0.4,0.1,0.1],'Enable','inactive');
P = uicontrol('Parent',f,'Units','Normalized','Style','text','String','P','Position',[0.5,0.4,0.1,0.1],'Enable','inactive');
Q = uicontrol('Parent',f,'Units','Normalized','Style','text','String','Q','Position',[0.6,0.4,0.1,0.1],'Enable','inactive');
R = uicontrol('Parent',f,'Units','Normalized','Style','text','String','R','Position',[0.7,0.4,0.1,0.1],'Enable','inactive');
S = uicontrol('Parent',f,'Units','Normalized','Style','text','String','S','Position',[0.2,0.3,0.1,0.1],'Enable','inactive');
T = uicontrol('Parent',f,'Units','Normalized','Style','text','String','T','Position',[0.3,0.3,0.1,0.1],'Enable','inactive');
U = uicontrol('Parent',f,'Units','Normalized','Style','text','String','U','Position',[0.4,0.3,0.1,0.1],'Enable','inactive');
V = uicontrol('Parent',f,'Units','Normalized','Style','text','String','V','Position',[0.5,0.3,0.1,0.1],'Enable','inactive');
W = uicontrol('Parent',f,'Units','Normalized','Style','text','String','W','Position',[0.6,0.3,0.1,0.1],'Enable','inactive');
X = uicontrol('Parent',f,'Units','Normalized','Style','text','String','X','Position',[0.7,0.3,0.1,0.1],'Enable','inactive');
Y = uicontrol('Parent',f,'Units','Normalized','Style','text','String','Y','Position',[0.2,0.2,0.1,0.1],'Enable','inactive');
Z = uicontrol('Parent',f,'Units','Normalized','Style','text','String','Z','Position',[0.3,0.2,0.1,0.1],'Enable','inactive');
dash =uicontrol('Parent',f,'Units','Normalized','Style','text','String','---','Position',[0.4,0.2,0.1,0.1],'Enable','inactive');
one = uicontrol('Parent',f,'Units','Normalized','Style','text','String','1','Position',[0.5,0.2,0.1,0.1],'Enable','inactive');
two = uicontrol('Parent',f,'Units','Normalized','Style','text','String','2','Position',[0.6,0.2,0.1,0.1],'Enable','inactive');
three = uicontrol('Parent',f,'Units','Normalized','Style','text','String','3','Position',[0.7,0.2,0.1,0.1],'Enable','inactive');
four = uicontrol('Parent',f,'Units','Normalized','Style','text','String','4','Position',[0.2,0.1,0.1,0.1],'Enable','inactive');
five = uicontrol('Parent',f,'Units','Normalized','Style','text','String','5','Position',[0.3,0.1,0.1,0.1],'Enable','inactive');
six = uicontrol('Parent',f,'Units','Normalized','Style','text','String','6','Position',[0.4,0.1,0.1,0.1],'Enable','inactive');
seven = uicontrol('Parent',f,'Units','Normalized','Style','text','String','7','Position',[0.5,0.1,0.1,0.1],'Enable','inactive');
eight = uicontrol('Parent',f,'Units','Normalized','Style','text','String','8','Position',[0.6,0.1,0.1,0.1],'Enable','inactive');
nine = uicontrol('Parent',f,'Units','Normalized','Style','text','String','9','Position',[0.7,0.1,0.1,0.1],'Enable','inactive');

set([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,dash,one,two,three,four,five,six,seven,eight,nine],'FontName','Arial','FontSize',60,'ForegroundColor',[0.75 0.75 0.75],'BackgroundColor',[1 1 1]);

movegui(f,'center');
set(f,'Visible','on');

end