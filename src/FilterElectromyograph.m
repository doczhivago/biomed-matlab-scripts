% Sample script to filter an analog voltage EMG signal recorded from the tibialas anterior muscle. 
% The EMG is first high pass filtered, demeaned, rectified and then low pass filtered using a digital 4th order Butterworth filters. 
% The Butterworth filters are designed using the function “butter”. The high pass filter frequency is typically 40 Hz, but can range from 15-50 Hz. The low pass filter frequency is typically 3-4 Hz. The function "filtfilt" implies the filters designed by the "butter" function, whose coefficients are stored in the a,b,A, and B variables. 
% The thin green line is the fully filtered signal, and is ready for further processing. 

% Simulated EMG signal
EMG_RTA = randn(1000,1);

% EMG analog sampling frequency
fa=2000;
highfreq=40;
lowfreq=4;

% Filters
[b,a] = butter(4, highfreq/fa*2, 'high'); % High-pass filtering
[B,A] = butter(4, lowfreq/fa*2, 'low');   % Low-Pass filtering

% Apply Highpass filter -> Demeaned -> Rectified -> Lowpass filtered of EMGs
fRTA=10000*filtfilt(B,A,abs(filtfilt(b,a,EMG_RTA)-mean(filtfilt(b,a,EMG_RTA))));