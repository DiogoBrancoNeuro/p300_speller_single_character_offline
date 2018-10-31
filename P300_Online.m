function P300_Online()

% Online presentation of single character Speller with directional stimuli

letter=0; % keeps counts of how many letters/commands were presented
ISI=0.075; % 75ms
colour_vector=[0 0 0]; % flash colour, black in this case!
flashtime=0.1; % 100ms
target=0;
prev_rand_vector=zeros(36,1);

output=strcat('No command entered');
%output=strcat('UWI2013');

set_param('P300_Speller/BCI/START SIGNAL','Value','0');
set_param('P300_Speller/BCI/TARGET','Value','0');
set_param('P300_Speller/BCI/FLASH','Value','0');
f = figure('Interruptible','on','HandleVisibility','callback','Menubar','none','Visible','off','Name','The University of the West Indies Brain-Computer Interface Group: P300 Speller Stimulus Presentation Paradigm','Units','Normalized','Position',[0,0,0.8,0.8],'Toolbar','none','NumberTitle','off');
set(f,'CloseRequestFcn',@close_function);

output_label=uicontrol('Parent',f,'Units','Normalized','Style','text','String','Command History:','Position',[0.05,0.89,0.25,0.06],'FontName','Arial','ForegroundColor',[0 0 0],'BackgroundColor',[1 1 1],'FontSize',25,'HorizontalAlignment','right');
output_commands=uicontrol('Parent',f,'Units','Normalized','Style','popupmenu','String',output,'Position',[0.30,0.85,0.6,0.1],'FontName','Arial','ForegroundColor',[0 0 0],'BackgroundColor',[1 1 1],'FontSize',25);
hbutton = uicontrol('Parent',f,'Style','pushbutton','Units','Normalized','String','START','Position',[0.35,0.01,0.2,0.05],'callback',@hbutton_callback);
hbutton2 = uicontrol('Parent',f,'Style','pushbutton','Units','Normalized','String','EXPORT OUTPUT TO ROBOT','Position',[0.6,0.01,0.2,0.05],'callback',@hbutton2_callback);
hbutton3 = uicontrol('Parent',f,'Style','pushbutton','Units','Normalized','String','BACKSPACE','Position',[0.2,0.01,0.1,0.05],'callback',@hbutton3_callback);

t=tcpip('192.168.31.142',4001,'LocalPort',4000);

    function close_function(source,eventdata)
        set_param('P300_Speller/BCI/START SIGNAL','Value','1');
        set_param('P300_Speller','SimulationCommand','continue');
        clear global % Clear global variables on closing the GUI window
        delete(f);
        fclose(t);
        delete(t);
        echotcpip('off');
        myWait(4);
        evalin('base','save(date)'); % Save data in workspace immediately after data collection
    end

    function hbutton2_callback(source,eventdata)
        if strcmp(t.Status,'closed')
            fopen(t);
        end
        
        fprintf(t,output);
    end

    function hbutton3_callback(source,eventdata)
        if ~strcmp(output,'No command entered')
            output=output(1:end-1);
        end
        
        if isempty(output)
            output='No command entered';
        end
        
        set(output_commands,'String',output);
    end

    function hbutton_callback(source,eventdata)
        
        set(hbutton,'Visible','off'); % Disable START BUTTON during presentation
        set(hbutton2,'Visible','off'); % Disable START BUTTON during presentation
        set(hbutton3,'Visible','off'); % Disable START BUTTON during presentation
        set(hbutton,'String','CONTINUE');
        set_param('P300_Speller','SimulationCommand','continue');
        myWait(3);
        
        trials=5;
        
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
        
        letter=letter+1;
        myWait(2);
        set_param('P300_Speller','SimulationCommand','pause'); % stop simulink EEG capture so we can classify one letter
        myWait(4); % wait for y to enter workspace after pausing simulink model, wasteful find more efficient techniques!
        evalin('base','a=y'); % Make matrix global and hence accessible to GUI
        evalin('base','global a'); % Make matrix global and hence accessible to GUI
        evalin('base','global w'); % Make matrix global and hence accessible to GUI
        global a; % Import 'a' to GUI workspace
        global w; % Import 'w' to GUI workspace
        
        classified_command=online_classify(a,trials,trials,w,letter,16,2); % classify letter after number of trials for one letter
        
        if(strcmp(output,'No command entered'))
            output=classified_command;
        else
            output=strcat(output,classified_command);
        end
        set(output_commands,'String',output); % add this letter to the top of the popup menu that holds command history
        
        evalin('base','clear a');  % clear base workspace variable y
        evalin('base','b=w');  % clear base workspace variable y
        clear global
        evalin('base','w=b, clear b');  % clear base workspace variable y
        clear a % clear GUI workspace variable y
        
        set(hbutton,'Visible','on'); % Make start/continue button visible again
        set(hbutton2,'Visible','on'); % Make start/continue button visible again
        set(hbutton3,'Visible','on'); % Make start/continue button visible again
        
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