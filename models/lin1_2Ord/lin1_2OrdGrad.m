function [strf,g,savedStimFft]=lin1_2OrdGrad(strf,datIdx,savedStimFft)
%function [strf, g,savedStimFft] = linGrad(strf, datIdx, savedStimFft)
%
% Evaluate gradient of error function for generalized linear model.
%
% Takes a generalized linear model data structure [strf]
% and evaluates the gradient [g] of the error
% function with respect to the network weights. The error function
% corresponds to the choice of output unit activation.  If [savedStimFft]
% is included as an input, the gradient will be evaluated using a fourier domain 
% technique.  Alternatively, this method may be chosen by setting strf.fourierdoman = 1.
% 
% 
%
% INPUT:	
%			[strf] = a linear STRF structure (see linInit for fields)
%			[datIdx] = a set of indices into the global [stim] matrix. 
%   [savedStimFft] = (optional) the Fourier transform of the stimulus, which is
%   				 sometimes saved and which makes Fourier domain calculations of the grad
%   				 much faster.
%
% OUTPUT:
%			[strf] = unmodified STRF structure.
%			   [g] = a 1x(D*L) vector giving the gradient of the error function. 
%					 D=dimensions of stimulus, L=number of delays specified in strf.delays
%   [savedStimFft] = (optional) if the fourier-based gradient has been selected, will contain
%					 the Fourier transform of the stimulus.
%
%
%	SEE ALSO
%	linInit, linPak, linUnpak, linFwd, linErr, linGradFourierDomain, linGradTimeDomain
%
%(Some code modified from NETLAB)

global globDat;

savedStimFft = 'Not used';
g=lin1_2OrdGradTimeDomain(strf,datIdx);


