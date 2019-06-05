function VLFeat_init(setup_m)
    %{
    %   @ brief          VLFeat library initialize
    %   @param[in]    setup_m : location that store the setup.m
    %   @ return        none
    %} 
    if isfile(setup_m)
        run(setup_m);
    else
        error(['CV Team#22 : Couldn'' find vl_setup please do the following step'...
                    '1. Download http://www.vlfeat.org/download/vlfeat-0.9.21-bin.tar.gz', ...
                    '2. Set your own path in the variable setup_m in "line 7"']);
    end
end