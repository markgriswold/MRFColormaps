function CMap = mrfT2(customMap)
%MRFT2    loads the T2 colormaps for magnetic resonance finterprinting
%   MRFT2() returns an M-by-3 matrix containing a T2 colormap optimized
%   for magnetic resonance fingerprinting as introduced by 
%   Griswold et al at ISMRM 2018
%   
%   MRFT2(customMap) loads one of the given variations of the T2 colormaps,
%   according to Obmann et al at ISMRM 2019. Possitble custom maps are:
%       'T2cm','T2_v1','T2_v2','T2_v3'
%
%   This function can be passed directly to the colormap method of matlab
%   
%       colormap(mrfT2);
%       colormap(mrfT2('T2_v1'));
%
%   See also COLORMAP

    % define which .mat file to load
    if (nargin < 1) || (isnumeric(customMap))
        mapFile = 'T2cm.mat';
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
