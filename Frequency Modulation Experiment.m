% Frequency Modulation !
function error = fm_experiment()
        


        clear all;
        clc;
        %message_choice = input('1 = Sine Wave OR 2 = Cos Wave for message signal: ');
        %Am = input('Amplitude of Message signal: ');
        %fm = input('Frequency of message signal: ');
        %Ac = input('Amplitude of Carrier Wave: ');
        %fc = input('Frequency of Carrier Wave: ');
        %theeta = input('Phase difference in degrees: ');
        %kf = input('Enter frequency Sensitivity: ');
        jump_activated = 0;
        message_choice = 2;
        Am = 1;
        Ac = 5;
        fm = 1;
        fc = 1;
        kf = 10;
        
        
        output_matrix = [0 : 100000];
        sin_mat = [0 : 100000];
        
        t3 = 1;
        
                for t2 = 0 : 0.0001 :10
                    
                    
                    
                    if message_choice == 1
                        
                        phiit = 2 * pi * fc * t2 + ( ( kf * Am * sin(2 * pi * fm * t2) ) / fm);
                        sin_mat(t3) = Am * sin(2 * pi * fm * t2);
                    elseif message_choice == 2
                        
                        phiit = 2 * pi * fc * t2 + ( ( kf * Am * cos(2 * pi * fm * t2) ) / fm);
                        sin_mat(t3) = Am * cos(2 * pi * fm * t2);
                    else
                        jump_activated = 1;
                    
                    end
                    
                
                    %disp(phiit);
                    output_matrix(t3) = Ac * cos(phiit);
                    %disp(phiit);
                    t3 = t3 +1;


                end
         

        
        if jump_activated == 0
            
            
        t = [0 : 100000];    
        
        %disp(output_matrix);
        %disp(t);
        plot(t,output_matrix,t,sin_mat);
        
        end
        
end