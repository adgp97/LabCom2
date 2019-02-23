
function [t,x,fs] = unrz(bits, bitrate)
% UNRZ Encode bit string using unipolar NRZ code.
%   [T, X] = UNRZ(BITS, BITRATE) encodes BITS array using unipolar NRZ
%   code with given BITRATE. Outputs are time T and encoded signal
%   values X.

T = length(bits)/bitrate; % full time of bit sequence
fs = 1000;
N = fs*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t)); % output signal
for i = 0:length(bits)-1
  if bits(i+1) == 1
    x(i*fs+1:(i+1)*fs) = 1;
  else
    x(i*fs+1:(i+1)*fs) = 0;
  end
end