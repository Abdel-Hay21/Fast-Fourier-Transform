function T = fft_types(type)

switch type
    case 'double'
        T.signal_in_time = double([]);
        T.x_stage1 = double([]);
        T.x_stage2 = double([]);
        T.x_stage3 = double([]);
        T.W = double([]);

    case 'single'
        T.signal_in_time = single([]);
        T.x_stage1 = single([]);
        T.x_stage2 = single([]);
        T.x_stage3 = single([]);
        T.W = single([]);


     case 'fixed_point'  
         T.signal_in_time = fi([], 1, 5 + 7, 7);
         T.x_stage1 = fi([], 1, 6 + 6, 6);
         T.x_stage2 = fi([], 1, 7 + 5, 5);
         T.x_stage3 = fi([], 1, 8 + 4, 4);
         T.W = fi([], 1, 5 + 7, 7);
end

end

