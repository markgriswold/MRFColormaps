function CMap = mrfT1(customMap)
%MRFT1    loads the T1 colormaps for magnetic resonance finterprinting
%   MRFT1() returns an M-by-3 matrix containing a T1 colormap optimized
%   for magnetic resonance fingerprinting as introduced by 
%   Griswold et al at ISMRM 2018
%   
%   MRFT1(customMap) loads one of the given variations of the T1 colormaps,
%   according to Obmann et al at ISMRM 2019. Possitble custom maps are:
%       'T1cm','T1_v1','T1_v2','T1_v3'
%
%   This function can be passed directly to the colormap method of matlab
%   
%       colormap(mrfT1);
%       colormap(mrfT1('T2_v1'));
%
%   See also COLORMAP

    % define which .mat file to load
    if (nargin < 1)
        mapFile = 'T1cm.mat';
    else
        mapFile = customMap;
    end
    
    % load mat file and get fields
    try
        map = load(mapFile);
    catch
        map = load(fullfile('Obmann et al', mapFile));
    end
    mapFields = fields(map);
    
    % assign to output
    CMap = map.(mapFields{1});
end
